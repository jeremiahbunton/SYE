//
//  RecentOrdersViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 5/6/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "RecentOrdersViewController.h"

@implementation RecentOrdersViewController



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
    [self getRecentOrders];

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"printing the number of items in the menu +++++++++++++");
    return [_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Get each menuItem for each row
    AWSOrder *item = [_menu objectAtIndex:indexPath.row];
    //NSLog(@"Printing menuItem ++++++++++++++");
    //[item toString];
    
    cell.textLabel.text = item.orderName;
    cell.detailTextLabel.text = item.orderDates;
    
    return cell;
}


-(void)getRecentOrders
{
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
    scanExpression.limit = @100;
    
    [[dynamoDBObjectMapper scan:[AWSOrder class]
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
             
             for (AWSOrder *awsRecentOrderMenuItem in paginatedOutput.items) {
                 [_menu addObject:awsRecentOrderMenuItem];
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
             });
         }
         return nil;
     }];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    OrderConfirmationViewController *ocvc = [segue destinationViewController];
    
    AWSOrder *awsOrder = [_menu objectAtIndex:indexPath.row];
    
    MenuItem *menuItem = [[MenuItem alloc] initWithName:awsOrder.orderName price:awsOrder.price andDescription:awsOrder.order];
    
    ocvc.menuItem = menuItem;
    [ocvc setUser:_user];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}




@end
