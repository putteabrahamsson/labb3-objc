//
//  TodoTableViewCell.m
//  labb2
//
//  Created by Putte on 2020-01-21.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

//Synthesizing the strings.
@synthesize todoItem = _todoItem;
@synthesize date = _date;
@synthesize priority = _priority;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
