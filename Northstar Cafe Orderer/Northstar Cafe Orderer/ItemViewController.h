//
//  ItemViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"
#import "OrderConfirmationViewController.h"
#import "ConfirmedOrderViewController.h"

@interface ItemViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>


@property Menu* menu;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSString* test;
@property (nonatomic, strong) NSString *user;

-(void)setM:(Menu*)mainMenu;
@end
