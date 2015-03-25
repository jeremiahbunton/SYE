//
//  ViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/11/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize username, password, users;





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    users = [[NSDictionary alloc] initWithObjectsAndKeys:@"password", @"jeremiah", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)login {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopps" message:@"Your username or password is invalid" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    if ([[users allKeys]containsObject:username.text]) {
        if ([[users objectForKey:username.text]isEqualToString:password.text]) {
                        
            [self performSegueWithIdentifier:@"loginToMainMenu" sender:self];
            
//            COVC.user = @"testUserName";
            //[COVC setUser:username.text];
            password.text = @"";
        }
        else
        {
            
            [alert show];
            password.text = @"";
        }
    }
    else
    {
        [alert show];
        password.text = @"";
    }
}


// Handles login when login button is pressed
- (IBAction)login:(id)sender {
    
    [self login];
}


// Handles login when return button is pressed
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
//    [self performSegueWithIdentifier:@"loginToMainMenu" sender:self];
//    
//    password.text = @"";

    
    [self login];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    MainMenuViewController *mmvc = [ segue destinationViewController];
    
    [mmvc setUser:username.text];
    
}




@end
