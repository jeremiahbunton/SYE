//
//  MenuItem.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem




@synthesize name, price, description;

-(id) initWithName:(NSString *)_name price:(NSNumber *)_price andDescription:(NSString *)_description
{
    self = [super init];
    if (self) {
        self.name = _name;
        self.price = _price;
        self.description = _description;
    }
    return self;
    
}

-(NSString*)toString
{
    NSMutableString *tmp = [[NSMutableString alloc]init];
    [tmp appendString:@" "];
    [tmp appendString:description];
    [tmp appendString:@"\n"];
    
    return tmp;
}

@end
