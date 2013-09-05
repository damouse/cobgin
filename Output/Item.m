#import "Item.h"
#import "Ingredient.h"

@interface Item {

}

@implementation Item
@synthesize name, ingredients

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[restaurantMapping addAttributeMappingsFromDictionary:@{
	@"itemName": @"name"  }];

	RKObjectMapping *ingredientMapping = [Ingredient mapping];
	RKRelationshipMapping *ingredientRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"ingredientAPI" toKeyPath:@"ingredients" withMapping:ingredientMapping];
	[mapping addPropertyMapping:ingredientRelation];

	return mapping;
}


@end