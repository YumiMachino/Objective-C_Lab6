//
//  GameController.h
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

/// store Dice objects
@property (nonatomic) NSMutableArray *dices;
/// store all the dices held
@property (nonatomic) NSMutableArray *heldDices;

- (instancetype)init;
- (void) holdDie: (NSInteger) diceIndex;
- (void) printDices;
- (void) rollDices;

@end

NS_ASSUME_NONNULL_END
