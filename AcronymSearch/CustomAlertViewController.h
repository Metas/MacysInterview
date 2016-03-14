/*!
 @header CustomAlertViewController.h

 @brief This is an alertViewController subclass, to be called from any class..
 @discussion This is an alertViewController subclass, to be called from any class..
 @author Shruti Gupta
 @version    1.0
 */

#import <UIKit/UIKit.h>

@interface CustomAlertViewController : UIAlertController

/*!
 @brief This method is used Show the alert view.

 @discussion This method is used to get the data in the shared file location.
 */
- (void)show;

/*!
 @brief This method is used Show the alert view.

 @discussion This method is used to get the data in the shared file location.

 @param animated Set to "YES" to animate the alert display.
 */
- (void)showAnimated:(BOOL)animated;

/*!
 @brief Displays an alert with an OK button.

 @discussion Dispays an alert with OK button.
 @param title The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
 @param message Descriptive text that provides additional details about the reason for the alert.
 */
+ (void)presentOkayAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

/*!
 @brief Displays the description of the provided error in an alert.

 @discussion Displays the description of the provided error in an alert.
 @param error The error to display.
 */
+ (void)presentOkayAlertWithError:(nullable NSError *)error;

@end
