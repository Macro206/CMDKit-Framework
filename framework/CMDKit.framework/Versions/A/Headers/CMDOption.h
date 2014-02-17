//
//  CMDOption.h
//  CMDKit
//
//  Created by Matteo Pozzi on 29/08/2012.
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDOption : NSObject

@property (nonatomic) int  numberOfArguments;
@property (nonatomic) BOOL isWordOption;       // (double dash)
@property (strong, nonatomic) NSString *name;  // NOT including the dash/dashes

- (NSString *)fullString; // string including the dash/dashes

@end

@interface CMDOption (CMDOptionCreation)

+(id)option;
+(id)optionWithNumberOfArguments:(int)n isWord:(BOOL)isWord name:(NSString *)aName;

-(id)initWithNumberOfArguments:(int)n isWord:(BOOL)isWord name:(NSString *)aName;

@end