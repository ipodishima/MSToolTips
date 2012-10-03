//
//  DebuggerDetailViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 03/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBYouTubePlayerViewController.h"

@class YouTubeVideo;

@interface DebuggerDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@property (nonatomic, strong) YouTubeVideo *video;

@end
