//
//  LSApplicationProxy.h
//  DynamicAppIcons
//
//  Created by Puneet Bhagat02 on 01/08/24.
//

#import <Foundation/Foundation.h>

/**
 *  A proxy for interacting with the application.
 */
@interface LSApplicationProxy : NSObject

/**
 *  Sets the alternate icon name for the application.
 *
 *  @param name   The name of the alternate icon.
 *  @param result A block that will be executed with the result of the operation.
 */
- (void)setAlternateIconName:(nullable NSString *)name
                   withResult:(void (^_Nonnull)(BOOL success, NSError *_Nullable))result;

@end
