//
//  ConsoleManager.h
//  CMDKit
//
//  Created by Matteo Pozzi on 08/02/2014.
//  Copyright (c) 2014 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CMDKit/CMDPrinting.h>
#import <CMDKit/CMDConsoleDelegate.h>

#define DEFAULT_BUFFER_SIZE 100

@interface CMDConsoleManager : NSObject

@property (strong, nonatomic) NSString *consolePrefix;
@property (strong, nonatomic) id<CMDConsoleDelegate> delegate;

@property (nonatomic) unsigned maxBufferSize; // maximum length of the console input. If 0, DEFAULT_BUFFER_SIZE is used

- (void)startConsole;
- (void)stopConsole;

+ (id)consoleManagerWithPrefix:(NSString *)prefix andMaxBufferSize:(int)bufferSize;
- (id)initWithPrefix:(NSString *)prefix andMaxBufferSize:(int)bufferSize;

@end
