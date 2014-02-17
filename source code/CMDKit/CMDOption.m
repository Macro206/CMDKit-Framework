//
//  CMDOption.m
//  CMDKit
//
//  Created by Matteo Pozzi on 29/08/2012.
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#import "CMDOption.h"

@implementation CMDOption

@synthesize numberOfArguments, isWordOption, name;

- (NSString *)fullString
{
    if (self.isWordOption) {
        return [@"--" stringByAppendingString:name];
    }
    else {
        return [@"-" stringByAppendingString:name];
    }
}

+(id)option
{
    return [[self alloc] init];
}

+(id)optionWithNumberOfArguments:(int)n isWord:(BOOL)isWord name:(NSString *)aName
{
    return [[self alloc] initWithNumberOfArguments: n isWord: isWord name: aName];
}

-(id)initWithNumberOfArguments:(int)n isWord:(BOOL)isWord name:(NSString *)aName
{
    self=[super init];
    if (self) {
        numberOfArguments = n;
        self.isWordOption = isWord;
        self.name = aName;
    }
    return self;
}

@end
