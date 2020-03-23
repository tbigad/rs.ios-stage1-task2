#import "AbbreviationMaker.h"

@implementation AbbreviationMaker

- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *uppercaseString = [[a uppercaseString] mutableCopy];
    int indexB = 0;
    NSMutableString *resultString = [NSMutableString new];
    NSRange range = NSMakeRange(0, 1);
    for (int i = 0; (i < a.length) && (indexB < b.length); i ++) {
        if([uppercaseString characterAtIndex:i] == [b characterAtIndex:indexB]) {
            range.location = i;
            NSString *currentCharacter = [uppercaseString substringWithRange:range];
            [resultString appendString:currentCharacter];
            indexB++;
        }
    }
    
    return [resultString isEqual:b] ? @"YES": @"NO";
}
@end
