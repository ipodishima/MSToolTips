//
//  YouTubeManager.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadDelegate.h"

// Some definitions
#define YOUTUBE_BASE_URL @"gdata.youtube.com"
#define YOUTUBE_PAGING_SIZE 16

@class YouTubeManager; // Ask yourself why is this line present?

@protocol YouTubeManagerDelegate <NSObject>
- (void) youTubeManagerDidStartToLoad:(YouTubeManager *)manager;
- (void) youTubeManager:(YouTubeManager *)manager didFailWithError:(NSError*)error;
- (void) youTubeManager:(YouTubeManager *)manager didLoadVideos:(NSArray*)videos;
@end

@interface YouTubeManager : NSObject <DownloadDelegate>
{
    // The date formatter for youtube videos
    NSDateFormatter *_df;
}
@property (nonatomic, assign) id <YouTubeManagerDelegate> delegate;
@property (nonatomic, strong) NSString *youTubeUsername;

+ (YouTubeManager*)shared;
- (void) loadDataFromOffset:(NSInteger)offset;

@end
