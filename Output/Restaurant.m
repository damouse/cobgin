//
//
// Restaurant
// This is an object created by COBGIN
//
//
// by Mickey Barboi
//
//


#import "Restaurant.h"

@implementation Restaurant
@synthesize restaurantID, number, name, hours, mailingAddress, city, state, zip, phone, address, url

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


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:restaurantID forKey:@"restaurantID"];
	[encoder encodeObject:number forKey:@"number"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:hours forKey:@"hours"];
	[encoder encodeObject:mailingAddress forKey:@"mailingAddress"];
	[encoder encodeObject:city forKey:@"city"];
	[encoder encodeObject:state forKey:@"state"];
	[encoder encodeObject:zip forKey:@"zip"];
	[encoder encodeObject:phone forKey:@"phone"];
	[encoder encodeObject:address forKey:@"address"];
	[encoder encodeObject:url forKey:@"url"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.restaurantID = [decoder decodeObjectForKey:@"restaurantID"];
	self.number = [decoder decodeObjectForKey:@"number"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.hours = [decoder decodeObjectForKey:@"hours"];
	self.mailingAddress = [decoder decodeObjectForKey:@"mailingAddress"];
	self.city = [decoder decodeObjectForKey:@"city"];
	self.state = [decoder decodeObjectForKey:@"state"];
	self.zip = [decoder decodeObjectForKey:@"zip"];
	self.phone = [decoder decodeObjectForKey:@"phone"];
	self.address = [decoder decodeObjectForKey:@"address"];
	self.url = [decoder decodeObjectForKey:@"url"];
	return self;
}



@end