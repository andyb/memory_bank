//
//  MemoryPictures.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 28/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface MemoryPicture : NSObject
@property (nonatomic,strong) UIImage* pic;
@property (nonatomic,strong) PFFile* picFile;
@end
