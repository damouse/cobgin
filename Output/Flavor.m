//
//
// Flavor
// This is an object created by COBGIN
//
//
// by Mickey Barboi
//
//


#import "Flavor.h"

@implementation Flavor
@synthesize flavorID, name, description, live, image

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"flavorID": @"flavorID",
	@"flavorName": @"name",
	@"flavorDescription": @"description",
	@"isLive": @"live",
	@"fotdImage": @"image"  }];

	return mapping;
}


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:flavorID forKey:@"flavorID"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:description forKey:@"description"];
	[encoder encodeObject:live forKey:@"live"];
	[encoder encodeObject:image forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.flavorID = [decoder decodeObjectForKey:@"flavorID"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.description = [decoder decodeObjectForKey:@"description"];
	self.live = [decoder decodeObjectForKey:@"live"];
	self.image = [decoder decodeObjectForKey:@"image"];
	return self;
}



@end