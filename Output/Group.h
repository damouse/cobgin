//
//
// Group
// This is an object created by COBGIN
//
//
// by Mickey Barboi
//
//


@interface Group : NSObject

@property (strong, nonatomic) NSString * menuID;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * items;

+ (RKObjectMapping *) mapping;

@end