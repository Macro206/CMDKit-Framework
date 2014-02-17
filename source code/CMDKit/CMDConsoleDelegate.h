//
//  CMDConsoleDelegate.h
//  CMDKit
//
//  Created by Matteo Pozzi on 09/02/2014.
//  Copyright (c) 2014 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMDConsoleManager;

@protocol CMDConsoleDelegate <NSObject>

@required

- (void)console:(CMDConsoleManager *)console didReceiveInput:(NSString *)input;

@end
