//
//  OrderConfirmationViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 1/23/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "OrderConfirmationViewController.h"

@interface OrderConfirmationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


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
    [_order appendString:@"\n\n"];
    [_order appendString:@"Extras: "];
    [_order appendString:_extrasInputTextField.text];
    
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
    
    [covc setMenuItem:_menuItem];
    [covc setUser:_user];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
