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
        
        GameController *gameController = [GameController new];
         
      
        /// store 5 dice objects
        for (int i = 1; i < 7; i++){
            Dice *dice = [[Dice alloc] initWithValue: i];
            [[gameController dices]addObject: dice];
        }
        [gameController printDices];
        [gameController rollDices];
        [gameController printDices];

        while (TRUE) {
            
            NSLog(@"%@", instruction);
            NSString *user_input = [InputHandler get_user_input];
            if ([user_input isEqualToString: @"roll"]) {
                /// roll all the dices
//                [gameController rollDices];
//                diceEmojis = @"";
//                for (int i = 0; i < 6; i++){
//                    Dice *dice = [[gameController dices] objectAtIndex:i];
//                    diceEmojis = [diceEmojis stringByAppendingString:[dice currentValue]];
//                    diceEmojis = [diceEmojis stringByAppendingString:@" "];
//                }
//                NSLog(@"diceEmojis: %@", diceEmojis);
                
                NSLog(@"Enter index of the dice you wish to hold");
                NSString *index_user_input = [InputHandler get_user_input];
                if ([index_user_input isEqualToString:@"0"]) {
                    /// add object to holdDices array
                    [gameController holdDie:[index_user_input intValue]];
                    // change visual
                   
                }
            }
        }
    }
    return 0;
}
