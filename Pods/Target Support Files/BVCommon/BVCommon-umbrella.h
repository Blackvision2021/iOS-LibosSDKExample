#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BVCommon.h"
#import "getgateway.h"
#import "route.h"

FOUNDATION_EXPORT double BVCommonVersionNumber;
FOUNDATION_EXPORT const unsigned char BVCommonVersionString[];

