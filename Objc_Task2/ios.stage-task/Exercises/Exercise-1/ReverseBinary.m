#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    CFBitVectorRef r = CFBitVectorCreate(NULL, &n, 8);
    UInt8 resultBits = 0;
    for (int i=7; i>=0; i--){
        CFBit bit = CFBitVectorGetBitAtIndex(r, i);
        UInt8 shiftBits = bit<<i;
        resultBits = resultBits ^ shiftBits;
    }
    return resultBits;
}
