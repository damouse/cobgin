#import <Foundation/Foundation.h>
@interface CLConnectionManager : MBConnectionManager

+ (CLConnectionManager *) manager;

- (void) API_Restaurant_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Flavor_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Menu_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Ingredient_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Item_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Group_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

@end