//
//  InputHandler.m
//  Threelow
//
//  Created by Yumi Machino on 2021/02/28.
//

#import "InputHandler.h"

@implementation InputHandler

//// Get user input and return it as a pointer to the NSString
+ (NSString *) get_user_input{
    char str[256];

    NSString *prompt = @"Input:";
    prompt = [prompt stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    NSLog(@"%@", prompt);
    fgets(str, 256,stdin);
    NSString *result = [NSString stringWithCString:str
                                         encoding:NSUTF8StringEncoding];
    
    NSString *trimmed_result = [result stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmed_result;
}


@end
