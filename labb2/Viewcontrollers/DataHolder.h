//
//  DataHolder.h
//  labb2
//
//  Created by Putte on 2020-01-22.
//  Copyright © 2020 Putte. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataHolder : NSObject <NSCoding, NSCopying>

//Creating instance variables
@property(nonatomic, retain) NSString *todo;
@property(nonatomic, retain) NSString *date;
@property(nonatomic) bool *prior;
@property(nonatomic) bool *isDone;

@end

NS_ASSUME_NONNULL_END
