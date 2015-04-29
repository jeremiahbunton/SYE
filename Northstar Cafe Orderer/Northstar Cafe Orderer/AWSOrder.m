//
//  AWSOrder.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 4/15/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "AWSOrder.h"


@implementation AWSOrder



+ (NSString *)dynamoDBTableName {
    return @"order";
}

+ (NSString *)rangeKeyAttribute {
    return @"orderDates";
}

+ (NSString *)hashKeyAttribute {
    return @"userID";
}
@end
