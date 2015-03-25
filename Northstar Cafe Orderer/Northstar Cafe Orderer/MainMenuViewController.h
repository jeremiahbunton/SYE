//
//  MainMenuViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"
#import "ItemViewController.h"

@interface MainMenuViewController : UIViewController


@property NSDictionary *dictionary;
@property Menu *menu;
@property (nonatomic, strong) NSString *user;


@end
