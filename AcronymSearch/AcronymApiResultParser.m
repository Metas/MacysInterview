/*!
 @class AcronymApiResultParser

 @brief This parses response object from webservice call api http://www.nactem.ac.uk/software/acromine/dictionary.py and returns the lfs values.

 This parses response object from webservice call api http://www.nactem.ac.uk/software/acromine/dictionary.py and returns the lfs values.

 @author Shruti Gupta
 @version    1.0
 */

#import "AcronymApiResultParser.h"

static NSString *lfsString = @"lfs";
static NSString *lfString = @"lf";

@implementation AcronymApiResultParser

/*!
 @brief This method parses the api response to get the acronym lfs values and send the values for the tableView to be refreshed.

 @discussion This method parses the api response to get the acronym lfs values and send the values for the tableView to be refreshed.
 @param responseValues: response Object from the api call.

 @return MutableArray of lfs objects.
 */
-(NSMutableArray*) parseResponseValues :(NSArray *)responseValues
{
    NSMutableArray * lfsVal =[NSMutableArray new];
    if((responseValues)&&(responseValues.count > 0))    {

        for(NSDictionary *value in responseValues)  {
            if((value)&&([value objectForKey:lfsString]))  {
                NSArray *lfsValues = [value objectForKey:lfsString ];
                for(NSDictionary *lfsElement in lfsValues)   {
                    if((lfsElement)&&([lfsElement objectForKey:lfString]))
                        [lfsVal addObject:[lfsElement objectForKey:lfString]];
                }
            }
        }
    }
    return lfsVal;
}


@end
