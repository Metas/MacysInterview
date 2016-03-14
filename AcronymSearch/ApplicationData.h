/*!
 @header ApplicationData.h

 @brief This is the header file to provide singleton functions to  AcronymSearch App.

 @discussion This is the header file to provide singleton functions to  AcronymSearch App.

 @author Shruti Gupta
 @version    1.0
 */

#import <Foundation/Foundation.h>
//Singleton
@interface ApplicationData : NSObject

@property (atomic, strong) NSString *acronymSearchURL;

/*!
 @brief This is a class method to set Singleton object ApplicationData.

 @discussion This method to set Singleton object ApplicationData.

 @return ApplicationData instance
 */
+(ApplicationData *)sharedManager;

@end
