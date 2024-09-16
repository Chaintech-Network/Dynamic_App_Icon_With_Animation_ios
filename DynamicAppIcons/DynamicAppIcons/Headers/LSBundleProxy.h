//
//  LSBundleProxy.h
//  DynamicAppIcons
//
//  Created by Puneet Bhagat02 on 01/08/24.
//

#import <Foundation/Foundation.h>

/**
 *  A proxy for interacting with the bundle.
 */
@interface LSBundleProxy : NSObject

/**
 *  Returns the bundle proxy for the current process.
 *
 *  @return The bundle proxy.
 */
+ (nonnull LSApplicationProxy *)bundleProxyForCurrentProcess;

@end
