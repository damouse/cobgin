//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Restaurant.h"


@implementation Restaurant
@synthesize restaurantID, number, name, hours, mailingAddress, city, state, zip, phone, address, url;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"restaurantKey": @"restaurantID",
	@"restaurantNumber": @"number",
	@"restaurantName": @"name",
	@"hours": @"hours",
	@"mainAddress": @"mailingAddress",
	@"city": @"city",
	@"state": @"state",
	@"zipCode": @"zip",
	@"phone": @"phone",
	@"physicalAddress": @"address",
	@"url": @"url"  }];

	return mapping;
}


@end