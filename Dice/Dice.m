//
//  Dice.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentValue = 0;
    }
    return self;
}

// randomize the current value here
- (NSInteger) RandomizeValue {
    NSInteger newValue = arc4random_uniform(7);
    return newValue;
}
 

@end
