//
//  TimelineViewController.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 23/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMemoryViewController.h"

@interface TimelineViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,AddMemoryViewControllerDelegate> {
}

@property (nonatomic,strong) NSMutableArray* months;

@end
