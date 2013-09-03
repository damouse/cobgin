#import "Item.h"

@interface Item {

}

@implementation Item
@synthesize name, Ingredients#pragma mark Connection Manager
(RKObjectMapping *) mapping {
//returns the mapping needed by RestKit to perform API calls
RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];


@end