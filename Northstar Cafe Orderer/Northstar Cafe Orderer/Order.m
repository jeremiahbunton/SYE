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



-(id)initWithUser:(NSString*)user menuItem:(MenuItem*)item andDate:(NSDate*)date
{
    self = [super init];
    
    if (self) {
        _user = user;
        _item = item;
        _date = date;
    }
    
    return self;
}

-(NSString*)serialize
{
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    
    
    [dictionary setValue:self.user forKey:@"user"];
    [dictionary setValue:[self.item serialize] forKey:@"menuItem"];
    [dictionary setValue:self.date forKey:@"date"];
    
    
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


-(Order*)deSerialize:(NSDictionary *)dictionary
{
    // Is this legal to create a MenuItem object to use its deSerialize function to replace the Object?
    MenuItem *item = [[MenuItem alloc]init];
    
    item = [item deSerialize:[dictionary valueForKey:@"menuItem"]];
    
    Order *order = [[Order alloc] initWithUser:[dictionary valueForKey:@"user"] menuItem:item andDate:[dictionary valueForKey:@"date"]];
    
    
    return order;
}





@end
