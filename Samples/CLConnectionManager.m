/*
 
    A scaffolded CM! Careful, there may be some errors here. 
 */


#import "CLConnectionManager.h"
#import "Restaurant.h"
#import "Flavor.h"
#import "Menu.h"
#import "Ingredient.h"
#import "Item.h"
#import "Group.h"

@implementation CLConnectionManager

#pragma mark Initialization
+ (CLConnectionManager *) manager {
	static CLConnectionManager *conMan = nil;
	if (conMan != nil) return conMan;

	static dispatch_once_t safer;

	dispatch_once(&safer, ^(void) {
		conMan = [[CLConnectionManager alloc] init]; 
	});

	return conMan;

}

#pragma mark Requests
- (void) API_Restaurant_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
    
	[self apiRequestWithMapping:[Restaurant mapping] atURL:@"http://www.culvers.com/cws2/querymenudisplay.aspx" withKeyPath:@"" success:success fail:failure];
}

- (void) API_Flavor_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:[Flavor mapping] atURL:@"http://www.culvers.com/cws2/queryflavors.aspx" withKeyPath:@"" success:success fail:failure];
}

- (void) API_Menu_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:[Menu mapping] atURL:@"http://www.culvers.com/cws2/querymenudisplay.aspx" withKeyPath:@"MenuGroups" success:success fail:failure];
}

@end
