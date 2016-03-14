/*!
 @header WebServiceCall.h

 @brief This makes webservice calls to get the acronym meanings from api http://www.nactem.ac.uk/software/acromine/dictionary.py

 @discussion This makes webservice calls to get the acronym meanings from api http://www.nactem.ac.uk/software/acromine/dictionary.py


 @author Shruti Gupta
 @version    1.0
 */

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CustomAlertViewController.h"

@interface WebServiceCall : NSObject

/*!
 @brief This method makes a webservice Api call to get the acronym lfs values, with a completion handler.

 @discussion This method makes a webservice Api call to get the acronym lfs values, with a completion handler.
 @param acronym: the acronym is passed into the webservice, as a sf paramater call.
 @param completionBlock: completion block continues with the responseObject by parsing the dataset and reloading the tableView with the lfs values.

 @return ApplicationData instance
 */
-(void)getAcronymMeaning:(NSString *)acronym fromApi:(void(^) (NSArray *responseValues, NSError *error))completionBlock ;

@end
