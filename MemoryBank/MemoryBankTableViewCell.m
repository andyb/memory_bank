//
//  MemoryBankTableViewCell.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 06/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "MemoryBankTableViewCell.h"

@interface MemoryBankTableViewCell ()
{
    
}
@property (nonatomic,strong) IBOutlet UILabel* nameLabel;

@end

@implementation MemoryBankTableViewCell

- (void)setTitle:(NSString *)Title {
    _Title = Title;
    self.nameLabel.text = self.Title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
