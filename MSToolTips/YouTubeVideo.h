//
//  YouTubeVideo.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YouTubeVideo : NSObject
// The URL of the video as a string
@property (nonatomic, strong) NSString *url;
// Title of the video
@property (nonatomic, strong) NSString *title;
// The description of the video
@property (nonatomic, strong) NSString *caption;
// The thumbnail image URL as a string
@property (nonatomic, strong) NSString *thumbnail;
// The uploaded date for the video
@property (nonatomic, strong) NSDate *uploadedDate;
// The number of views
@property (nonatomic, assign) NSInteger nbViews;
// The rating (from 0 to 5)
@property (nonatomic, assign) float rating;
@end
