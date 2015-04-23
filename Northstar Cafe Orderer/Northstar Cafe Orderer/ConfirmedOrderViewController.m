//
//  ConfirmedOrderViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 3/9/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "ConfirmedOrderViewController.h"

@interface ConfirmedOrderViewController ()

@property (weak, nonatomic) IBOutlet UITextView *orderConfirmationView;

@end

@implementation ConfirmedOrderViewController

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
    NSLog(@"testing to see if username is set");
    
    NSMutableString *orderConfirmation = [[NSMutableString alloc]init];
    
    [orderConfirmation appendString:@"Thank you for your order, your order details are below"];
    [orderConfirmation appendString:@"\n\n"];
    [orderConfirmation appendString:[NSString stringWithFormat:@"%@ %@", @"User: ", _AWSOrder.userName]];
    [orderConfirmation appendString:@"\n\n"];
        [orderConfirmation appendString:[NSString stringWithFormat:@"%@ %@", @"Confirmation Number: ", _AWSOrder.orderConfirmationNumber]];
    [orderConfirmation appendString:@"\n\n"];
    [orderConfirmation appendString:[NSString stringWithFormat:@"%@ %@", @"Order: ", _AWSOrder.order]];
    

    
    
    _orderConfirmationView.text = orderConfirmation;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
