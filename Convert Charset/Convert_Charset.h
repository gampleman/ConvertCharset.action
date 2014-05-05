//
//  Convert_Charset.h
//  Convert Charset
//
//  Created by Jakub Hampl on 05/05/2014.
//  Copyright (c) 2014 Jakub Hampl. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface Convert_Charset : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
