//
//  WineViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 02/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "WineViewController.h"

@interface WineOverlayView : UIView

@end

@interface WineViewController ()
{
    WineOverlayView *_overlay;
}
@end

@implementation WineViewController

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
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    _overlay = [[WineOverlayView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_overlay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end


@implementation WineOverlayView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    // Get the context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Build the path with triangle
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 0.0, 300.0);
    CGContextAddLineToPoint(context, 140.0, 300.0);
    CGContextAddLineToPoint(context, 160.0, 320.0);
    CGContextAddLineToPoint(context, 180.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 0.0);
    
    // Close it
    CGContextClosePath(context);
    // Set fill color with white
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Add some shadows
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 2.0), 5.0, [UIColor blackColor].CGColor);
    // Fill the path
    CGContextFillPath(context);
}

@end