/*!
 @header AcronymSearchViewController.h

 @brief This is the main view controller for acronym search app.
 @discussion This is the main view controller for acronym search app.User types in an acronym, and sees its results in a tableView or an error if any.
 @author Shruti Gupta
 @version    1.0
 */

#import <UIKit/UIKit.h>

@interface AcronymSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end
