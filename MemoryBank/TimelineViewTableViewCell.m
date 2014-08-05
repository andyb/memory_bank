//
//  TimelineViewTableViewCell.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 23/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "TimelineViewTableViewCell.h"

@implementation TimelineViewTableViewCell

- (void)setTitle:(NSString *)Title {
    _Title = Title;
    self.timelineLabel.text = self.Title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
