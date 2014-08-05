//
//  ViewController.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 03/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoryBankTableViewCell.h"
#import "MemoryEntry.h"
#import "MemoryBankViewController.h"
#import "AddMemoryViewController.h"

@interface MemoryListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, AddMemoryViewControllerDelegate> {
}

@property IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray* recentMemories;

@end
