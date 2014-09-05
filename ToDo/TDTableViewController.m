//
//  TDTableViewController.m
//  ToDo
//
//  Created by Marc Baselga on 19/09/13.
//  Copyright (c) 2013 Marc Baselga  Garriga. All rights reserved.
//

#import "TDTableViewController.h"
#import "TDViewController.h"


@interface TDTableViewController ()

@end

@implementation TDTableViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    TDViewController*c =[[TDViewController alloc]init];
//    NSMutableDictionary*ToBuyDic = c.toBuyDictionary;
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section==0){
        int size = [[TDViewController toBuyDictionaryMethod] count];
        return  size;
    }
    if(section ==1){
        int size = [[TDViewController toDoDictionaryMethod] count];
        return  size;
    }
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"To Buy";
    if(section == 1)
        return @"To Do";
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    NSMutableArray*array1 = [TDViewController toBuyDictionaryMethod];
    NSMutableArray*array2 = [TDViewController toDoDictionaryMethod];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }//end for loop

    if (indexPath.section==0) {
        NSArray *theCellData = [array1 objectAtIndex:indexPath.row];
        NSString*item = [theCellData objectAtIndex:0];
        NSString*detail = [theCellData objectAtIndex:1];
        cell.textLabel.text = item;
        cell.detailTextLabel.text = detail;
    }
    else{
        NSArray *theCellData = [array2 objectAtIndex:indexPath.row];
        NSString*item = [theCellData objectAtIndex:0];
        NSString*detail = [theCellData objectAtIndex:1];
        cell.textLabel.text = item;
        cell.detailTextLabel.text = detail;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 20, 25);
    [btn setTitle:@"Main Menu" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    
    tableView.tableFooterView = btn;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        // Navigation logic may go here. Create and push another view controller.
        /*
         <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
         // ...
         // Pass the selected object to the new view controller.
         [self.navigationController pushViewController:detailViewController animated:YES];
         */
 UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString*item = cell.textLabel.text;
        NSString*detail = cell.detailTextLabel.text;
        NSString*info = [NSString stringWithFormat:@"Item: %@. Detail: %@",item,detail];
        
        
UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Selection" message:info delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
        
    
        
  
        
        
      

}

-(void)myAction:(id)sender{
         
        [self dismissViewControllerAnimated:YES completion:^{
            
            NSLog(@"It has been dismissed");
        }];
         
      
    
}


@end
