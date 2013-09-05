#import "Menu.h"
#import "Item.h"

@interface Menu {

}

@implementation Menu
@synthesize name, items

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[restaurantMapping addAttributeMappingsFromDictionary:@{
	@"restaurantName": @"name"  }];

	RKObjectMapping *itemMapping = [Item mapping];
	RKRelationshipMapping *itemRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"menuItems" toKeyPath:@"items" withMapping:itemMapping];
	[mapping addPropertyMapping:itemRelation];

	return mapping;
}


@end