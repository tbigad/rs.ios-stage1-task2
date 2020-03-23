#import "TimeConverter.h"
@interface TimeConverter()
- (BOOL) isValid:(NSString*)hours andMinutes:(NSString*)minutes;
@end


@implementation TimeConverter

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    if(![self isValid:hours andMinutes:minutes]) {
        return @"";
    }
    int h = [hours intValue];
    int m = [minutes intValue];
        NSArray<NSString*>* nums = @[@"zero",@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",@"eleven",@"twelve",@"thirteen",@"fourteen",@"fifteen",@"sixteen",@"seventeen",@"eighteen",@"nineteen",@"twenty",@"twenty one",@"twenty two",@"twenty three",@"twenty four",@"twenty five",@"twenty six",@"twenty seven",@"twenty eight",@"twenty nine"];
    
    NSMutableString* str = [[NSMutableString alloc] init];
    
    if (m == 0) {
        [str appendFormat:@"%@ o' clock",nums[h]];
    }
    else if (m == 1) {
        [str appendFormat:@"one minute past %@", nums[h]];
    }
    else if (m == 59) {
        [str appendFormat:@"one minute to %@", nums[(h % 12) + 1]];
    }
    else if (m == 15) {
        [str appendFormat:@"quater past %@", nums[h]];
    }
    else if (m == 30) {
          [str appendFormat:@"half past %@", nums[h]];
    }
    else if (m == 45) {
        [str appendFormat:@"quarter to %@", nums[(h % 12) + 1]];
    }
    else if (m <= 30) {
        [str appendFormat:@"%@ minutes past %@", nums[m], nums[h]];
    }
    else if (m > 30) {
        [str appendFormat:@"%@ minutes to %@", nums[60 - m],nums[(h % 12) + 1]];
        
    }
    return [str copy];
}

- (BOOL)isValid:(NSString *)hours andMinutes:(NSString *)minutes {
    int h = [hours intValue];
    int m = [minutes intValue];
    return (h < 12 && h >= 0) && ( m >= 0 && m < 60);
}
@end
