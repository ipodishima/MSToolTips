//
//  PerformanceCell.m
//  MSToolTips
//
//  Created by Marian Paul on 02/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "PerformanceCell.h"

@implementation PerformanceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) displayDataForRow:(NSInteger)row
{
    self.textLabel.text = [NSString stringWithFormat:@"This is the row %d", row];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY-MM-DD hh:mm"];
    self.detailTextLabel.text = [df stringFromDate:[NSDate dateWithTimeIntervalSinceNow:row*60.0]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
