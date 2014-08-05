//
//  Memory.m
//  MemoryBank
//
//  Created by Andy Britcliffe on 06/03/2014.
//  Copyright (c) 2014 Andy Britcliffe. All rights reserved.
//

#import "MemoryEntry.h"

@implementation MemoryEntry


+(MemoryEntry*)initFromDictionary:(NSDictionary*)dict {
    MemoryEntry* newMemory = [[MemoryEntry alloc]init];
    //TODO - Fill Objct with dict
    
    return newMemory;
}

+(MemoryEntry*)initWithNote:(NSString *)note {
    MemoryEntry* m = [MemoryEntry initFromDictionary:nil];
    m.pictures = [[NSMutableArray alloc] init];
    m.note = note;
    m.tags = [[NSDictionary alloc] init];
    m.bgColour =  [UIColor colorWithRed:157/255.0 green:123/255.0 blue:161/255.0 alpha:1.0];
    return m;
}
@end

