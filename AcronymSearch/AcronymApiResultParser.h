/*!
 @header AcronymApiResultParser.h

 @brief This parses response object from webservice call api http://www.nactem.ac.uk/software/acromine/dictionary.py and returns the lfs values.

 @discussion This parses response object from webservice call api http://www.nactem.ac.uk/software/acromine/dictionary.py and returns the lfs values, or shows error, if any.
 @author Shruti Gupta
 @version    1.0
 */

#import <Foundation/Foundation.h>

@interface AcronymApiResultParser : NSObject

/*!
 @brief This method parses the api response to get the acronym lfs values and send the values for the tableView to be refreshed.

 @discussion This method parses the api response to get the acronym lfs values and send the values for the tableView to be refreshed.
 @param responseValues: response Object from the api call.

 @return MutableArray of lfs objects.
 */
-(NSMutableArray*) parseResponseValues :(NSArray *)responseValues;

@end
