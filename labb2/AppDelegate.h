//
//  AppDelegate.h
//  labb2
//
//  Created by Putte on 2020-01-20.
//  Copyright © 2020 Putte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

