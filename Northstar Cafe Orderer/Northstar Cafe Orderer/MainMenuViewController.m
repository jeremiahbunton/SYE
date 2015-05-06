//
//  MainMenuViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()


@end

@implementation MainMenuViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES];
    
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:@"us-east-1:f2fa75a7-72e1-4b0e-a91c-c6102bd033c6"];
    
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)breakfastButton:(id)sender
{
    _menuName = @"breakfastMenu";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}

- (IBAction)fryerButton:(id)sender {
    _menuName = @"fryerMenu";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}

- (IBAction)deliButton:(id)sender {
    _menuName = @"deliMenu";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}

- (IBAction)wrapsButton:(id)sender {
    _menuName = @"wrapsMenu";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}

- (IBAction)specialsButton:(id)sender {
    _menuName = @"specialsMenu";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}

- (IBAction)recentOrdersButton:(id)sender {
    _menuName = @"recentOrders";
    [self performSegueWithIdentifier:@"toItemView" sender:self];
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


-(void) setUser:(NSString *)user{
    
    _user = user;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ItemViewController *ivc = [segue destinationViewController];
    
    ivc.user = _user;
    ivc.menuName = _menuName;
    
}


@end
