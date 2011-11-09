//
//  LPNPhoneNumberMatch.h
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

#import <Foundation/Foundation.h>

@class LPNPhoneNumber;

@interface LPNPhoneNumberMatch : NSObject
{
    @private
    NSUInteger _start;
    NSString *_rawString;
    LPNPhoneNumber *_phoneNumber;
}

@property (nonatomic, assign, readonly) NSUInteger start;
@property (nonatomic, assign, readonly) NSUInteger end;
@property (nonatomic, copy, readonly) NSString *rawString;
@property (nonatomic, strong, readonly) LPNPhoneNumber *phoneNumber;


- (id)initWithStart:(NSUInteger)start rawString:(NSString *)rawString phoneNumber:(LPNPhoneNumber *)phoneNumber;

@end
