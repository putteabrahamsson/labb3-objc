//
//  TodoViewController.m
//  labb2
//
//  Created by Putte on 2020-01-20.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "TodoViewController.h"
#import "TodoTableViewCell.h"
#import "RowViewController.h"

@interface TodoViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//Mutable arrays
@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *doneData;

@end

@implementation TodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sections = [[NSMutableArray  alloc] init];
    
    //Adding two sections
    [_sections addObject:@"Pågående"];
    [_sections addObject:@"Klara"];
    
    //Delegate and datasource
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

-(void)viewDidAppear:(BOOL)animated{
    //Retrieving data from NSUserDefaults
    [self retrieveUserDefaults];
    
    //Reloading tableview data
    [_tableView reloadData];
}

//Retrieving data from NSUserDefaults
- (void) retrieveUserDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _data = [[defaults objectForKey:@"arrayData"] mutableCopy];
    _doneData = [[defaults objectForKey:@"doneData"] mutableCopy];
    
    //Check if "data" & "doneData" is not nil
    if(_data == nil){
        _data = [[NSMutableArray alloc] init];
    }
    if(_doneData == nil){
        _data = [[NSMutableArray alloc] init];
    }
}

//Tableview properties
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sections count];
}

//Title for the sections
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sections objectAtIndex:section];
}

//Number of rows in the section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return [_data count];
    }
    else{
        return [_doneData count];
    }
}

//Properties for tableview cell.
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Linking the cell class.
    NSString *cellId = @"cell";
    TodoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    //Adding the rows into the tableview depending on section.
    if(indexPath.section == 0){
        cell.todoItem.text = (self.data[indexPath.row])[@"todoKey"];
        cell.date.text = (self.data[indexPath.row])[@"dateKey"];
        
        //Check if row is priority & set background
    if([(self.data[indexPath.row])[@"priorKey"]isEqualToString:@"YES"]){
            cell.backgroundColor = [UIColor redColor];
        }
        else{
            cell.backgroundColor = [UIColor whiteColor];
        }
    }
    else{
        cell.todoItem.text = (self.doneData[indexPath.row])[@"todoKey"];
        cell.date.text = (self.doneData[indexPath.row])[@"dateKey"];
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

//User tapped on a row of the tableview.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        [self performSegueWithIdentifier:@"checkTodo" sender:indexPath];
    }
}

//Height for each row.
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83;
}

//Height for each section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

//Allow users to edit tableview row.
- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//When user slides on row to delete.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        if(indexPath.section == 0){
            [_data removeObjectAtIndex:indexPath.row];
            [self saveInUserDefaultsIfRemoved];
            [tableView reloadData];
        }
        else{
            [_doneData removeObjectAtIndex:indexPath.row];
            [self saveInUserDefaultsIfRemoved];
            [tableView reloadData];
        }
    }
}

//Save data in userdefaults when row is removed.
-(void) saveInUserDefaultsIfRemoved{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_data forKey:@"arrayData"];
    [defaults setObject:_doneData forKey:@"doneData"];
    [defaults synchronize];
}

//Preparing for a segue to be performed.
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //Pass data over to RowViewController
    if([segue.identifier  isEqual: @"checkTodo"]){
        
        RowViewController *vc = (RowViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        
        //Pass data to RowVC
        vc.todo = _data[indexPath.row][@"todoKey"];
        vc.date = _data[indexPath.row][@"dateKey"];
        vc.indexPath = indexPath;
        
    if([(self.data[indexPath.row])[@"priorKey"]isEqualToString:@"YES"]){
            vc.prior = @"Ja";
        }
        else{
            vc.prior = @"Nej";
        }
    }
}

//Presentating an information alert box
- (IBAction)infoBox:(id)sender {
    
    //Creating the alert.
    UIAlertController *alertvc=[UIAlertController alertControllerWithTitle:@"Information" message:@"Dra raden åt vänster för att ta bort en rad." preferredStyle:UIAlertControllerStyleAlert];
    
    //Creating a button to dismiss the alert.
    UIAlertAction * action = [UIAlertAction actionWithTitle: @ "Klar" style: UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull action) {}];
    
      //Adding the button to the alert
      [alertvc addAction: action];
    
    //Presentating the alert.
      [self presentViewController: alertvc animated: true completion: nil];

}

@end
