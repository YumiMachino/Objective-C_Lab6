//
//  main.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *instruction = @"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold a dice\n'done' to end the game\n'display' to show current status\n";
        NSInteger remainingRolls = 5;
        
        GameController *gameController = [GameController new];
        
      
        /// store 5 dice objects
        for (int i = 1; i < 7; i++){
            Dice *dice = [[Dice alloc] initWithValue: i];
            [[gameController dices]addObject: dice];
        }

        while (TRUE) {
            
            NSLog(@"%@", instruction);
            NSString *user_input = [InputHandler get_user_input];
            if ([user_input isEqualToString: @"roll"]) {
                /// roll all the dices
                remainingRolls -= 1;
                [gameController rollDices];
                NSLog(@"Remaining Rolls: %ld", (long)remainingRolls);
                [gameController printScore];
            
            }else if ([user_input isEqualToString: @"hold"]) {
                NSLog(@"\nEnter the number of the dice: ");
                NSString *index_user_input = [InputHandler get_user_input];
                if ([index_user_input isEqualToString:@"0"] || [index_user_input isEqualToString:@"1"] || [index_user_input isEqualToString:@"2"] || [index_user_input isEqualToString:@"3"] || [index_user_input isEqualToString:@"4"] ||[index_user_input isEqualToString:@"5"] || [index_user_input isEqualToString:@"6"]) {
                    /// add object to holdDices array, change visual representation
                    NSLog(@"Remaining Rolls: %ld", (long)remainingRolls);
                    [gameController holdDice:[index_user_input intValue]];
                }
                
            }
            else if ([user_input isEqualToString:@"reset"]) {
                [gameController resetDice];
            }
        }
    }
    return 0;
}
