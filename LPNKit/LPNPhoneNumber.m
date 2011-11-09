//
//  LPNPhoneNumber.m
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

#import "LPNPhoneNumber.h"

@implementation LPNPhoneNumber

@synthesize countryCode=_countryCode;
@synthesize nationalNumber=_nationalNumber;
@synthesize extension=_extension;
@synthesize italianLeadingZero=_italianLeadingZero;
@synthesize rawInput=_rawInput;
@synthesize countryCodeSource=_countryCodeSource;
@synthesize preferredDomesticCarrierCode=_preferredDomesticCarrierCode;


- (id)init
{
    self = [super init];
    if (self) {
        self.countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    }
    
    return self;
}


- (void)setCountryCode:(uint32_t)countryCode
{
    [self willChangeValueForKey:@"countryCode"];
    [self willChangeValueForKey:@"hasCountryCode"];
    _stateFlags.hasCountryCode = YES;
    _countryCode = countryCode;
    [self didChangeValueForKey:@"countryCode"];
    [self didChangeValueForKey:@"hasCountryCode"];
}


- (void)clearCountryCode
{
    [self willChangeValueForKey:@"countryCode"];
    [self willChangeValueForKey:@"hasCountryCode"];
    _stateFlags.hasCountryCode = NO;
    _countryCode = 0;
    [self didChangeValueForKey:@"countryCode"];
    [self didChangeValueForKey:@"hasCountryCode"];
}


- (BOOL)hasCountryCode
{
    return _stateFlags.hasCountryCode;
}


- (void)setNationalNumber:(uint64_t)nationalNumber
{
    [self willChangeValueForKey:@"nationalNumber"];
    [self willChangeValueForKey:@"hasNationalNumber"];
    _stateFlags.hasNationalNumber = YES;
    _nationalNumber = nationalNumber;
    [self didChangeValueForKey:@"nationalNumber"];
    [self didChangeValueForKey:@"hasNationalNumber"];
}


- (void)clearNationalNumber
{
    [self willChangeValueForKey:@"nationalNumber"];
    [self willChangeValueForKey:@"hasNationalNumber"];
    _stateFlags.hasNationalNumber = NO;
    _nationalNumber = 0;
    [self didChangeValueForKey:@"nationalNumber"];
    [self didChangeValueForKey:@"hasNationalNumber"];
}


- (BOOL)hasNationalNumber
{
    return _stateFlags.hasNationalNumber;
}


- (void)setItalianLeadingZero:(BOOL)italianLeadingZero
{
    [self willChangeValueForKey:@"italianLeadingZero"];
    [self willChangeValueForKey:@"hasItalianLeadingZero"];
    _italianLeadingZero = italianLeadingZero;
    _stateFlags.hasItalianLeadingZero = YES;
    [self didChangeValueForKey:@"italianLeadingZero"];
    [self didChangeValueForKey:@"hasItalianLeadingZero"];
}


- (void)clearItalianLeadingZero
{
    [self willChangeValueForKey:@"italianLeadingZero"];
    [self willChangeValueForKey:@"hasItalianLeadingZero"];
    _italianLeadingZero = NO;
    _stateFlags.hasItalianLeadingZero = NO;
    [self didChangeValueForKey:@"italianLeadingZero"];
    [self didChangeValueForKey:@"hasItalianLeadingZero"];
}


- (BOOL)hasItalianLeadingZero
{
    return _stateFlags.hasItalianLeadingZero;
}


- (void)setCountryCodeSource:(LPNPhoneNumberCountryCodeSource)countryCodeSource
{
    [self willChangeValueForKey:@"countryCodeSource"];
    [self willChangeValueForKey:@"hasCountryCodeSource"];
    _countryCodeSource = countryCodeSource;
    _stateFlags.hasCountryCodeSource = YES;
    [self didChangeValueForKey:@"countryCodeSource"];
    [self didChangeValueForKey:@"hasCountryCodeSource"];
}


- (void)clearCountryCodeSource
{
    [self willChangeValueForKey:@"countryCodeSource"];
    [self willChangeValueForKey:@"hasCountryCodeSource"];
    _countryCodeSource = LPNPhoneNumberCountryCodeFromNumberWithPlusSignSource;
    _stateFlags.hasCountryCodeSource = NO;
    [self didChangeValueForKey:@"countryCodeSource"];
    [self didChangeValueForKey:@"hasCountryCodeSource"];
}


- (BOOL)hasCountryCodeSource
{
    return _stateFlags.hasCountryCodeSource;
}


- (void)clear
{
    [self clearCountryCode];
    [self clearNationalNumber];
    self.extension = nil;
    [self clearItalianLeadingZero];
    self.rawInput = nil;
    [self clearCountryCodeSource];
    self.preferredDomesticCarrierCode = nil;
}


- (void)mergeFromPhoneNumber:(LPNPhoneNumber *)otherPhoneNumber
{
    if (otherPhoneNumber.hasCountryCode) {
        self.countryCode = otherPhoneNumber.countryCode;
    }
    
    if (otherPhoneNumber.hasNationalNumber) {
        self.nationalNumber = otherPhoneNumber.nationalNumber;
    }
    
    if (otherPhoneNumber.hasItalianLeadingZero) {
        self.italianLeadingZero = otherPhoneNumber.italianLeadingZero;
    }
        
    NSString *rawInput = otherPhoneNumber.rawInput;
    if (rawInput) {
        self.rawInput = rawInput;
    }
    
    if (otherPhoneNumber.hasCountryCodeSource) {
        self.countryCodeSource = otherPhoneNumber.countryCodeSource;
    }
    
    NSString *pdcc = otherPhoneNumber.preferredDomesticCarrierCode;
    if (pdcc) {
        self.preferredDomesticCarrierCode = pdcc;
    }
}


- (BOOL)isEqual:(id)object
{
    if (!object)
        return NO;
    
    if (object == self)
        return YES;
    
    if (![object isKindOfClass:[self class]])
        return NO;
    
    LPNPhoneNumber *other = (LPNPhoneNumber *)object;
    return (
            (self.countryCodeSource == other.countryCodeSource) &&
            (self.nationalNumber == other.nationalNumber) &&
            (self.italianLeadingZero == other.italianLeadingZero) &&
            (self.countryCodeSource == other.countryCodeSource) &&
            ((self.extension == other.extension) || [self.extension isEqualToString:other.extension]) &&
            ((self.rawInput == other.rawInput) || [self.rawInput isEqualToString:other.rawInput]) &&
            ((self.preferredDomesticCarrierCode == other.preferredDomesticCarrierCode) || [self.preferredDomesticCarrierCode isEqualToString:other.preferredDomesticCarrierCode])
            );
}


- (NSUInteger)hash
{
    NSUInteger result = 41;
    
    result = (53 * result) + self.countryCode;
    result = (53 * result) + [[NSNumber numberWithLongLong:self.nationalNumber] hash];
    result = (53 * result) + [self.extension hash];
    result = (53 * result) + (self.italianLeadingZero ? 1231 : 1237);
    result = (53 * result) + [self.rawInput hash];
    result = (53 * result) + [[NSNumber numberWithUnsignedInteger:self.countryCodeSource] hash];
    result = (53 * result) + [self.preferredDomesticCarrierCode hash];
    result = (53 * result) + (self.preferredDomesticCarrierCode != nil ? 1231 : 1237);
    
    return result;
}


@end
