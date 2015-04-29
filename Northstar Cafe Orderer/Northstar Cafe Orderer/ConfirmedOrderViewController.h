//
//  ConfirmedOrderViewController.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 3/9/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderConfirmationViewController.h"
#import "AWSOrder.h"


@interface ConfirmedOrderViewController : UIViewController

@property AWSOrder *AWSOrder;
@property NSString *user;
@end
