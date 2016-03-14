/*!
 @header ApplicationData.h

 @brief Singleton Pattern: This is the header file to provide singleton functions to  AcronymSearch App.

 @discussion This is the header file to provide singleton functions to  AcronymSearch App.

 @author Shruti Gupta
 @version    1.0
 */

#import <Foundation/Foundation.h>

@interface ApplicationData : NSObject

@property (atomic, strong) NSString *acronymSearchURL;

/*!
 @brief This is a class method to set Singleton object ApplicationData.

 @discussion This method to set Singleton object ApplicationData.

 @return ApplicationData instance
 */
+(ApplicationData *)sharedManager;

@end
