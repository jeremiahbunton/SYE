//
//  Order.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 3/9/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import "Order.h"

@implementation Order


// user
// item details
// date



-(id)initWithUser:(NSString*)user orderDetails:(NSString*)item date:(NSDate*)date orderConfirmationNumber:(NSString *)confirmationNumber
{
    self = [super init];
    
    if (self) {
        _user = user;
        _details = item;
        _date = date;
        _confirmationNumber = confirmationNumber;
    }
    
    return self;
}

+(NSString*)serialize:(Order *)order
{
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    
    
    [dictionary setValue:order.user forKey:@"user"];
    [dictionary setValue:order.details forKey:@"menuItem"];
    [dictionary setValue:order.date forKey:@"date"];
    [dictionary setValue:order.confirmationNumber forKey:@"confirmationNumber"];
    
    
    NSData *json;
    NSError *error = nil;
    NSString *jsonString;
    
    
    if ([NSJSONSerialization isValidJSONObject:dictionary]) {
        
        
        // Creating the JSON object from a dictionary
        json = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
        
        // Turning the JSON object into a string to send to the server
        jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
        
        return jsonString;
    }
    else
    {
        // Return empty JSON if
        return @"{}";
    }
}


+(Order*)deSerialize:(NSDictionary *)dictionary
{
    // Is this legal to create a MenuItem object to use its deSerialize function to replace the Object?
    
    
    Order *order = [[Order alloc] initWithUser:[dictionary valueForKey:@"user"] orderDetails:[dictionary valueForKey:@"menuItem"] date:[dictionary valueForKey:@"date"] orderConfirmationNumber:[dictionary valueForKey:@"confirmationNumber"]];
    
    
    return order;
}





@end
