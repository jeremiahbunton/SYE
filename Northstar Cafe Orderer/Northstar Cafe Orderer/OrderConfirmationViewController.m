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
    
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
                                                          initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:@"us-east-1:f2fa75a7-72e1-4b0e-a91c-c6102bd033c6"];
    
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    
    
    
    _order = [[NSMutableString alloc] init];
    
    
    _nameLabel.text = @"Item: ";
    _nameLabel.text = [_nameLabel.text stringByAppendingString:_menuItem.name];
    [_nameLabel.font fontWithSize:12];
    
    
    
    _priceLabel.text = @"Price: ";
    _priceLabel.text = _menuItem.price;
    [_priceLabel.font fontWithSize:12];
    
    
    [_order appendString:@"Ingredients: "];
    [_order appendString:_menuItem.toString];
    
    _extrasInputTextField.delegate = self;
    _orderConfirmationView.text = _order;
    
}

// Dont use a string to maintain order details instead append to textview and then save before you leave the view.
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    
    if ([_extrasInputTextField.text length] > 0 && [_order containsString:@"Extras"]) {
        [_order appendString:@", "];
        
        [_order appendString:_extrasInputTextField.text];
        _orderConfirmationView.text = _order;
        _extrasInputTextField.text = @"";
    }
    else if ([_extrasInputTextField.text length] > 0) {
        [_order appendString:@"\n"];
        [_order appendString:@"Extras: "];
        
        [_order appendString:_extrasInputTextField.text];
        _orderConfirmationView.text = _order;
        _extrasInputTextField.text = @"";
        
    }
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
    covc.user = _user;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (AWSOrder *)setAWSOrder {
    AWSOrder *order = [[AWSOrder alloc]init];
    
    _dateString = [_dateformater stringFromDate:[NSDate date]];
    
    
    _orderConfirmationNumber = [NSString stringWithFormat:@"%@%@", _user, [_dateString stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    
    order.userID = _user;
    order.order = _order;
    order.orderDates = _dateString;
    order.orderConfirmationNumber = _orderConfirmationNumber;
    order.orderName = _menuItem.name;
    
    return order;
}




- (IBAction)confirmOrder:(id)sender {
    
    
    if ([_extrasInputTextField.text length] > 0 && [_order containsString:@"Extras"]) {
        
        
        
        // Somewhere there is a new line char being entered after the text from the extras field is appended to the order string.  Find it and remove it and then all should be ready to go.
        
        
        
        
//        NSString *tmp = [_order substringFromIndex:NSMaxRange([_order rangeOfString:@"Extras"])];
//        [tmp stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
//        NSString *strippedOrder = [[_order substringToIndex:NSMaxRange([_order rangeOfString:@"Extras"])] stringByAppendingString:tmp];
//        
//        NSMutableString *mutableStrippedOrder = [[NSMutableString alloc] initWithString:strippedOrder];
//        
//        _order = mutableStrippedOrder;
        [_order appendString:@","];
        
        [_order appendString:_extrasInputTextField.text];
        _orderConfirmationView.text = _order;
        _extrasInputTextField.text = @"";
    }
    
    else if ([_extrasInputTextField.text length] > 0) {
        [_order appendString:@"\n"];
        [_order appendString:@"Extras: "];
        
        [_order appendString:_extrasInputTextField.text];
        _orderConfirmationView.text = _order;
        _extrasInputTextField.text = @"";

    }

    
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
