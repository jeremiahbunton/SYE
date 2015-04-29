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


@property MenuItem *menuItem;
@property NSMutableArray *menu;
@property (nonatomic, strong) NSString *user;

- (NSMutableArray*)getBreakfastMenu;
- (IBAction)breakfastButton:(id)sender;

@end
