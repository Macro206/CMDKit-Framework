//
//  CMDPrintingDelegate.h
//  CMDKit
//
//  Created by Matteo Pozzi on 19/08/2012.
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CMDPrintingDelegate <NSObject>

@required

-(void)printUsage;

@optional

-(void)printHelp;

@end
