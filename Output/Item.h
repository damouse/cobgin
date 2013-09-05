@interface Item : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * ingredients;

+ (RKObjectMapping *) mapping;

@end