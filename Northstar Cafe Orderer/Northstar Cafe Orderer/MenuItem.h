//
//  MenuItem.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject



@property NSString *name, *description;
@property NSNumber *price;



-(id)initWithName:(NSString*) _name price:(NSNumber*) _price andDescription:(NSString*) _description;

-(NSString*)toString;


@end
