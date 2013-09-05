#import "MBConnectionManager.h"#import "Menu"
#import "Item"
#import "Ingredient"

@implementation MBConnectionManager

#pragma mark Initialization
+ (MBConnectionManager *) manager {
	static MBConnectionManager *conMan = nil;
	if (conMan != nil) return conMan;

	static dispatch_once_t safer;

	dispatch_once(&safer, ^(void) {
		conMan = [[CLConnectionManager alloc] init]; });

	return conMan

}

#pragma mark Requests- (void) API_Menu_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:mapping success:success fail:failure {
}

- (void) API_Item_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure {
	[self apiRequestWithMapping:mapping success:success fail:failure {
}

