#import "FibonacciResolver.h"

@interface FibonacciResolver ()
- (int) fibonacciAtIndex:(int)n;
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
        fib1 = [self fibonacciAtIndex:x];
        fib2 = [self fibonacciAtIndex:x+1];
        current_value = fib1 * fib2;
    }

    NSNumber* ret1 = [[NSNumber alloc]initWithInt:fib1];
    NSNumber* ret2 = [[NSNumber alloc]initWithInt:fib2];
    if (current_value == numberValue) {
        
        return @[ret1, ret2, @YES];
    }
    return @[ret1, ret2, @NO];
}

- (int)fibonacciAtIndex:(int)n
{
    return ( n<=2 ? 1 : [self fibonacciAtIndex:n-1] + [self fibonacciAtIndex:(n-2)] );
}
@end
