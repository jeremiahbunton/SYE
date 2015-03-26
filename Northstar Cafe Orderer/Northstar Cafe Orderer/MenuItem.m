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


-(NSDictionary*)serialize
{
    NSDictionary *dictionary = [[NSDictionary alloc]init];
    
    [dictionary setValue:self.name forKey:@"name"];
    [dictionary setValue:self.price forKey:@"price"];
    [dictionary setValue:self.description forKey:@"description"];
    
    return dictionary;
}

-(MenuItem*)deSerialize:(NSDictionary *)dictionary
{
    MenuItem *menuItem = [[MenuItem alloc]initWithName:[dictionary valueForKey:@"name"] price:[dictionary valueForKey:@"price"] andDescription:[dictionary valueForKey:@"description"]];
    
    return menuItem;
}



@end
