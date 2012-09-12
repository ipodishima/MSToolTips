//
//  LocalFileViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "LocalFileViewController.h"

@interface LocalFileViewController ()

@end

@implementation LocalFileViewController
@synthesize textView = _textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[DownloadManager shared] loadLocalFileName:@"File" withDelegate:self];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - DownloadDelegate

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.localizedDescription
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // This is where you should parse the array or dictionary into objects.
    // Please note that to avoid blocking the main thread, this SHOULD be done in a separate thread
    // Why not creating an other NSOperation which parse the data?
    
    _textView.text = [object description];
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    NSLog(@"We started!");
}

@end
