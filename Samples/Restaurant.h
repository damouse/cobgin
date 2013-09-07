//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


@interface Restaurant : NSObject

@property (strong, nonatomic) NSString * restaurantID;
@property (strong, nonatomic) NSString * number;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * hours;
@property (strong, nonatomic) NSString * mailingAddress;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) NSString * zip;
@property (strong, nonatomic) NSString * phone;
@property (strong, nonatomic) NSString * address;
@property (strong, nonatomic) NSString * url;

+ (RKObjectMapping *) mapping;

@end