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
        NSLog(@"Already held. Do you want to un-hold it? Enter Y or N");
        NSString *answer = [InputHandler get_user_input];
        if ([answer isEqualToString:@"Y"]) {
            [_heldDices removeObject: [_dices objectAtIndex:diceIndex]];
        } else if ([answer isEqualToString:@"N"]) {
            NSLog(@"Select hold, and enter index again");
        }
    } else {
        [_heldDices addObject: [_dices objectAtIndex: diceIndex]];
        [self printScore];
    }
}

/// roll all the dices
- (void) rollDices {
    for (int i = 0; i < [_dices count]; i++){
        Dice *dice = [_dices objectAtIndex: i];
        if ([_heldDices containsObject:dice]) {
            continue;
        } else {
            [dice RandomizeValue];
        }
    }
}

/// reset all held dice
- (void) resetDice {
    [_heldDices removeAllObjects];
    [self printScore];
}

/// calculate and resurn s the current score added up by held dice values
- (void) printScore {
    NSLog(@"----------------------");
    NSLog(@"--   Current Dice   --");
    
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
    NSLog(@"%@", diceEmojis);
    NSInteger score = 0;
    for (int i = 0; i < [_heldDices count] ; i++){
        Dice *dice = [_heldDices objectAtIndex:i];
        if ([[dice currentValue] isEqualToString:@"⚀"]) {
            score = score + 1;
        } else if ([[dice currentValue] isEqualToString:@"⚁"]) {
            score = score + 2;
        } else if ([[dice currentValue] isEqualToString:@"⚂"]) {
            score = score + 3;
        } else if ([[dice currentValue] isEqualToString:@"⚃"]) {
            score = score + 4;
        } else if ([[dice currentValue] isEqualToString:@"⚄"]) {
            score = score + 5;
        } else if ([[dice currentValue] isEqualToString:@"⚅"]) {
            score = score + 6;
        }
    }
    
    NSLog(@"--    Total Score   --");
    NSLog(@"Score: %ld", (long)score);
    NSLog(@"----------------------");
}


@end
