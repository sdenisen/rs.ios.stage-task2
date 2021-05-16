#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray ==  nil || [numbersArray count] ==0){
        return @"";
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intValue < 0 "];
    if ([[numbersArray filteredArrayUsingPredicate:predicate] count] > 0){
        return @"Negative numbers are not valid for input.";
    }
    
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"intValue > 255"];
    if ([[numbersArray filteredArrayUsingPredicate:predicate2] count] > 0){
        return @"The numbers in the input array can be in the range from 0 to 255.";
    }
    
    NSArray *r;
    if ([numbersArray count] <= 4)
        r = numbersArray;
    else
        r = [numbersArray subarrayWithRange:NSMakeRange(0, 4)];
    
    NSMutableArray *rr = [[NSMutableArray alloc] initWithArray:r];
    for (int i=(int)[rr count]; i<4; i++){
        [rr addObject:@(0)];
    }
    return [rr componentsJoinedByString:@"."];
}

@end
