//
//  DebuggerDetailViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 03/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "DebuggerDetailViewController.h"

#import "YouTubeVideo.h"

@interface DebuggerDetailViewController ()

@end

@implementation DebuggerDetailViewController
@synthesize titleLabel = _titleLabel;
@synthesize captionLabel = _captionLabel;
@synthesize video = _video;

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

    LBYouTubePlayerViewController *c = [[LBYouTubePlayerViewController alloc] initWithYouTubeID:_video.youtubeID];
    c.quality = LBYouTubePlayerQualityLarge;
    c.view.frame = CGRectMake(0.0f, 0.0f, 320.0f, 270.0f);
    [self.view addSubview:c.view];
}

// Overriden Setter
- (void) setVideo:(YouTubeVideo *)video
{
    _video = video;
    _titleLabel.text = video.title;
    _captionLabel.text = video.caption;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLabel:nil];
    [self setCaptionLabel:nil];
    [super viewDidUnload];
}
@end
