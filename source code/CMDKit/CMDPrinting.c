//
//  CMDPrinting.c
//  CMDKit
//
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

#include "CMDPrinting.h"

void print(CMDPrintingType printingType, const char *format, ...) {
    va_list args;
    va_start(args, format);
    
    switch (printingType) {
        case CMDPrintSameLine:
            vprintf(format, args);
            break;
        
        case CMDPrintWithNewLine:
            vprintf(format, args);
            newLine();
            break;
        
        case CMDPrintWithLineSpace:
            vprintf(format, args);
            newLineSpace();
            break;
        
        default:
            vprintf(format, args);
            break;
    }
    
    va_end(args);
}

void println(const char *format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    newLine();
    va_end(args);
}

void printlnSpace(const char *format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    newLineSpace();
    va_end(args);
}

void printNewLines(int n) {
    int i;
    for (i = 0; i <= n; ++i) {
        newLine();
    }
}


void newLine() {
    printf("\n");
}

void newLineSpace() {
    printf("\n\n");
}