//
//  ViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/11/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"
#import "ConfirmedOrderViewController.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;

-(BOOL) textFieldShouldReturn:(UITextField *)textField;

@property NSDictionary *users;


@end
