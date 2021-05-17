#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    for(int i=0; i<array.count; i++){
        for (int j=i+1; j<array.count; j++){
            if (abs((int)array[i].integerValue - (int)array[j].integerValue) == number.integerValue){
                count ++;
            }
        }
    }
    
    return count;
}

@end
