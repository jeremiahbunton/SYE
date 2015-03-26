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

-(NSDictionary*)serialize
{
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    
    
    [dictionary setValue:self.user forKey:@"user"];
    [dictionary setValue:[self.item serialize] forKey:@"menuItem"];
    [dictionary setValue:self.date forKey:@"date"];
    
    return dictionary;
}

-(Order*)deSerialize:(NSDictionary *)dictionary
{
    
    MenuItem *item = [[MenuItem alloc]init];
    
    item = [item deSerialize:[dictionary valueForKey:@"menuItem"]];
    
    Order *order = [[Order alloc] initWithUser:[dictionary valueForKey:@"user"] menuItem:item andDate:[dictionary valueForKey:@"date"]];
    
    return order;
}





@end
