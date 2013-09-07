//HEY, a scaffolded CM! LOOK!

#import <Foundation/Foundation.h>
#import "MBConnectionManager.h"

@interface CLConnectionManager : MBConnectionManager

+ (CLConnectionManager *) manager;

- (void) API_Restaurant_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Flavor_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Menu_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

/*
 //Why the hell were these created, too? I swear they weren't made when I ran this on Ubuntu...
- (void) API_Ingredient_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Item_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;

- (void) API_Group_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure;
*/
@end