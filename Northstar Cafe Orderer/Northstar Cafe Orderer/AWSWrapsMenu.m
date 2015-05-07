//
//  AWSWrapsMenu.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 5/6/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "AWSWrapsMenu.h"

@implementation AWSWrapsMenu

+ (NSString *)dynamoDBTableName {
    return @"wraps";
}


+ (NSString *)hashKeyAttribute {
    return @"name";
}



@end
