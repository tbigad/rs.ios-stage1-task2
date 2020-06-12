#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    /*
     Умелое жонглирование NSDateFormatter, NSCalendar,NSDateComponents и NSDate под условия задачи
     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[day integerValue]];
    [components setMonth:[month integerValue]];
    [components setYear:[year integerValue]];
    components.calendar = calendar;
    if(!components.isValidDate) {
        return @"Такого дня не существует";
    }
    NSDate *date = [calendar dateFromComponents:components];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"d MMMM, EEEE"];
    
    
    NSString* ret = [dateFormatter stringFromDate:date];
    return ret;
}

@end
