//
//  MenuItem.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject



@property NSString *name, *description, *price;



-(id)initWithName:(NSString*) _name price:(NSString*) _price andDescription:(NSString*) _description;

-(NSString*)toString;

+(NSDictionary*)serialize:(MenuItem* )menuItem;

+(MenuItem*)deSerialize:(NSDictionary*)dictionary;

@end
