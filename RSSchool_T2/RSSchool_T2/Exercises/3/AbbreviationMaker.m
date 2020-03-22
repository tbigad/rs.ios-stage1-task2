#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *uppercaseString = [[a uppercaseString] mutableCopy];
    int indexB = 0;
    NSMutableString *resultString = [NSMutableString new];
    for (int i = 0; i < a.length; i ++) {
        if (indexB >= b.length) {
            break;
        }
        if([uppercaseString characterAtIndex:i] == [b characterAtIndex:indexB]) {
            [resultString appendFormat:@"%c",[uppercaseString characterAtIndex:i]];
            indexB++;
        }
    }
    
    return [resultString isEqual:b] ? @"YES": @"NO";
}
@end
