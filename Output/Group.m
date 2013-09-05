#import "Group.h"
#import "Item.h"

@interface Group {

}

@implementation Group
@synthesize menuID, name, items

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"aIdMenuGroup": @"menuID",
	@"aMenuGroup": @"name"  }];

	RKObjectMapping *itemMapping = [Item mapping];
	RKRelationshipMapping *itemRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"MenuItemNode" toKeyPath:@"items" withMapping:itemMapping];
	[mapping addPropertyMapping:itemRelation];

	return mapping;
}


@end