#import "Menu.h"
#import "Group.h"

@interface Menu {

}

@implementation Menu
@synthesize groups

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{  }];

	RKObjectMapping *groupMapping = [Group mapping];
	RKRelationshipMapping *groupRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"GroupNode" toKeyPath:@"groups" withMapping:groupMapping];
	[mapping addPropertyMapping:groupRelation];

	return mapping;
}


@end