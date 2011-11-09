//
//  LPNPhoneNumberMatchTests.m
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

#import "LPNPhoneNumberMatchTests.h"
#import "LPNPhoneNumber.h"
#import "LPNPhoneNumberMatch.h"

@implementation LPNPhoneNumberMatchTests

- (void)testValueTypeSemantics
{
    LPNPhoneNumber *phoneNumber = [[LPNPhoneNumber alloc] init];
    LPNPhoneNumberMatch *match1 = [[LPNPhoneNumberMatch alloc] initWithStart:10 rawString:@"1 800 234 45 67" phoneNumber:phoneNumber];
    LPNPhoneNumberMatch *match2 = [[LPNPhoneNumberMatch alloc] initWithStart:10 rawString:@"1 800 234 45 67" phoneNumber:phoneNumber];
    
    STAssertEqualObjects(match1, match2, @"Identical matches should be equal.");
    STAssertEquals([match1 hash], [match2 hash], @"Identical matches should have the same hash.");
    STAssertEquals(match1.start, match2.start, @"Identical matches should have the same start.");
    STAssertEquals(match1.end, match2.end, @"Identical matches should have the same end.");
    STAssertEqualObjects(match1.phoneNumber, match2.phoneNumber, @"Identical matches should have the same phone number.");
    STAssertEqualObjects(match1.rawString, match2.rawString, @"Identical matches should have the same raw string.");
    STAssertEqualObjects(@"1 800 234 45 67", match1.rawString, @"Raw string should be unchanged.");
    
    [match1 release];
    [match2 release];
    [phoneNumber release];
}


// TODO: add tests for invalid parameters
- (void)testInvalidParameters
{
    STAssertThrows([[LPNPhoneNumberMatch alloc] initWithStart:10 rawString:@"1 800 234 45 67" phoneNumber:nil], @"Must be initialized with a phone number.");
    STAssertThrows([[LPNPhoneNumberMatch alloc] initWithStart:10 rawString:nil phoneNumber:[[LPNPhoneNumber alloc] init]], @"Must be initialized with a raw string.");
    STAssertThrows([[LPNPhoneNumberMatch alloc] initWithStart:10 rawString:nil phoneNumber:nil], @"Must be initialized with both a phone number and a raw string.");
}

@end
