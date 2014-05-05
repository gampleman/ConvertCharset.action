//
//  Convert_Charset.m
//  Convert Charset
//
//  Created by Jakub Hampl on 05/05/2014.
//  Copyright (c) 2014 Jakub Hampl. All rights reserved.
//

#import "Convert_Charset.h"
#import <OSAKit/OSAKit.h>

@implementation Convert_Charset

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
    NSError *error;
	for (NSString *path in input) {
        NSNumber *from = [self parameters][@"from"];
        NSNumber *to = [self parameters][@"to"];
        NSString *data = [NSString stringWithContentsOfFile:path encoding: [from longValue] error:&error];
        if (data) {
            BOOL ok = [data writeToFile:path atomically:YES
                               encoding:[to longValue] error:&error];
            if (!ok) {
                *errorInfo = @{ OSAScriptErrorNumber: @(errOSASystemError), OSAScriptErrorMessage :[NSString stringWithFormat:@"ERROR: Could not convert file: %@\n", path]};
                return nil;
            }
        } else {
            *errorInfo = @{ OSAScriptErrorNumber: @(errOSASystemError), OSAScriptErrorMessage :[NSString stringWithFormat:@"ERROR: Could not convert file: %@\n", path] };
            return nil;
        }
        
    }
	return input;
}

@end
