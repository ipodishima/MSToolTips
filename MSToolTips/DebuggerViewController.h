//
//  DebuggerViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 03/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTubeManager.h"

@interface DebuggerViewController : UITableViewController <YouTubeManagerDelegate>
{
    NSMutableArray *_arrayToDisplay;
    UIActivityIndicatorView *_activity;
}
@end
