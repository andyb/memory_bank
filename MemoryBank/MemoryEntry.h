//
//  Memory.h
//  MemoryBank
//
//  Created by Andy Britcliffe on 06/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface MemoryEntry : NSObject
@property (nonatomic,strong) NSString* note;
@property (nonatomic,strong) NSDictionary* tags;
@property (nonatomic,strong) UIColor* bgColour;
@property (nonatomic,strong) NSDate* createdAt;
@property (nonatomic,strong) NSMutableArray* pictures;
+(MemoryEntry*)initFromDictionary:(NSDictionary*)dict;
+(MemoryEntry*)initWithNote:(NSString*)note;
@end
