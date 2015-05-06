//
//  MainMenuViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "AWSBreakfastMenu.h"
#import "ItemViewController.h"

@interface MainMenuViewController : UIViewController


@property NSString *menuName;
@property (nonatomic, strong) NSString *user;

//- (NSMutableArray*)getBreakfastMenu;
- (IBAction)breakfastButton:(id)sender;
- (IBAction)fryerButton:(id)sender;
- (IBAction)deliButton:(id)sender;
- (IBAction)wrapsButton:(id)sender;
- (IBAction)specialsButton:(id)sender;
- (IBAction)recentOrdersButton:(id)sender;

@end
