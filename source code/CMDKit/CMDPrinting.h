//
//  CMDPrinting.h
//  CMDKit
//
//  Copyright (c) 2012 Matteo G. Pozzi. All rights reserved.
//

typedef enum {CMDPrintSameLine, CMDPrintWithNewLine, CMDPrintWithLineSpace} CMDPrintingType;

void print(CMDPrintingType printingType, const char *format, ...);

void println(const char *format, ...);          // Prints and goes to a new line
void printlnSpace(const char *format, ...);     // Prints and leaves one empty line
void printNewLines(int n);                      // Prints "\n" (a new line) "n" times

void newLine();                                 // Prints a new line ("\n")
void newLineSpace();                            // Prints an empty line ("\n\n")