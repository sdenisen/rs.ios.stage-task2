#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray ==  nil || [numbersArray count] ==0){
        return @"";
    }

    NSArray *four_oktets;
    if (numbersArray.count <= 4){
        NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray: numbersArray];
        for (int i=(int)tmp.count; i<4; i++){
            [tmp addObject:@(0)];
        }
        four_oktets = [[NSArray alloc] initWithArray: tmp];
    }
    else
        four_oktets = [[NSArray alloc] initWithArray: [numbersArray subarrayWithRange:NSMakeRange(0, 4)]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intValue < 0 "];
    if ([[four_oktets filteredArrayUsingPredicate:predicate] count] > 0){
        return @"Negative numbers are not valid for input.";
    }
    
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"intValue > 255"];
    if ([[four_oktets filteredArrayUsingPredicate:predicate2] count] > 0){
        return @"The numbers in the input array can be in the range from 0 to 255.";
    }
    
    return [four_oktets componentsJoinedByString:@"."];
}

@end
