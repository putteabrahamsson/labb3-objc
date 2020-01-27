//
//  RowViewController.m
//  labb2
//
//  Created by Putte on 2020-01-23.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "RowViewController.h"

@interface RowViewController ()

//NSMutableArrays
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *doneData;

//Labels
@property (weak, nonatomic) IBOutlet UILabel *todoText;
@property (weak, nonatomic) IBOutlet UILabel *added;
@property (weak, nonatomic) IBOutlet UILabel *priority;

//Button
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation RowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Assigning textfields from strings.
    _todoText.text = _todo;
    _added.text = _date;
    _priority.text = _prior;
}

//Chaning the corner radius of a button when view will appear.
- (void)viewWillAppear:(BOOL)animated{
    _doneButton.layer.cornerRadius = 10;
}

//Button to change the done state.
- (IBAction)markAsDone:(id)sender {
    
    //Retrieve array from UserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _data = [[defaults objectForKey:@"arrayData"] mutableCopy];
    _doneData = [[defaults objectForKey:@"doneData"] mutableCopy];
    
    //Create a NSDictionary for storing data
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    dictionary = @{
        @"todoKey": _todo,
        @"dateKey": _date,
        @"priorKey": _prior,
    };
    
    //Check if doneData is nil and initialize the array.
    if(self.doneData == nil){
        _doneData = [[NSMutableArray alloc] init];
    }
    
    //Move object from _data to _doneData
    [_doneData addObject:dictionary];
    [_data removeObjectAtIndex:_indexPath.row];
    
    //Saving arrays in NSUserDefaults.
    [defaults setObject:_data forKey:@"arrayData"];
    [defaults setObject:_doneData forKey:@"doneData"];
    [defaults synchronize];
    
    //Closing current viewcontroller
     [self.navigationController popViewControllerAnimated:YES];
}

@end
