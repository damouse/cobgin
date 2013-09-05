@interface Flavor : NSObject

@property (strong, nonatomic) NSString * flavorID;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * description;
@property (nonatomic) BOOL live;
@property (strong, nonatomic) NSString * image;

+ (RKObjectMapping *) mapping;

@end