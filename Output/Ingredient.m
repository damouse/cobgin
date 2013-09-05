#import "Ingredient.h"

@interface Ingredient {

}

@implementation Ingredient
@synthesize ingredientID, name, calories, caloriesFat, totalFat, satFat, transFat, carbs, protein, sugar, cholesterol, fiber, servingSize, sodium

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"": @"ingredientID",
	@"aIngredient": @"name",
	@"calories": @"calories",
	@"calFromFat": @"caloriesFat",
	@"totalFat": @"totalFat",
	@"satFat": @"satFat",
	@"transFat": @"transFat",
	@"carbs": @"carbs",
	@"protein": @"protein",
	@"sugar": @"sugar",
	@"cholesterol": @"cholesterol",
	@"dietFiber": @"fiber",
	@"servingSize": @"servingSize",
	@"sodium": @"sodium"  }];

	return mapping;
}


@end