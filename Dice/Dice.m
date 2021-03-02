//
//  Dice.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import "Dice.h"

@implementation Dice

- (instancetype)initWithValue: (NSInteger) value
{
    self = [super init];
    if (self) {
        if (value == 1) {
            NSString *emoji = @"⚀";
            _currentValue = emoji;
        } else if (value == 2) {
            NSString *emoji = @"⚁";
            _currentValue = emoji;
        } else if (value == 3) {
            NSString *emoji = @"⚂";
            _currentValue = emoji;
        } else if (value == 4) {
            NSString *emoji = @"⚃";
            _currentValue = emoji;
        } else if (value == 5) {
            NSString *emoji = @"⚄";
            _currentValue = emoji;
        } else if (value == 6) {
            NSString *emoji = @"⚅";
            _currentValue = emoji;
        }
    }
    return self;
}

// randomize the current value here
- (void) RandomizeValue {
    NSInteger newValue = arc4random_uniform(7);
    if (newValue == 1) {
        NSString *emoji = @"⚀";
        [self setCurrentValue:emoji];
    } else if (newValue == 2) {
        NSString *emoji = @"⚁";
        [self setCurrentValue:emoji];
    } else if (newValue == 3) {
        NSString *emoji = @"⚂";
        [self setCurrentValue:emoji];
    } else if (newValue == 4) {
        NSString *emoji = @"⚃";
        [self setCurrentValue:emoji];
    } else if (newValue == 5) {
        NSString *emoji = @"⚄";
        [self setCurrentValue:emoji];
    } else if (newValue == 6) {
        NSString *emoji = @"⚅";
        [self setCurrentValue:emoji];
    }
}





@end
