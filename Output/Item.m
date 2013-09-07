//
//
// Item
// This is an object created by COBGIN
//
//
// by Mickey Barboi
//
//


#import "Item.h"
#import "Ingredient.h"

@implementation Item
@synthesize itemID, description, image, name, ingredients, androidEnabled, ecoprintEnabled, iphoneEnabled, allergens

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


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:itemID forKey:@"itemID"];
	[encoder encodeObject:description forKey:@"description"];
	[encoder encodeObject:image forKey:@"image"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:ingredients forKey:@"ingredients"];
	[encoder encodeObject:androidEnabled forKey:@"androidEnabled"];
	[encoder encodeObject:ecoprintEnabled forKey:@"ecoprintEnabled"];
	[encoder encodeObject:iphoneEnabled forKey:@"iphoneEnabled"];
	[encoder encodeObject:allergens forKey:@"allergens"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.itemID = [decoder decodeObjectForKey:@"itemID"];
	self.description = [decoder decodeObjectForKey:@"description"];
	self.image = [decoder decodeObjectForKey:@"image"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.ingredients = [decoder decodeObjectForKey:@"ingredients"];
	self.androidEnabled = [decoder decodeObjectForKey:@"androidEnabled"];
	self.ecoprintEnabled = [decoder decodeObjectForKey:@"ecoprintEnabled"];
	self.iphoneEnabled = [decoder decodeObjectForKey:@"iphoneEnabled"];
	self.allergens = [decoder decodeObjectForKey:@"allergens"];
	return self;
}



@end