//
//  DataHolder.m
//  labb2
//
//  Created by Putte on 2020-01-22.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

@synthesize todo;
@synthesize date;
@synthesize prior;
@synthesize isDone;

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:todo forKey:@"todo"];
    [coder encodeObject:date forKey:@"date"];
    [coder encodeBool:prior forKey:@"prior"];
    [coder encodeBool:isDone forKey:@"isDone"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if(self = [super init]) {
        self.todo = [coder decodeObjectForKey:@"todo"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.prior = [coder decodeBoolForKey:@"prior"];
        self.isDone = [coder decodeBoolForKey:@"isDone"];
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
