//
//  LPNPhoneNumber.h
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

#import <Foundation/Foundation.h>

typedef enum {
    LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource,
    LPNPhoneNumberCountryCodeFromNumberWithIDDSource,
    LPNPhoneNumberCountryCodeFromNumberWithoutPlusSignSource,
    LPNPhoneNumberCountryCodeFromDefaultCountrySource,
} LPNPhoneNumberCountryCodeSource;

@interface LPNPhoneNumber : NSObject
{
    @protected
    uint32_t _countryCode;
    uint64_t _nationalNumber;
    NSString *_extension;
    BOOL _hasItalianLeadingZero;
    NSString *_rawInput;
    LPNPhoneNumberCountryCodeSource _countryCodeSource;
    NSString *_preferredDomesticCarrierCode;
    
}

// TODO: initially defining as readonly until setters are needed
@property (nonatomic, assign, readonly) uint32_t countryCode;
@property (nonatomic, assign, readonly) uint64_t nationalNumber;
@property (nonatomic, copy, readonly) NSString *extension;
@property (nonatomic, assign, readonly) BOOL hasItalianLeadingZero;
@property (nonatomic, copy, readonly) NSString *rawInput;
@property (nonatomic, assign, readonly) LPNPhoneNumberCountryCodeSource countryCodeSource;
@property (nonatomic, copy, readonly) NSString *preferredDomesticCarrierCode;

@end
