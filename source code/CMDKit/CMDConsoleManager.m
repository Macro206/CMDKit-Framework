//
//  ConsoleManager.m
//  CMDKit
//
//  Created by Matteo Pozzi on 08/02/2014.
//  Copyright (c) 2014 Matteo G. Pozzi. All rights reserved.
//

#import "CMDConsoleManager.h"

@interface CMDConsoleManager ()

@property (atomic) BOOL isConsoleRunning;

@end

@implementation CMDConsoleManager

@synthesize consolePrefix, delegate, isConsoleRunning, maxBufferSize;

- (void)startConsole
{
    if (isConsoleRunning) return;
    isConsoleRunning = YES;
    
    [self readInput];
}

- (void)stopConsole
{
    isConsoleRunning = NO;
}

- (void)readInput
{
    while (isConsoleRunning) {
        printf("%s ", [consolePrefix cStringUsingEncoding:NSUTF8StringEncoding]);
        char string[maxBufferSize];
        if (fgets(string, maxBufferSize, stdin) != NULL) {
            NSString *inputString = [NSString stringWithCString:string encoding:NSUTF8StringEncoding];
            inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            [delegate console:self didReceiveInput:inputString];
        }
        else {
#ifdef DEBUG
            NSLog(@"Console Error occurred");
#endif
        }
    }
}

+ (id)consoleManagerWithPrefix:(NSString *)prefix andMaxBufferSize:(int)bufferSize
{
    return [[self alloc] initWithPrefix:prefix andMaxBufferSize:bufferSize];
}

- (id)initWithPrefix:(NSString *)prefix andMaxBufferSize:(int)bufferSize
{
    self = [super init];
    if (self) {
        self.consolePrefix = prefix;
        self.maxBufferSize = bufferSize == 0 ? DEFAULT_BUFFER_SIZE : bufferSize;
        isConsoleRunning = NO;
    }
    return self;
}

@end
