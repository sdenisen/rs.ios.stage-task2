#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"intValue == %d", [number intValue]];
//    int a = [[array filteredArrayUsingPredicate: predicate] count];
    NSInteger count = 0;
    for(int i=0; i<[array count]; i++){
        for (int j=i+1; j<[array count]; j++){
            if (abs([array[i] intValue] - [array[j] intValue]) == [number intValue]){
                count = count + 1;
            }
        }
    }
    
    return count;
}

@end
