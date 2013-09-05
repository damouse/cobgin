@interface Item : NSObject

@property (strong, nonatomic) NSString * itemID;
@property (strong, nonatomic) NSString * description;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * ingredients;
@property (nonatomic) BOOL androidEnabled;
@property (nonatomic) BOOL ecoprintEnabled;
@property (nonatomic) BOOL iphoneEnabled;
@property (strong, nonatomic) NSArray * allergens;

+ (RKObjectMapping *) mapping;

@end