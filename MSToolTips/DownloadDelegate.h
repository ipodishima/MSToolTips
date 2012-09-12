//
//  DownloadDelegate.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

// Do not import DownloadOperation header, use @class for a forward declaration
@class DownloadOperation;

@protocol DownloadDelegate <NSObject>
- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest*)request;
- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError*)error;
- (void) downloadOperation:(DownloadOperation *)operation didLoadDictionnary:(NSDictionnary*)dic;
@end
