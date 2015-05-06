//
//  ItemViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "OrderConfirmationViewController.h"
#import "ConfirmedOrderViewController.h"

@interface ItemViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>


@property NSMutableArray* menu;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *menuName;

@property NSString* test;
@property (nonatomic, strong) NSString *user;

@end
