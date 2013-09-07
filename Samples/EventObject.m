//
//  EventObject.m
//  ScheduleThis3
//
//  Created by Mickey Barboi on 11/04/2013.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import "EventObject.h"

@implementation EventObject
@synthesize titleOfEvent, eventID, notes, location, allDay, publised, deleted, parentId, sportsIcon;
@synthesize startDate = _startDate;
@synthesize endDate = _endDate;

-(id)init
{
return [super init];
}

- (NSString*)startDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CST"]];
    NSDate *date = [formatter dateFromString:_startDate];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *newDate = [formatter stringFromDate:date];
    return newDate;
}

- (NSString*)endDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CST"]];
    NSDate *date = [formatter dateFromString:_endDate];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *newDate = [formatter stringFromDate:date];
    return newDate;
}

- (void) setStartDateFromExisting:(NSString*)startDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *date = [formatter dateFromString:startDate];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CST"]];
    NSString *newDate = [formatter stringFromDate:date];
    _startDate = newDate;
}

- (void) setEndDateFromExisting:(NSString*)endDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *date = [formatter dateFromString:endDate];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CST"]];
    NSString *newDate = [formatter stringFromDate:date];
    _endDate = newDate;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:titleOfEvent forKey:@"titleOfEvent"];
    [encoder encodeObject:eventID forKey:@"eventID"];
    [encoder encodeObject:_startDate forKey:@"startDate"];
    [encoder encodeObject:_endDate forKey:@"endDate"];
    [encoder encodeObject:notes forKey:@"notes"];
    [encoder encodeObject:location forKey:@"location"];
    [encoder encodeObject:allDay forKey:@"allDay"];
    [encoder encodeObject:publised forKey:@"publised"];
    [encoder encodeObject:deleted forKey:@"deleted"];
    [encoder encodeObject:parentId forKey:@"parentId"];
    [encoder encodeObject:sportsIcon forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    self.titleOfEvent = [decoder decodeObjectForKey:@"titleOfEvent"];
    self.eventID =[decoder decodeObjectForKey:@"eventID"];
    self.startDate =[decoder decodeObjectForKey:@"startDate"];
    self.endDate =[decoder decodeObjectForKey:@"endDate"];
    self.notes = [decoder decodeObjectForKey:@"notes"];
    self.location =[decoder decodeObjectForKey:@"location"];
    self.allDay =[decoder decodeObjectForKey:@"allDay"];
    self.publised =[decoder decodeObjectForKey:@"publised"];
    self.deleted = [decoder decodeObjectForKey:@"deleted"];
    self.parentId = [decoder decodeObjectForKey:@"parentId"];
    self.sportsIcon = [decoder decodeObjectForKey:@"image"];
    
    return self;
}

- (id) copyWithZone:(NSZone *)zone
{
    
    EventObject *new = [[EventObject alloc] init];
    
    new.titleOfEvent = self.titleOfEvent;
    new.eventID = self.eventID;
    new.startDate = self.startDate;
    new.endDate = self.endDate;
    new.notes = self.notes;
    new.location = self.location;
    new.allDay = self.allDay;
    new.publised = self.publised;
    new.deleted = self.deleted;
    new.parentId = self.parentId;
    new.sportsIcon = self.sportsIcon;
    
    return new;
}

-(BOOL)isEqual:(id)object
{
    if(![object isKindOfClass:[EventObject class]])
        return false;
    
    EventObject *other = (EventObject *)object;
    
    if([eventID isEqualToString:other.eventID])
        return true;
    
    //added to prevent indentical events with different eventIDs
    if([[self titleOfEvent] isEqualToString:[other titleOfEvent]] && [[self startDate] isEqualToString:[other startDate]])
        return true;
    
    return false;
}

- (NSUInteger)hash
{
    return [eventID integerValue];
}

@end
