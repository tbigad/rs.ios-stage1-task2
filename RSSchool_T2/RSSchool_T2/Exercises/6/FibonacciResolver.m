#import "FibonacciResolver.h"

@interface FibonacciResolver ()
- (int) fibonacci:(int)n;
@end

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int current_value = 0;
    int x = 0;
    int fib1 = 0;
    int fib2 = 0;
    int numberValue = [number intValue];

    while (current_value < numberValue) {
        x++;
        fib1 = [self fibonacci:x];
        fib2 = [self fibonacci:x+1];
        current_value = fib1 * fib2;
    }

    NSNumber* ret1 = [[NSNumber alloc]initWithInt:fib1];
    NSNumber* ret2 = [[NSNumber alloc]initWithInt:fib2];
    if (current_value == numberValue) {
        return @[ret1, ret2, @YES];
    }
    return @[ret1, ret2, @NO];
}

- (int)fibonacci:(int)atIndex
{
    return ( atIndex<=2 ? 1 : [self fibonacci:atIndex-1] + [self fibonacci:(atIndex-2)] );
}
@end
