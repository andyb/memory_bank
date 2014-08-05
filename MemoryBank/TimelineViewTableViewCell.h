//
//  TimelineViewTableViewCell.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 23/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timelineLabel;
@property (nonatomic, strong) NSString* Title;
@end
