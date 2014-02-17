//
//  CMDArgumentHandle.h
//  CMDKit
//
//  Created by Matteo Pozzi on 01/08/2012.
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CMDKit/CMDPrinting.h>
#import <CMDKit/CMDPrintingDelegate.h>
#import <CMDKit/CMDOption.h>

@interface CMDArgumentHandle : NSObject

@property (strong, nonatomic) NSString *programName, *version;
@property (strong, nonatomic) id<CMDPrintingDelegate> delegate;

-(BOOL)argumentIsOption:(int)n;
-(BOOL)argumentIsWordOption:(int)n;

-(NSString *)getArgument:(int)n; // N.B. NOT an index. The first argument is 1
-(int)getArgumentIndex:(NSString *)argument; // N.B. This method returns an INDEX (first argument is 0)
-(NSArray *)getArgumentsForOption:(CMDOption *)option;
-(int)numberOfArguments;

-(BOOL)optionIsSpecified:(CMDOption *)option;

-(void)readArguments:(const char *[])arguments count:(int)count;
-(BOOL)readValidOptions:(NSArray *)validOptions;
-(BOOL)readInvalidOptions;

-(void)printInvalidOptions;

@end

@interface CMDArgumentHandle (CMDArgumentHandleCreation)

+(id)argumentHandle;
+(id)argumentHandleWithArguments:(const char *[])arguments count:(int)count;
+(id)argumentHandleWithArgumentHandle:(CMDArgumentHandle *)argumentHandle;

-(id)initWithArguments:(const char *[])arguments count:(int)count;
-(id)initWithArgumentHandle:(CMDArgumentHandle *)argumentHandle;

@end
