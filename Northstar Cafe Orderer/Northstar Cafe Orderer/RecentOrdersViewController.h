//
//  RecentOrdersViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 5/6/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "AWSOrder.h"
#import "ConfirmedOrderViewController.h"
#import "OrderConfirmationViewController.h"
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface RecentOrdersViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *menu;
@property (nonatomic, strong) NSString *menuName, *user;

@end
