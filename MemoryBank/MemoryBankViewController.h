//
//  MemoryBankViewController.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 06/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoryEntry.h"

@interface MemoryBankViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) MemoryEntry* selectedMemory;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSMutableArray *pictures;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
