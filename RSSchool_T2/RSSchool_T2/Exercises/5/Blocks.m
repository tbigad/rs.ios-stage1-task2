#import "Blocks.h"
@interface Blocks()
@property (copy,nonatomic) NSArray<NSDate*>* dates;
@property (copy,nonatomic) NSArray<NSNumber*>* numbers;
@property (nonatomic, copy) NSArray<NSString*>* strings;
@property (nonatomic, copy) NSObject* object;
@end


@implementation Blocks
- (void)setBlockA:(BlockA)blockA { }
- (BlockA)blockA {
    __weak Blocks* weakSelf = self;
    return ^void (NSArray *array) {
        __strong Blocks* strongSelf = weakSelf;
        NSMutableArray<NSDate*>* arrayOfDates = [[NSMutableArray<NSDate*> alloc] init];
        NSMutableArray<NSNumber*>* arrayOfNumbers = [[NSMutableArray<NSNumber*> alloc] init];
        NSMutableArray<NSString*>* arrayOfStrings = [[NSMutableArray<NSString*> alloc] init];

        for (int i = 0; i < array.count; i++) {
            NSObject* item = array[i];
            if([item isKindOfClass:NSNumber.class]){
                NSNumber* itemNumber = (NSNumber*)item;
                [arrayOfNumbers addObject:itemNumber];
            }

            if([item isKindOfClass:NSString.class]){
                [arrayOfStrings addObject:(NSString*)item];
            }

            if([item isKindOfClass:NSDate.class]){
                [arrayOfDates addObject:(NSDate*)item];
            }
        }
        [strongSelf setStrings:[arrayOfStrings copy]];
        [strongSelf setDates:[arrayOfDates copy]];
        [strongSelf setNumbers:[arrayOfNumbers copy]];
    };
}

-(void)setBlockB:(BlockB)blockB {}
-(BlockB) blockB {
    __weak Blocks* weakSelf = self;
    return ^void (Class class) {
        __strong Blocks* strongSelf = weakSelf;
        if ([NSString class] == class) {
            NSMutableString *result = [NSMutableString new];
            for (NSString* item in strongSelf.strings) {
                [result appendString:item];
            }
            strongSelf.blockC(result);
        } else if ([NSNumber class] == class) {
            NSNumber *result = @0;
            for (NSNumber* item in strongSelf.numbers) {
                int sum = [item intValue] + [result intValue];
                result = [[NSNumber alloc] initWithInt:sum];
            }
            strongSelf.blockC(result);
        } else if ([NSDate class] == class) {
            NSDate *result = [NSDate dateWithTimeIntervalSince1970:INT_MIN];
            for (NSDate* item in strongSelf.dates) {
                result = [result laterDate:item];
            }
            
            NSDateFormatter *formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([formatter stringFromDate:result]);
        }
    };
}
@end

