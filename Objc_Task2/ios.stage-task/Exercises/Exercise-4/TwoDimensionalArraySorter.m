#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *numbers = [NSMutableArray new];
    NSMutableArray *strings = [NSMutableArray new];
    
    for (id sub_array in array){
        if([sub_array isKindOfClass:[NSArray class]] == NO){
            return @[];
        }
        
        for (id obj in sub_array){
            if ([obj isKindOfClass:[NSNumber class]]){
                [numbers addObject:obj];
            }
            if ([obj isKindOfClass:[NSString class]]){
                [strings addObject:obj];
            }
        }
    }
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    [numbers sortUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    
    BOOL sort_direction = numbers.count == 0? YES: NO;
    NSSortDescriptor* sortOrderString = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: sort_direction];
    [strings sortUsingDescriptors:[NSArray arrayWithObject:sortOrderString]];
    
    NSMutableArray *result = [NSMutableArray new];
    if (numbers.count && strings.count){
        [result addObject:[numbers copy]];
        [result addObject:[strings copy]];
        return [result copy];
    }
    
    if (numbers.count){
        return [numbers copy];
    }
    
    if (strings.count){
        return [strings copy];
    }
    return @[];
}

@end
