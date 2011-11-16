//
//  LPNPhoneNumberUtil.m
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

#import "LPNPhoneNumberUtil.h"

static LPNPhoneNumberUtil *sharedPhoneNumberUtil = nil;

@implementation LPNPhoneNumberUtil

@synthesize supportedRegions=_supportedRegions;

+ (id)sharedPhoneNumberUtil
{
    if (!sharedPhoneNumberUtil) {
        sharedPhoneNumberUtil = [[LPNPhoneNumberUtil alloc] init];
    }
    
    return sharedPhoneNumberUtil;
}


+ (void)resetSharedPhoneNumberUtil
{
    [sharedPhoneNumberUtil release], sharedPhoneNumberUtil = nil;
}


- (LPNPhoneMetadata *)metadataForRegion:(NSString *)regionCode
{
    return nil;
}


- (BOOL)isLeadingZeroPossibleForCountryCallingCode:(NSUInteger)countryCallingCode
{
    return NO;
}


- (NSUInteger)lengthOfGeographicalAreaCodeForPhoneNumber:(id)phoneNumber
{
    return NSUIntegerMax;
}


- (NSUInteger)lengthOfNationalDestinationCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return NSUIntegerMax;
}


- (NSString *)nationalSignificantNumberForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return nil;
}


- (LPNPhoneNumber *)examplePhoneNumberForRegion:(NSString *)regionCode
{
    return [self examplePhoneNumberOfType:LPNPhoneNumberFixedLineType forRegion:regionCode];
}


- (LPNPhoneNumber *)examplePhoneNumberOfType:(LPNPhoneNumberType)numberType forRegion:(NSString *)regionCode
{
    return nil;
}


- (NSString *)stringByConvertingAlphaCharactersInNumberString:(NSString *)numberString
{
    return nil;
}


- (NSString *)normalizedString:(NSString *)numberString
{
    return nil;
}


- (NSString *)normalizedStringWithDigitsOnly:(NSString *)numberString
{
    return [self normalizedString:numberString keepNonDigits:NO];
}


- (NSString *)normalizedString:(NSString *)numberString keepNonDigits:(BOOL)keepNonDigits
{
    return nil;
}


- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format
{
    return nil;
}


- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode
{
    return [self outOfCountryCallingNumberStringWithPhoneNumber:phoneNumber region:regionCode keepAlphaCharacters:NO];
}


- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode keepAlphaCharacters:(BOOL)keepAlpha
{
    return nil;
}

@end
