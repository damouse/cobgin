#import "Flavor.h"

@interface Flavor {

}

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


@end