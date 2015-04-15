//
//  Order.h
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 3/9/15.
//  Copyright (c) 2015 Jeremiah Bunton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"

@interface Order : NSObject


@property NSString *details;
@property NSDate *date;
@property NSString *user;

-(id)initWithUser:(NSString*)user orderDetails:(NSString*)item andDate:(NSDate*)date;

+(NSDictionary*)serialize:(Order* )order;

+(Order*)deSerialize:(NSDictionary*)dictionary;

@end
