//
//  RowViewController.h
//  labb2
//
//  Created by Putte on 2020-01-23.
//  Copyright © 2020 Putte. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RowViewController : UIViewController

@property (nonatomic) NSString  *todo;
@property (nonatomic) NSString  *date;
@property (nonatomic) NSString  *prior;
@property (nonatomic) NSIndexPath *indexPath;


@end

NS_ASSUME_NONNULL_END
