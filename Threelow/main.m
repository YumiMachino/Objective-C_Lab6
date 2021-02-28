//
//  main.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Dice *dice1 = [Dice new];
        Dice *dice2 = [Dice new];
        Dice *dice3 = [Dice new];
        Dice *dice4 = [Dice new];
        Dice *dice5 = [Dice new];
        
        
        while (TRUE) {
            NSString *user_input = [InputHandler get_user_input];
            if ([user_input isEqualToString: @"roll"]) {
                NSLog(@"value: %ld", (long)[dice1 RandomizeValue]);
               
            }
        }
    }
    return 0;
}
