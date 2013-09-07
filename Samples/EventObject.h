//
//  EventObject.h
//  ScheduleThis3
//
//  Created by Mickey Barboi on 11/04/2013.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryTreeNode.h"

@interface EventObject : NSObject <NSCoding, NSCopying>
@property (strong, nonatomic) NSString *titleOfEvent;
@property (strong, nonatomic) NSString *eventID;
@property (strong, nonatomic) NSString *startDate;
@property (strong, nonatomic) NSString *endDate;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *location;

@property (strong, nonatomic) NSString *allDay; //these three are boolean, 1 if true
@property (strong, nonatomic) NSString *publised;
@property (strong, nonatomic) NSString *deleted;
@property (strong, nonatomic) NSString *parentId;
@property (strong, nonatomic) UIImage *sportsIcon;


//implemented so that events can be used as keys in the favoritesVC
- (BOOL)isEqual:(id)anObject;
- (NSUInteger)hash;
- (void) setStartDateFromExisting:(NSString*)startDate;
- (void) setEndDateFromExisting:(NSString*)endDate;
@end
