//
//
// Group
// This is an object created by COBGIN
//
//
// by Mickey Barboi
//
//


#import "Group.h"
#import "Item.h"

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


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:menuID forKey:@"menuID"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.menuID = [decoder decodeObjectForKey:@"menuID"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.items = [decoder decodeObjectForKey:@"items"];
	return self;
}



@end