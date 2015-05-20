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
    
    //    AWSDynamoDBQueryExpression *querryExpression = [AWSDynamoDBQueryExpression new];
    //    querryExpression.limit = @100;
    
    
    AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
    
    NSLog(_user);
    queryExpression.hashKeyValues = _user;
    //    queryExpression.indexName = @"orderDates";
    //    queryExpression.scanIndexForward = @NO;
    queryExpression.limit = @20;
    
    [[dynamoDBObjectMapper query:[AWSOrder class] expression:queryExpression] continueWithBlock:^id(BFTask *task) {
        if (task.result) {
            
            AWSDynamoDBPaginatedOutput *output = task.result;
            //        NSMutableArray *results = [NSMutableArray new];
            
            for (AWSOrder *awsRecentOrderMenuItem in output.items) {
                [_menu addObject:awsRecentOrderMenuItem];
                
                //            [results addObject:suggestion];
            }
            
            //        if (results.count > 0) {
            //            resultBlock(results, nil);
            //        } else {
            //            DDLogError(@"Error: [%@]", task.error);
            //            resultBlock(nil, task.error);
            //        }
            dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];});
        } else {
            NSLog(@"Error: [%@]", task.error);
            NSLog([task.error localizedDescription]);
        }
        return nil;
    }];
    
    
    //    [[dynamoDBObjectMapper load:[AWSOrder class] hashKey:_user rangeKey:nil]
    //     continueWithBlock:^id(BFTask *task) {
    //         if (task.error) {
    //             NSLog(@"The request failed. Error: [%@]", task.error);
    //         }
    //         if (task.exception) {
    //             NSLog(@"The request failed. Exception: [%@]", task.exception);
    //         }
    //         if (task.result) {
    //             AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
    //             _menu = [[NSMutableArray alloc]init];
    //
    //             for (AWSOrder *awsRecentOrderMenuItem in paginatedOutput.items) {
    //                 [_menu addObject:awsRecentOrderMenuItem];
    //             }
    //
    //             dispatch_async(dispatch_get_main_queue(), ^{[self.tableView reloadData];
    //             });
    //         }
    //         return nil;
    //     }];
    
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
