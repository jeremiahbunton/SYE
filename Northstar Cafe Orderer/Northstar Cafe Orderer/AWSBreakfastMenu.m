//
//  AWSMenuItem.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 4/27/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "AWSBreakfastMenu.h"

@implementation AWSBreakfastMenu



+ (NSString *)dynamoDBTableName {
    return @"breakfast";
}


+ (NSString *)hashKeyAttribute {
    return @"name";
}


@end
