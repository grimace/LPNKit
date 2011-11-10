//
//  LPNPhoneNumberUtilTests.m
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

#import "LPNPhoneNumberUtilTests.h"
#import "LPNPhoneNumber.h"

static LPNPhoneNumber *alphanumericNumber = nil;
static LPNPhoneNumber *arMobile = nil;
static LPNPhoneNumber *arNumber = nil;
static LPNPhoneNumber *auNumber = nil;
static LPNPhoneNumber *bsMobile = nil;
static LPNPhoneNumber *bsNumber = nil;
static LPNPhoneNumber *deNumber = nil;
static LPNPhoneNumber *deShortNumber = nil;
static LPNPhoneNumber *gbMobile = nil;
static LPNPhoneNumber *gbNumber = nil;
static LPNPhoneNumber *itMobile = nil;
static LPNPhoneNumber *itNumber = nil;

static LPNPhoneNumber *mxMobile1 = nil;
static LPNPhoneNumber *mxMobile2 = nil;
static LPNPhoneNumber *mxNumber1 = nil;
static LPNPhoneNumber *mxNumber2 = nil;
static LPNPhoneNumber *nzNumber = nil;
static LPNPhoneNumber *sgNumber = nil;

static LPNPhoneNumber *usLongNumber = nil;
static LPNPhoneNumber *usNumber = nil;
static LPNPhoneNumber *usPremium = nil;
static LPNPhoneNumber *usLocalNumber = nil;
static LPNPhoneNumber *usShortByOneNumber = nil;
static LPNPhoneNumber *usTollfree = nil;
static LPNPhoneNumber *usSpoof = nil;
static LPNPhoneNumber *usSpoofWithRawInput = nil;

@implementation LPNPhoneNumberUtilTests
{
}


+(void)setUp
{
    alphanumericNumber = [[LPNPhoneNumber alloc] init];
    alphanumericNumber.countryCode = 1;
    alphanumericNumber.nationalNumber = 80074935247;
    
    arMobile = [[LPNPhoneNumber alloc] init];
    arMobile.countryCode = 54;
    arMobile.nationalNumber = 91187654321;
    
    arNumber = [[LPNPhoneNumber alloc] init];
    arNumber.countryCode = 54;
    arNumber.nationalNumber = 1187654321;
    
    auNumber = [[LPNPhoneNumber alloc] init];
    auNumber.countryCode = 61;
    auNumber.nationalNumber = 236618300;
    
    bsMobile = [[LPNPhoneNumber alloc] init];
    bsMobile.countryCode = 1;
    bsMobile.nationalNumber = 2423570000;
    
    bsNumber = [[LPNPhoneNumber alloc] init];
    bsNumber.countryCode = 1;
    bsNumber.nationalNumber = 2423651234;
    
    deNumber = [[LPNPhoneNumber alloc] init];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 30123456;
    
    deShortNumber = [[LPNPhoneNumber alloc] init];
    deShortNumber.countryCode = 49;
    deShortNumber.nationalNumber = 1234;
    
    gbMobile = [[LPNPhoneNumber alloc] init];
    gbMobile.countryCode = 44;
    gbMobile.nationalNumber = 7912345678;

    gbNumber = [[LPNPhoneNumber alloc] init];
    gbNumber.countryCode = 44;
    gbNumber.nationalNumber = 2070313000;
    
    itMobile = [[LPNPhoneNumber alloc] init];
    itMobile.countryCode = 39;
    itMobile.nationalNumber = 345678901;
    
    itNumber = [[LPNPhoneNumber alloc] init];
    itNumber.countryCode = 39;
    itNumber.nationalNumber = 236618300;
    itNumber.italianLeadingZero = YES;
    
    mxMobile1 = [[LPNPhoneNumber alloc] init];
    mxMobile1.countryCode = 52;
    mxMobile1.nationalNumber = 12345678900;
    
    mxMobile2 = [[LPNPhoneNumber alloc] init];
    mxMobile2.countryCode = 52;
    mxMobile2.nationalNumber = 15512345678;
    
    mxNumber1 = [[LPNPhoneNumber alloc] init];
    mxNumber1.countryCode = 52;
    mxNumber1.nationalNumber = 3312345678;
    
    mxNumber2 = [[LPNPhoneNumber alloc] init];
    mxNumber2.countryCode = 52;
    mxNumber2.nationalNumber = 8211234567;
    
    nzNumber = [[LPNPhoneNumber alloc] init];
    nzNumber.countryCode = 64;
    nzNumber.nationalNumber = 33316005;
    
    sgNumber = [[LPNPhoneNumber alloc] init];
    sgNumber.countryCode = 65;
    sgNumber.nationalNumber = 65218000;
    
    usLongNumber = [[LPNPhoneNumber alloc] init];
    usLongNumber.countryCode = 1;
    usLongNumber.nationalNumber = 65025300001;

    usNumber = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 6502530000;
    
    usPremium = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 9002530000;
    
    usLocalNumber = [[LPNPhoneNumber alloc] init];
    usLocalNumber.countryCode = 1;
    usLocalNumber.nationalNumber = 2530000;
    
    usShortByOneNumber = [[LPNPhoneNumber alloc] init];
    usShortByOneNumber.countryCode = 1;
    usShortByOneNumber.nationalNumber = 650253000;
    
    usTollfree = [[LPNPhoneNumber alloc] init];
    usTollfree.countryCode = 1;
    usTollfree.nationalNumber = 8002530000;
    
    usSpoof = [[LPNPhoneNumber alloc] init];
    usSpoof.countryCode = 1;
    usSpoof.nationalNumber = 0;

    usSpoofWithRawInput = [[LPNPhoneNumber alloc] init];
    usSpoofWithRawInput.countryCode = 1;
    usSpoofWithRawInput.nationalNumber = 0;
    usSpoofWithRawInput.rawInput = @"000-000-0000";
}

+(void)tearDown
{
    
}

@end
