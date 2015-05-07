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
#import "AWSOrder.h"

//#import <AWSDynamoDB/AWSDynamoDB.h>
//#import <AWSCore/AWSCore.h>

@interface OrderConfirmationViewController : UIViewController  <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextView *orderConfirmationView;
@property (weak, nonatomic) IBOutlet UITextField *extrasInputTextField;

@property NSMutableString *order;

@property (nonatomic,strong) MenuItem *menuItem;
@property (nonatomic, strong) AWSOrder *orderObj;
@property (nonatomic, strong) NSString *user;


-(BOOL) textFieldShouldReturn:(UITextField *)textField;

- (IBAction)confirmOrder:(id)sender;



@end
