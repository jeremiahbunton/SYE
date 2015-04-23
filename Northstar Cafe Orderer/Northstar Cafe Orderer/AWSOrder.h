//
//  AWSOrder.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 4/15/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <AWSDynamoDB/AWSDynamoDB.h>

@interface AWSOrder : AWSDynamoDBObjectModel  <AWSDynamoDBModeling>


@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *orderDate;
@property (nonatomic, strong) NSString *order;
@property (nonatomic, strong) NSString *orderConfirmationNumber;

@end
