//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Item.h"
#import "Ingredient.h"



@implementation Item
@synthesize itemID, description, image, name, ingredients, androidEnabled, ecoprintEnabled, iphoneEnabled, allergens;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"aIdMenuItem": @"itemID",
	@"aDescription": @"description",
	@"afileName": @"image",
	@"aMenuItem": @"name",
	@"IsAndroidEnabled": @"androidEnabled",
	@"IsEconoprintEnabled": @"ecoprintEnabled",
	@"IsIPhoneEnabled": @"iphoneEnabled",
	@"zAllergenNode": @"allergens"  }];

	RKObjectMapping *ingredientMapping = [Ingredient mapping];
	RKRelationshipMapping *ingredientRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"IngNode" toKeyPath:@"ingredients" withMapping:ingredientMapping];
	[mapping addPropertyMapping:ingredientRelation];

	return mapping;
}


@end