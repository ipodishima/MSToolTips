//
//  LocalFileViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"

@interface LocalFileViewController : UIViewController <DownloadDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
