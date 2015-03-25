//
//  Menu.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"

@interface Menu : NSObject


@property NSMutableArray *menuItems;


-(id)initWithDictionary:(NSDictionary*) _dictionary;

-(NSString*)toString;


@end
