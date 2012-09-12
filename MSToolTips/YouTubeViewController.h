//
//  YouTubeViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTubeManager.h"
#import "LBYouTubePlayerViewController.h"

@class YouTubeVideo;

@interface YouTubeViewController : UIViewController <YouTubeManagerDelegate, LBYouTubePlayerControllerDelegate>
{
    YouTubeVideo *_currentVideoDisplayed;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfViewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfVideosLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;

@end
