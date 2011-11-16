//
//  LPNPhoneNumberUtil.h
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
#import "LPNPhoneNumber.h"

@class LPNPhoneMetadata;

@interface LPNPhoneNumberUtil : NSObject

@property (nonatomic, copy, readonly) NSArray *supportedRegions;

+(id)sharedPhoneNumberUtil;
+(void)resetSharedPhoneNumberUtil;

- (LPNPhoneMetadata *)metadataForRegion:(NSString *)regionCode;
- (BOOL)isLeadingZeroPossibleForCountryCallingCode:(NSUInteger)countryCallingCode;
- (NSUInteger)lengthOfGeographicalAreaCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (NSUInteger)lengthOfNationalDestinationCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (NSString *)nationalSignificantNumberForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (LPNPhoneNumber *)examplePhoneNumberForRegion:(NSString *)regionCode;
- (LPNPhoneNumber *)examplePhoneNumberOfType:(LPNPhoneNumberType)numberType forRegion:(NSString *)regionCode;
- (NSString *)stringByConvertingAlphaCharactersInNumberString:(NSString *)numberString;
- (NSString *)normalizedString:(NSString *)numberString;
- (NSString *)normalizedStringWithDigitsOnly:(NSString *)numberString;
- (NSString *)normalizedString:(NSString *)numberString keepNonDigits:(BOOL)keepNonDigits;
- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format;
- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode;
- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode keepAlphaCharacters:(BOOL)keepAlpha;

@end
