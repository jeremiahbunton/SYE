//
//  AWSFryerMenu.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 5/6/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "AWSDynamoDBService.h"
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface AWSFryerMenu : AWSDynamoDBObjectModel  <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *name, *price, *ingredients;


@end
