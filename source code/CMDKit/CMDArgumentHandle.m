//
//  CMDArgumentHandle.m
//  CMDKit
//
//  Created by Matteo Pozzi on 01/08/2012.
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#import "CMDArgumentHandle.h"

@interface CMDArgumentHandle ()

@property (strong, nonatomic) NSMutableArray *argumentsArray;
@property (strong, nonatomic) NSArray        *validOptions;
@property (strong, nonatomic) NSMutableArray *illegalOptions;

@end

@implementation CMDArgumentHandle

@synthesize argumentsArray, validOptions, illegalOptions, programName, delegate, version;

-(BOOL)argumentIsOption:(int)n
{
    if (self.argumentsArray.count <= n) {
        NSString *argument = [self.argumentsArray objectAtIndex: n-1];
            
        if (argument.length > 1 && [argument characterAtIndex: 0] == '-') {
            return YES;
        }
        else return NO;
    }
    else return NO;
}

-(BOOL)argumentIsWordOption:(int)n
{
    NSString *argument = [NSString stringWithString: [self.argumentsArray objectAtIndex: n-1]];
    
    if ([self argumentIsOption: n]) {
        
        if (argument.length > 2 && [argument characterAtIndex: 0] == '-' && [argument characterAtIndex: 1] == '-') {
            return YES;
        }
        else return NO;
    }
    else return NO;
}

-(NSString *)getArgument:(int)n
{
    return [self.argumentsArray objectAtIndex: n-1];
}

-(int)getArgumentIndex:(NSString *)argument
{
    NSUInteger index = [self.argumentsArray indexOfObject: argument];
    
    if (index == NSNotFound) {
        return -1;
    }
    else return (int)index;
}

- (NSArray *)getArgumentsForOption:(CMDOption *)option
{
    NSMutableArray *arguments = [NSMutableArray array];
    int optionIndex = [self getArgumentIndex:option.fullString];
    
    for (int c = 1; c <= option.numberOfArguments; ++c) {
        if ([self argumentIsOption:optionIndex + c]) {
            break;
        }
        
        [arguments addObject:[argumentsArray objectAtIndex:optionIndex + c]];
    }
    
    return arguments.copy;
}

-(int)numberOfArguments
{
    return (int)self.argumentsArray.count;
}

-(BOOL)optionIsSpecified:(CMDOption *)option
{
    if ([argumentsArray containsObject:option.fullString]) return YES;
    else                                                   return NO;
}

+(id)argumentHandle
{
    return [[self alloc] init];
}

+(id)argumentHandleWithArguments:(const char *[])arguments count:(int)count
{
    return [[self alloc] initWithArguments: arguments count: count];
}

+(id)argumentHandleWithArgumentHandle:(CMDArgumentHandle *)argumentHandle
{
    return [[self alloc] initWithArgumentHandle: argumentHandle];
}

-(id)initWithArguments:(const char *[])arguments count:(int)count
{
    self=[super init];
    if (self) {
        [self readArguments: arguments count: count];
    }
    return self;
}

-(id)initWithArgumentHandle:(CMDArgumentHandle *)argumentHandle
{
    self=[super init];
    if (self) {
        programName    = argumentHandle.programName.mutableCopy;
        argumentsArray = argumentHandle.argumentsArray.mutableCopy;
        validOptions   = argumentHandle.validOptions.mutableCopy;
        illegalOptions = argumentHandle.illegalOptions.mutableCopy;
    }
    return self;
}

-(void)readArguments:(const char *[])arguments count: (int) count
{
    self.argumentsArray = [NSMutableArray array];
    
    for (int i = 0; i < count; ++i) {
        [argumentsArray addObject: [NSString stringWithCString: arguments[i] encoding: NSUTF8StringEncoding]];
    }
}

-(BOOL)readValidOptions:(NSArray *)options
{
    for (id object in options) {
        if ([object class] != [CMDOption class]) {
            return NO;
        }
    }
    
    self.validOptions = options.copy;
    
    return YES;
}

-(BOOL)readInvalidOptions
{
    BOOL success;
    
    illegalOptions = [NSMutableArray array];
    
    if (argumentsArray && validOptions) {
        for (NSString *argument in argumentsArray) {
            for (CMDOption *validOption in validOptions) {
                if ([argument isEqualToString: validOption.fullString]) {
                    success = YES;
                    break;
                }
            }
            
            if (!success && [self argumentIsOption:(int)([argumentsArray indexOfObject:argument] + 1)]) {
                [illegalOptions addObject:argument];
            }
            
            success = NO;
        }
    }
    
    if (illegalOptions.count > 0) return YES;
    else                          return NO;
}

-(void)printInvalidOptions
{
    const char *printingOption;
    
    if (illegalOptions.count > 0) {
        for (NSString *illegalOption in illegalOptions) {
            if ([self argumentIsWordOption: (int)[argumentsArray indexOfObject:illegalOption] + 1]) {
                printingOption = [[illegalOption substringFromIndex: 2] UTF8String];
            }
            else {
                printingOption = [[illegalOption substringFromIndex: 1] UTF8String];
            }
            
            println([[NSString stringWithFormat:@"%@: invalid option -- %s", programName, printingOption] cStringUsingEncoding:NSUTF8StringEncoding]);
        }
        
        if (version && programName) {
            printlnSpace([[NSString stringWithFormat:@"%@, version %@", programName, version] cStringUsingEncoding:NSUTF8StringEncoding]);
        }
        else {
            newLine();
        }
        
        [self.delegate printUsage];
        newLine();
        
        if ([self.delegate respondsToSelector:@selector(printHelp)]) {
            [self.delegate printHelp];
            newLine();
        }
    }
}

@end
