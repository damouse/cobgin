@interface Ingredient : NSObject

@property (strong, nonatomic) NSString * flavor;

+ (RKObjectMapping *) mapping;

@end