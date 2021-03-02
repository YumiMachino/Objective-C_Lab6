//
//  GameController.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dices = [NSMutableArray new];
        _heldDices = [NSMutableArray new];
    }
    return self;
}

/// hold specific dice and print
- (void) holdDie: (NSInteger) diceIndex {
    [_heldDices addObject: [_dices objectAtIndex: diceIndex]];
    
    NSString *diceEmojis = @"";
    for (int i = 0; i < [_dices count] ; i++) {
        Dice *dice = [_dices objectAtIndex:i];
        if (i == diceIndex) {
            diceEmojis = [diceEmojis stringByAppendingString:@" ["];
            diceEmojis = [diceEmojis stringByAppendingString:[dice currentValue]];
            diceEmojis = [diceEmojis stringByAppendingString:@"] "];
        } else {
            diceEmojis = [diceEmojis stringByAppendingString:[dice currentValue]];
            diceEmojis = [diceEmojis stringByAppendingString:@" "];
        }
    }
    NSLog(@"diceEmojis: %@", diceEmojis);
}
 

/// print all the dices
- (void) printDices{
      NSString *diceEmojis = @"";
      /// store 5 dice objects
      for (int i = 0; i < 6; i++){
          Dice *dice = [_dices objectAtIndex:i];
          diceEmojis = [diceEmojis stringByAppendingString:[dice currentValue]];
          diceEmojis = [diceEmojis stringByAppendingString:@" "];
      }
      NSLog(@"diceEmojis: %@", diceEmojis);
}

/// roll all the dices
- (void) rollDices {
    for (int i = 0; i < [_dices count]; i++){
        Dice *dice = [_dices objectAtIndex: i];
        [dice RandomizeValue];
    }
}


@end
