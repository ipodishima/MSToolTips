//
//  YouTubeManager.m
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "YouTubeManager.h"
#import "DownloadManager.h"
#import "YouTubeVideo.h"

@implementation YouTubeManager
@synthesize delegate = _delegate;
@synthesize youTubeUsername = _youTubeUsername;

- (id) init
{
    self = [super init];
    if (self) {
        _df = [[NSDateFormatter alloc] init];
        [_df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    }
    return self;
}

- (void) loadDataFromOffset:(NSInteger)offset
{
    // Build the parameters of the request
    NSString *parameters = [NSString stringWithFormat:@"alt=json&v=2&author=%@&max-result=%d&start-index=%d&orderby=published", self.youTubeUsername, YOUTUBE_PAGING_SIZE, offset];

    // Build the url (please the online documentation for YouTube APIs
    NSString *getPath = [YOUTUBE_BASE_URL stringByAppendingPathComponent:@"feeds/api/videos"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@?%@", getPath, parameters]];
    NSLog(@"load request with URL: %@", url);
    // Build the request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [[DownloadManager shared] loadRequest:request
                             withDelegate:self];

}

#pragma mark - DownloadDelegate

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    [self.delegate youTubeManager:self didFailWithError:error];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    //NSLog(@"%@", [object class]);
    if (![object isKindOfClass:[NSDictionary class]]) {
        // There is something wrong, create an error and abort
        [self.delegate youTubeManager:self didFailWithError:nil];
        return;
    }
    else
    {
        NSDictionary *jsonDic = (NSDictionary*)object;
        
        // get the code
        NSNumber *code = [jsonDic objectForKey:@"code"];
        
        if ([code integerValue] != 0) {
            // there's an error: TODO trigger and call the delegate
        }
        else
        {
            NSDictionary *feed = [jsonDic objectForKey:@"feed"];
            NSArray *videos = [feed objectForKey:@"entry"];
            
            NSMutableArray *finalArray = [[NSMutableArray alloc] init];
            
            // We parse the dictionary to create objects. This is an important steps, do not hesitate to NSLog(@"%@", jsonDic) to see what is happening
            // NSLog(@"%@", jsonDic);
            
            for (NSDictionary *dic in videos)
            {
                YouTubeVideo *y = [[YouTubeVideo alloc] init];
                y.url = [[dic objectForKey:@"content"] objectForKey:@"src"];
                y.title = [[dic objectForKey:@"title"] objectForKey:@"$t"];
                y.caption = [[[dic objectForKey:@"media$group"] objectForKey:@"media$description"] objectForKey:@"$t"];
                y.rating = [[[dic objectForKey:@"gd$rating"] objectForKey:@"average"] floatValue];
                y.nbViews = [[[dic objectForKey:@"yt$statistics"] objectForKey:@"viewCount"] integerValue];
                NSArray *thumbs = [[dic objectForKey:@"media$group"] objectForKey:@"media$thumbnail"];
                if (thumbs.count>= 2)
                    y.thumbnail = [[thumbs objectAtIndex:1] objectForKey:@"url"]; // we take mqdefault
                y.uploadedDate = [_df dateFromString:[[[dic objectForKey:@"media$group"] objectForKey:@"yt$uploaded"] objectForKey:@"$t"]];
                [finalArray addObject:y];
                y = nil;
            }
            
            // Tell delegate we have new objects
            [self.delegate youTubeManager:self didLoadVideos:finalArray];
            
        }
    }
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    [self.delegate youTubeManagerDidStartToLoad:self];
}

// This is one singleton implementation which use Grand Central Dispatch also know as GCD
#pragma mark - Singleton methods
+ (YouTubeManager*)shared
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

@end
