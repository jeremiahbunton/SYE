//
//  OrderConfirmationViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 1/23/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "OrderConfirmationViewController.h"
#import "Order.h"
#import "AWSOrder.h"

#import <AWSDynamoDB/AWSDynamoDB.h>
#import <AWSCore/AWSCore.h>
#import <AWSCognito/AWSCognito.h>


@interface OrderConfirmationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) NSDateFormatter *dateformater;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *orderConfirmationNumber;

@end



@implementation OrderConfirmationViewController


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
    
    
    // Initialize the Amazon Cognito credentials provider
    
    _dateformater =[[NSDateFormatter alloc]init];
    [_dateformater setDateFormat:@"MM dd yyyy hh mm ss"]; // Date formater
    _dateString = [_dateformater stringFromDate:[NSDate date]];
    
    
    _orderConfirmationNumber = [NSString stringWithFormat:@"%@%@", _user, [_dateString stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:@"us-east-1:f2fa75a7-72e1-4b0e-a91c-c6102bd033c6"];
    
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    
    
    
    _order = [[NSMutableString alloc] init];
    
    
    _nameLabel.text = @"Item: ";
    _nameLabel.text = [_nameLabel.text stringByAppendingString:_menuItem.name];
    [_nameLabel.font fontWithSize:12];
    
    
    NSString *tmp = [_menuItem.price stringValue];
    _priceLabel.text = @"Price: ";
    _priceLabel.text = [_priceLabel.text stringByAppendingString:tmp];
    [_priceLabel.font fontWithSize:12];
    
    
    [_order appendString:@"Ingredients: "];
    [_order appendString:_menuItem.toString];
    [_order appendString:@"\n"];
    [_order appendString:@"Extras: "];
    [_order appendString:_extrasInputTextField.text];
    _extrasInputTextField.text = @"";
    
    _extrasInputTextField.delegate = self;
    _orderConfirmationView.text = _order;

}

// Dont use a string to maintain order details instead append to textview and then save before you leave the view.
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_order appendString:textField.text];
    _orderConfirmationView.text = _order;
    
    [textField resignFirstResponder];
    return YES;
}

-(void)setUser:(NSString *)user
{
    _user = user;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setMenuItem:(MenuItem *)item
{
    _menuItem = item;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ConfirmedOrderViewController *covc = [segue destinationViewController];
    
    covc.AWSOrder = [self setAWSOrder];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (AWSOrder *)setAWSOrder {
    AWSOrder *order = [[AWSOrder alloc]init];
    
    order.userName = _user;
    order.order = _order;
    order.orderDate = _dateString;
    order.orderConfirmationNumber = _orderConfirmationNumber;
    return order;
}



- (IBAction)confirmOrder:(id)sender {
    
    
    AWSOrder *order;
    order = [self setAWSOrder];
    
    
    
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    [[dynamoDBObjectMapper save:order]
     continueWithBlock:^id(BFTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         }
         if (task.exception) {
             NSLog(@"The request failed. Exception: [%@]", task.exception);
         }
         if (task.result) {
             //Do something with the result.
         }
         return nil;
     }];
    
    
}
@end
