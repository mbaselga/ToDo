//
//  TDViewController.m
//  ToDo
//
//  Created by Marc Baselga on 15/09/13.
//  Copyright (c) 2013 Marc Baselga  Garriga. All rights reserved.
//

#import "TDViewController.h"
#import "TDTableViewController.h"
static NSMutableArray*toDoDictionaryArray = nil;
static NSMutableArray*toBuyDictionaryArray = nil;
@interface TDViewController ()
@property (strong,nonatomic) TDTableViewController*tableViewController;
@property (strong, nonatomic) IBOutlet UITextField *mainItemTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
- (IBAction)addToListButton:(id)sender;
- (IBAction)showListButton:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *switchController;



@end

@implementation TDViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    self.mainItemTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.descriptionTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    toBuyDictionaryArray = [[NSMutableArray alloc] init];
    toDoDictionaryArray =[[NSMutableArray alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToListButton:(id)sender {
    [self.mainItemTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    NSString*task = self.mainItemTextField.text;
    NSString*taskDescription = self.descriptionTextField.text;
    NSMutableArray*toBuy = [[NSMutableArray alloc] init];
    NSMutableArray*toDo = [[NSMutableArray alloc] init];
    
    
    
    if(self.switchController.selectedSegmentIndex==0){
        [toBuy addObject:task];
        [toBuy addObject:taskDescription];

        [toBuyDictionaryArray addObject:toBuy];
        NSLog(@"dictionary to Buy: %@", toBuyDictionaryArray);
        
        
    }
    else{
        [toDo addObject:task];
        [toDo addObject:taskDescription];
        [toDoDictionaryArray addObject:toDo];
        NSLog(@"dictionary to Do: %@", toDoDictionaryArray);
        
    }
    
}

- (IBAction)showListButton:(id)sender {
    [self.mainItemTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    self.tableViewController =[[TDTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    self.tableViewController.view.frame = self.view.bounds;
    
    [self presentViewController:self.tableViewController animated:YES completion:^{
        NSLog(@"ithas been presented");
        
    }];
}
- (IBAction)listSwitchController:(id)sender {

    
}
+ (NSMutableArray*)toDoDictionaryMethod{
    
    return toDoDictionaryArray;
    
}
+ (NSMutableArray*)toBuyDictionaryMethod{
    NSLog(@"dictionary to Buy in method: %@", toBuyDictionaryArray);
    return toBuyDictionaryArray;
   
    
}




@end
