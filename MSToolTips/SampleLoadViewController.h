//
//  SampleLoadViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 24/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

// 2)
// import Download manager
#import "DownloadManager.h"

@interface SampleLoadViewController : UITableViewController <DownloadDelegate> // 3) adopt the DownloadDelegate protocol
{
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfContacts;
}
@end
