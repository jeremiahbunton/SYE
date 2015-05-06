//
//  AWSFryerMenu.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 5/6/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "AWSFryerMenu.h"

@implementation AWSFryerMenu


+ (NSString *)dynamoDBTableName {
    return @"fryer";
}


+ (NSString *)hashKeyAttribute {
    return @"name";
}


@end
