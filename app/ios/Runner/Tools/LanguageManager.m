//
//  LanguageManager.m
//  ios_language_manager
//
//  Created by Maxim Bilan on 12/23/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "LanguageManager.h"
#import "NSBundle+Language.h"

static NSString * const LanguageCodes[] = { @"en", @"zh-Hans", @"vi", @"th" };
static NSString * const LanguageStrings[] = { @"English", @"Chinese", @"Vietnamese", @"Thai" };
static NSString * const LanguageSaveKey = @"currentLanguageKey";

@implementation LanguageManager

+ (instancetype)instance{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self.class new];
    });
    
    return _instance;
}

+ (void)setupCurrentLanguage
{
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    if (!currentLanguage) {
        NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        if (languages.count > 0) {
            currentLanguage = languages[0];
            [[NSUserDefaults standardUserDefaults] setObject:currentLanguage forKey:LanguageSaveKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }	

    [[NSUserDefaults standardUserDefaults] setObject:@[currentLanguage] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [NSBundle setLanguage:currentLanguage];
}

+ (NSArray *)languageStrings
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        [array addObject:NSLocalizedString(LanguageStrings[i], @"")];
    }
    return [array copy];
}

+ (NSString *)currentLanguageString
{
    NSString *string = @"";
    NSString *currentCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        if ([currentCode isEqualToString:LanguageCodes[i]]) {
            string = NSLocalizedString(LanguageStrings[i], @"");
            break;
        }
    }
    return string;
}

+ (NSString *)currentLanguageCode
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
}

+ (NSInteger)currentLanguageIndex
{
    NSInteger index = 0;
    NSString *currentCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        if ([currentCode isEqualToString:LanguageCodes[i]]) {
            index = i;
            break;
        }
    }
    return index;
}

+ (void)saveLanguageByIndex:(NSInteger)index
{
    if (index >= 0 && index < ELanguageCount) {
        NSString *code = LanguageCodes[index];
        [[NSUserDefaults standardUserDefaults] setObject:code forKey:LanguageSaveKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [NSBundle setLanguage:code];

    }
}

+ (BOOL)isCurrentLanguageRTL
{
	NSInteger currentLanguageIndex = [self currentLanguageIndex];
	return ([NSLocale characterDirectionForLanguage:LanguageCodes[currentLanguageIndex]] == NSLocaleLanguageDirectionRightToLeft);
}

+ (void)saveLanguageByName:(NSString *)name {
    NSInteger index = 0;
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        if ([name isEqualToString:LanguageCodes[i]]) {
            index = i;
            break;
        }
    }
    [LanguageManager saveLanguageByIndex:index];
    
}

- (NSString *)curSymbol {
    if (_curSymbol == nil) {
        _curSymbol = @"￥";
    }
    return _curSymbol;
}

- (BOOL)isVND {
    return [LanguageManager.instance.curSymbol isEqualToString:@"₫"];
}

@end
