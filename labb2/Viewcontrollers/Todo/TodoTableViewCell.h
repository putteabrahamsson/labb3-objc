//
//  TodoTableViewCell.h
//  labb2
//
//  Created by Putte on 2020-01-21.
//  Copyright © 2020 Putte. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *todoItem;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (nonatomic) NSString *priority;

@end

NS_ASSUME_NONNULL_END
