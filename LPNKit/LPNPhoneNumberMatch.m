//
//  LPNPhoneNumberMatch.m
//  LPNKit
//
//  Created by Darryl Thomas on 11/9/11.
//  Based on original code and protocol buffer:
//    Copyright (C) 2010-2011 The Libphonenumber Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "LPNPhoneNumberMatch.h"

@implementation LPNPhoneNumberMatch

@synthesize start=_start;
@synthesize rawString=_rawString;
@synthesize phoneNumber=_phoneNumber;


- (id)initWithStart:(NSUInteger)start rawString:(NSString *)rawString phoneNumber:(LPNPhoneNumber *)phoneNumber
{
    NSParameterAssert(rawString != nil);
    NSParameterAssert(phoneNumber != nil);
 
    self = [super init];
    if (self) {        
        _start = start;
        _rawString = [rawString copy];
        _phoneNumber = phoneNumber;
    }
    
    return self;
}


- (void)dealloc
{
    [_rawString release];
    [_phoneNumber release];
}


- (NSUInteger)end
{
    return self.start + [self.rawString length];
}


- (NSUInteger)hash
{
    NSUInteger result = 41;
    
    result = (53 * result) + self.start;
    result = (53 * result) + [self.rawString hash];
    result = (53 * result) + [self.phoneNumber hash];
    
    return result;
}


- (BOOL)isEqual:(id)object
{
    if (object == self)
        return YES;
    
    if (![object isKindOfClass:[self class]])
        return NO;
    
    LPNPhoneNumberMatch *other = (LPNPhoneNumberMatch *)object;
    
    return (
            (self.start == other.start) &&
            ([self.rawString isEqualToString:other.rawString]) &&
            ([self.phoneNumber isEqual:other.phoneNumber])
            );
}

@end
