//
//  Menu.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "Menu.h"

@implementation Menu

@synthesize menuItems;



-(id) initWithDictionary:(NSDictionary *)_dictionary
{
     menuItems = [[NSMutableArray alloc]init];
    
    
    for (NSString* key in [_dictionary allKeys]) {
            NSDictionary * tmpDict2 = [_dictionary objectForKey:key];
            //NSDictionary * tmpDict2 = [tmpDict objectForKey:key2];
            
            MenuItem *menuItem = [[MenuItem alloc]initWithName:[tmpDict2 objectForKey:@"name"] price:[tmpDict2 objectForKey:@"price"] andDescription:[tmpDict2 objectForKey:@"description"]];
            [menuItems addObject:menuItem];
        }
    
    
    return self;
}


-(NSString*)toString
{
    NSMutableString *temp = [[NSMutableString alloc]init];
    for (int i = 0; i<[menuItems count]; i++) {
        [temp appendString:[[menuItems objectAtIndex:i]toString]];
    }
    
    return temp;
}

@end
