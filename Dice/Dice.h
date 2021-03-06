//
//  Dice.h
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSString* currentValue;
- (instancetype)initWithValue: (NSInteger) value;
- (void) RandomizeValue ;
@end

NS_ASSUME_NONNULL_END
