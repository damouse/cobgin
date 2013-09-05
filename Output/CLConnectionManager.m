#import "MBConnectionManager.h"
#import "Restaurant.h"
#import "Flavor.h"
#import "Menu.h"
#import "Ingredient.h"
#import "Item.h"
#import "Group.h"

@implementation MBConnectionManager

#pragma mark Initialization
+ (MBConnectionManager *) manager {
	static MBConnectionManager *conMan = nil;
	if (conMan != nil) return conMan;

	static dispatch_once_t safer;

	dispatch_once(&safer, ^(void) {
		conMan = [[CLConnectionManager alloc] init]; 
	});

	return conMan

}

#pragma mark Requests
- (void) API_Restaurant_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:[Restaurant mapping] success:success fail:failure]; 
}

- (void) API_Flavor_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:[Flavor mapping] success:success fail:failure]; 
}

- (void) API_Menu_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:[Menu mapping] success:success fail:failure]; 
}

@end
