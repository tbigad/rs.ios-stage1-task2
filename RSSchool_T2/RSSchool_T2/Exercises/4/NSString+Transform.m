#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSCharacterSet *consonants = [NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSCharacterSet *characterSetForSearch = [self isPangram] ? vowels : consonants;
    
    NSMutableArray *wordsArray = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@" "]];
    NSMutableArray *resultArrayOfWords = [NSMutableArray array];
    
    for (NSString *currentWord in wordsArray) {
        if (![currentWord isEqualToString:@""]) {
            NSMutableString *mutableCurrentWord = [NSMutableString stringWithString:currentWord];
            int precessedCharacterCounter = 0;
            NSRange range = NSMakeRange(0, 1);
            
            for (int i = 0; i < currentWord.length; i++) {
                range.location = i;
                NSString *currentCharacter = [currentWord substringWithRange:range];
                if ([currentCharacter rangeOfCharacterFromSet:characterSetForSearch].location != NSNotFound) {
                    [mutableCurrentWord replaceCharactersInRange:range withString:[currentCharacter uppercaseString]];
                    precessedCharacterCounter++;
                }
            }
            [resultArrayOfWords addObject:[NSString stringWithFormat:@"%d%@", precessedCharacterCounter, mutableCurrentWord]];
        }
    }
    
    [resultArrayOfWords sortUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        NSRange firstCharacterRange = NSMakeRange(0, 1);
        int firstCharacterValue = [[obj1 substringWithRange:firstCharacterRange] intValue];
        int secondCharacterValue = [[obj2 substringWithRange:firstCharacterRange] intValue];
        
        if (firstCharacterValue < secondCharacterValue) {
            return NSOrderedAscending;
        } else if (firstCharacterValue == secondCharacterValue) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    return [resultArrayOfWords componentsJoinedByString:@" "];
}

- (BOOL)isPangram {
    NSArray<NSString*>* alphabet = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M",
                            @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    NSMutableSet<NSString*>* characterMultiSet = [[NSMutableSet alloc] initWithArray:alphabet];

    NSRange range = NSMakeRange(0, 1);
    for (int i = 0; i < self.length; i++) {
        range.location = i;
        NSString *currentCharacter = [self substringWithRange:range];
        [characterMultiSet removeObject:[currentCharacter uppercaseString]];
    }
    
    return [characterMultiSet count] == 0;
}

@end
