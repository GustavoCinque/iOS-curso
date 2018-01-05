//
//  NSString+Utils.m
//  Carros Aula
//
//  Created by C1284047 (Edi Vergis) on 29/12/2017.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

-  (NSString *)clearCharsets{
    NSString *string = [self stringByReplacingOccurrencesOfString:@"[\r\n\t]"
                                    withString:@""
                                       options:NSRegularExpressionSearch
                                                            range:NSMakeRange(0, self.length)];
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end
