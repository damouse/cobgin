@interface Menu : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * items;

+ (RKObjectMapping *) mapping;

@end