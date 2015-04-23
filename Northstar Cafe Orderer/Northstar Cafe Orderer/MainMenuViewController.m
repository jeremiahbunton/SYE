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

@synthesize dictionary, menu;



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
    
    
    dictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                  [[NSDictionary alloc] initWithObjectsAndKeys:
                   [[NSDictionary alloc]initWithObjectsAndKeys:@"waffle", @"name", @2.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"waffle",
                   [[NSDictionary alloc]initWithObjectsAndKeys:@"french toast", @"name", @4.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"french toast",
                   [[NSDictionary alloc]initWithObjectsAndKeys:@"pancake", @"name", @3.99, @"price", @"flour, water, eggs, sugar, and strawberries", @"description", nil], @"pancake",
                  nil],
                  @"breakfast", nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


-(void) setUser:(NSString *)user{
    
    _user = user;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ItemViewController *ivc = [segue destinationViewController];
    
    [ivc setUser:_user];
    
    
    if ([[segue identifier] isEqualToString:@"breakfast"]) {
        menu = [[Menu alloc]initWithDictionary:[dictionary objectForKey:@"breakfast"]];
        //NSLog([menu toString]);
        [ivc setM:menu];
       // NSLog([ivc.menu toString]);
    }
    
    
    else if ([[segue identifier] isEqualToString:@"fryer"]) {
        menu = [[Menu alloc]initWithDictionary:[dictionary objectForKey:@"fryer"]];
        [ivc setM:menu];
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
