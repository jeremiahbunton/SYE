//
//  ItemViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "ItemViewController.h"
#import "AWSBreakfastMenu.h"
#import "AWSFryerMenu.h"
#import "AWSWrapsMenu.h"

@interface ItemViewController ()

@end

@implementation ItemViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _menu = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    
    
    
    if ([_menuName isEqualToString:@"breakfastMenu"]) {
        [self getBreakfastMenu];
    }
    
    else if ([_menuName isEqualToString:@"fryerMenu"]) {
        [self getFryerMenu];
    }
    
    else if ([_menuName isEqualToString:@"wrapsMenu"]) {
        [self getWrapsMenu];
    }
    
}



-(void)getBreakfastMenu
{
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
    scanExpression.limit = @10;
    
    [[dynamoDBObjectMapper scan:[AWSBreakfastMenu class]
                     expression:scanExpression]
     continueWithBlock:^id(BFTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         }
         if (task.exception) {
             NSLog(@"The request failed. Exception: [%@]", task.exception);
         }
         if (task.result) {
             AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
             _menu = [[NSMutableArray alloc]init];
             
             for (AWSBreakfastMenu *awsBreakfastMenuItem in paginatedOutput.items) {
                 MenuItem *item = [[MenuItem alloc] initWithName:awsBreakfastMenuItem.name price:awsBreakfastMenuItem.price andDescription:awsBreakfastMenuItem.ingredients];
                 [_menu addObject:item];
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
             });
         }
         return nil;
     }];

}


-(void)getWrapsMenu
{
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
    scanExpression.limit = @10;
    
    [[dynamoDBObjectMapper scan:[AWSWrapsMenu class]
                     expression:scanExpression]
     continueWithBlock:^id(BFTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         }
         if (task.exception) {
             NSLog(@"The request failed. Exception: [%@]", task.exception);
         }
         if (task.result) {
             AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
             _menu = [[NSMutableArray alloc]init];
             
             for (AWSWrapsMenu *awsWrapsMenuItem in paginatedOutput.items) {
                 MenuItem *item = [[MenuItem alloc] initWithName:awsWrapsMenuItem.name price:awsWrapsMenuItem.price andDescription:awsWrapsMenuItem.ingredients];
                 [_menu addObject:item];
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
             });
         }
         return nil;
     }];
    
}




-(void)getFryerMenu
{
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
    scanExpression.limit = @10;
    
    [[dynamoDBObjectMapper scan:[AWSFryerMenu class]
                     expression:scanExpression]
     continueWithBlock:^id(BFTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         }
         if (task.exception) {
             NSLog(@"The request failed. Exception: [%@]", task.exception);
         }
         if (task.result) {
             AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
             _menu = [[NSMutableArray alloc]init];
             
             for (AWSFryerMenu *awsFryerMenuItem in paginatedOutput.items) {
                 MenuItem *item = [[MenuItem alloc] initWithName:awsFryerMenuItem.name price:awsFryerMenuItem.price andDescription:awsFryerMenuItem.ingredients];
                 [_menu addObject:item];
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
             });
         }
         return nil;
     }];
    
}





// Must have this method implemented to tell the UITableView how many rows it needs to prepare for.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"printing the number of items in the menu +++++++++++++");
    NSLog(@"%lu", (unsigned long)[_menu count]);
    return [_menu count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Get each menuItem for each row
    MenuItem *item = [_menu objectAtIndex:indexPath.row];
    //NSLog(@"Printing menuItem ++++++++++++++");
    //[item toString];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.price;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    OrderConfirmationViewController *ocvc = [segue destinationViewController];
    
    [ocvc setMenuItem:[_menu objectAtIndex:indexPath.row]];
    [ocvc setUser:_user];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
