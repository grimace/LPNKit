//
//  LPNPhoneNumberTests.m
//  LPNKit
//
//  Created by Darryl Thomas on 11/8/11.
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

#import "LPNPhoneNumberTests.h"
#import "LPNPhoneNumber.h"

@implementation LPNPhoneNumberTests

- (void)testEqualSimpleNumber
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    
    STAssertEqualObjects(phoneNumberA, phoneNumberB, @"Identical phone numbers should be equal.");
    STAssertEquals([phoneNumberA hash], [phoneNumberB hash], @"Identical phone numbers should have the same hash.");
}


- (void)testEqualWithItalianLeadingZeroSetToDefault
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    phoneNumberA.italianLeadingZero = NO;
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    
    STAssertEqualObjects(phoneNumberA, phoneNumberB, @"Identical phone numbers with hasItalianLeadingZero set to default should be equal.");
    STAssertEquals([phoneNumberA hash], [phoneNumberB hash], @"Identical phone numbers with hasItalianLeadingZero set to default should have the same hash.");
}


- (void)testEqualWithCountryCodeSourceSet
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.rawInput = @"+1 650 253 00 00";
    phoneNumberA.countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.rawInput = @"+1 650 253 00 00";
    phoneNumberB.countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    
    STAssertEqualObjects(phoneNumberA, phoneNumberB, @"Identical phone numbers should be equal.");
    STAssertEquals([phoneNumberA hash], [phoneNumberB hash], @"Identical phone numbers should have the same hash.");
}


- (void)testNonEqualWithItalianLeadingZeroSetToTrue
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    phoneNumberA.italianLeadingZero = YES;
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    
    STAssertFalse([phoneNumberA isEqual:phoneNumberB], @"Otherwise identical phone numbers with hasItalianLeadingZero set to YES should not be equal.");
    STAssertFalse([phoneNumberA hash] == [phoneNumberB hash], @"Otherwise identical phone numbers with hasItalianLeadingZero set to YES should not have the same hash.");
}


- (void)testNonEqualWithDifferingRawInput
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    phoneNumberA.rawInput = @"+1 650 253 00 00";
    phoneNumberA.countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    phoneNumberB.rawInput = @"+1-650-253-00-00";
    phoneNumberB.countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    
    STAssertFalse([phoneNumberA isEqual:phoneNumberB], @"Phone numbers should not be equal when raw input differs.");
    STAssertFalse([phoneNumberA hash] == [phoneNumberB hash], @"Hashes should not be equal when raw input differs.");
}


- (void)testNonEqualWithPreferredDomesticCarrierCodeSetToDefault
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    phoneNumberA.preferredDomesticCarrierCode = @"";
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    
    STAssertFalse([phoneNumberA isEqual:phoneNumberB], @"Phone numbers should not be equal when preferred domestic carrier code is set to default.");
    STAssertFalse([phoneNumberA hash] == [phoneNumberB hash], @"Hashes should not be equal when preferred domestic carrier code is set to default.");
}


- (void)testEqualWithPreferredDomesticCarrierCodeSetToDefault
{
    LPNPhoneNumber *phoneNumberA = [[LPNPhoneNumber alloc] init];
    phoneNumberA.countryCode = 1;
    phoneNumberA.nationalNumber = 6502530000;
    phoneNumberA.preferredDomesticCarrierCode = @"";
    
    LPNPhoneNumber *phoneNumberB = [[LPNPhoneNumber alloc] init];
    phoneNumberB.countryCode = 1;
    phoneNumberB.nationalNumber = 6502530000;
    phoneNumberB.preferredDomesticCarrierCode = @"";
    
    STAssertTrue([phoneNumberA isEqual:phoneNumberB], @"Phone numbers should be equal when preferred domestic carrier code is set to default on both.");
    STAssertTrue([phoneNumberA hash] == [phoneNumberB hash], @"Hashes should be equal when preferred domestic carrier code is set to default on both.");
}


@end
