//
//  OrderConfirmationViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 1/23/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"
#import "ConfirmedOrderViewController.h"

@interface OrderConfirmationViewController : UIViewController  <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextView *orderConfirmationView;
@property (weak, nonatomic) IBOutlet UITextField *extrasInputTextField;

@property NSMutableString *order;

@property (nonatomic,strong) MenuItem *menuItem;
@property (nonatomic, strong) NSString *user;



-(BOOL) textFieldShouldReturn:(UITextField *)textField;



@end
