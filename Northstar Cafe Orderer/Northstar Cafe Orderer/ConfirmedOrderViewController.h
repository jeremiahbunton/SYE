//
//  ConfirmedOrderViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 3/9/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderConfirmationViewController.h"
#import "MenuItem.h"


@interface ConfirmedOrderViewController : UIViewController

@property (nonatomic, strong) MenuItem *menuItem;

@property (nonatomic, strong) NSString *user;

@end
