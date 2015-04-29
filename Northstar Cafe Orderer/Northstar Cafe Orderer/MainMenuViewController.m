//
//  MainMenuViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()


@end

@implementation MainMenuViewController



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
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES];
    
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:@"us-east-1:f2fa75a7-72e1-4b0e-a91c-c6102bd033c6"];
    
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    
    /**
     dictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
     [[NSDictionary alloc] initWithObjectsAndKeys:
     [[NSDictionary alloc]initWithObjectsAndKeys:@"waffle", @"name", @2.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"waffle",
     [[NSDictionary alloc]initWithObjectsAndKeys:@"french toast", @"name", @4.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"french toast",
     [[NSDictionary alloc]initWithObjectsAndKeys:@"pancake", @"name", @3.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"pancake",
     nil],
     @"breakfast", nil];
     
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)breakfastButton:(id)sender
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
                 MenuItem *item = [[MenuItem alloc] initWithName:awsBreakfastMenuItem.name price:awsBreakfastMenuItem.price andDescription:awsBreakfastMenuItem.ingrediants];
                 [_menu addObject:item];
             }
             
             for (MenuItem *item in _menu) {
                 NSLog(item.toString);
             }
             [self performSegueWithIdentifier:@"toItemView" sender:self];
         }
         return nil;
     }];
    
    
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


-(void) setUser:(NSString *)user{
    
    _user = user;
}



//- (NSMutableArray*)getBreakfastMenu
//{
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
//
//    AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
//    scanExpression.limit = @10;
//
//    [[dynamoDBObjectMapper scan:[AWSBreakfastMenu class]
//                     expression:scanExpression]
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
//             for (AWSBreakfastMenu *awsBreakfastMenuItem in paginatedOutput.items) {
//                 MenuItem *item = [[MenuItem alloc] initWithName:awsBreakfastMenuItem.name price:awsBreakfastMenuItem.price andDescription:awsBreakfastMenuItem.ingrediants];
//                 [_menu addObject:item];
//             }
//
//             [self breakfastButton:self];
//         }
//         return nil;
//     }];
//
//    return nil;
//
//
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ItemViewController *ivc = [segue destinationViewController];
    
    [ivc setUser:_user];
    
    //    if ([[segue identifier] isEqualToString:@"breakfast"]) {
    ivc.menu = _menu;
    //    }
    //
    //
    //    else if ([[segue identifier] isEqualToString:@"fryer"]) {
    //        ivc.menu = [self getBreakfastMenu];
    //    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
