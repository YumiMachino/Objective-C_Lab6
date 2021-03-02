//
//  GameController.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import "GameController.h"
#import "Dice.h"
#import "InputHandler.h"

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
- (void) holdDice: (NSInteger) diceIndex {
    if ([_heldDices containsObject:[_dices objectAtIndex:diceIndex]]) {
        NSLog(@"\nAlready held. Do you want to un-hold it? Enter Y or N");
        NSString *answer = [InputHandler get_user_input];
        if ([answer isEqualToString:@"Y"]) {
            [_heldDices removeObject: [_dices objectAtIndex:diceIndex]];
            [self printDices];
        } else if ([answer isEqualToString:@"N"]) {
            NSLog(@"Enter index again");
        }
    } else {
        [_heldDices addObject: [_dices objectAtIndex: diceIndex]];
        [self printDices];
    }
}
 

/// print all the dices
- (void) printDices{
      NSString *diceEmojis = @"";
      /// store 5 dice objects
      for (int i = 0; i < 6; i++){
          Dice *dice = [_dices objectAtIndex:i];
          if ([_heldDices containsObject:dice]) {
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

/// roll all the dices
- (void) rollDices {
    for (int i = 0; i < [_dices count]; i++){
        Dice *dice = [_dices objectAtIndex: i];
        [dice RandomizeValue];
    }
}

/// reset all held dice
- (void) resetDice {
    [_heldDices removeAllObjects];
    [self printDices];
}



@end
