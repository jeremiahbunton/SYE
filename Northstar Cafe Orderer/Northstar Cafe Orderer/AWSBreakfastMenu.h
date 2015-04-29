//
//  AWSMenuItem.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 4/27/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <AWSDynamoDB/AWSDynamoDB.h>

@interface AWSBreakfastMenu : AWSDynamoDBObjectModel  <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *name, *price, *ingrediants;



@end
