#import "Ingredient.h"

@interface Ingredient {

}

@implementation Ingredient
@synthesize flavor

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[restaurantMapping addAttributeMappingsFromDictionary:@{
	@"theIngredianFlavor": @"flavor"  }];

	return mapping;
}


@end