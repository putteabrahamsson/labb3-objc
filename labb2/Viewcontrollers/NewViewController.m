//
//  NewViewController.m
//  labb2
//
//  Created by Putte on 2020-01-20.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "NewViewController.h"
#import "DataHolder.h"

@interface NewViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UISwitch *prioritySwitch;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//Button to create a new TODO.
- (IBAction)addNewTodo:(id)sender {
    
    //Create an alert to avoid empty textfields
    //<------- TODO ------>
    
    //Retrieve array from UserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _data = [[defaults objectForKey:@"arrayData"] mutableCopy];
    
    //Check if array is empty and initialize it.
    if(self.data == nil){
        _data = [[NSMutableArray alloc] init];
    }
    
    //Retrieve current date & time.
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateText = [dateFormatter stringFromDate:[NSDate date]];
    
    //Set the priority of the TODO.
    NSString *prior = @"NO";
    if(_prioritySwitch.isOn){
        prior = @"YES";
    }
    
    //Create a NSDictionary for storing data
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    dictionary = @{
        @"todoKey": _inputText.text,
        @"dateKey": dateText,
        @"priorKey": prior,
    };
    
    //Adding the dictionary to an NSMutableArray.
    [_data addObject:dictionary];
    
    //Save data in userdefaults
    [self saveInUserDefaults];
    
    //Closing current viewcontroller
    [self.navigationController popViewControllerAnimated:YES];
}

//Save data in NSUserDefaults.
- (void) saveInUserDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_data forKey:@"arrayData"];
    [defaults synchronize];
}

@end
