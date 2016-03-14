/*!
 @class WebServiceCall

 @brief This makes webservice calls to get the acronym meanings from api http://www.nactem.ac.uk/software/acromine/dictionary.py

 This makes webservice calls to get the acronym meanings from api http://www.nactem.ac.uk/software/acromine/dictionary.py

 @author Shruti Gupta
 @version    1.0
 */

#import "WebServiceCall.h"
#import "ApplicationData.h"

static NSString *acronymAPICall = @"http://www.nactem.ac.uk/software/acromine/dictionary.py";

@implementation WebServiceCall

/*!
 @brief This method makes a webservice Api call to get the acronym lfs values, with a completion handler.

 @discussion This method makes a webservice Api call to get the acronym lfs values, with a completion handler.
 @param acronym: the acronym is passed into the webservice, as a sf paramater call.
 @param completionBlock: completion block continues with the responseObject by parsing the dataset and reloading the tableView with the lfs values.

 @return ApplicationData instance
 */
-(void)getAcronymMeaning:(NSString *)acronym fromApi:(void(^) (NSArray *responseValues, NSError *error))completionBlock ;
{
    if((acronym)&&(acronym.length >0)) {
        if(completionBlock) {
            ApplicationData *appData =[ApplicationData sharedManager];
            NSString *requestString = [appData acronymSearchURL];
            if(!requestString)  {
                requestString = acronymAPICall;
            }
            NSURL *baseURL = [NSURL URLWithString:requestString];
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            NSError *error;

            NSDictionary *parameters = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects: [NSString stringWithFormat:@"%@",acronym],@"", nil] forKeys:[NSArray arrayWithObjects:@"sf",@"lf", nil]];
            [manager GET:[baseURL absoluteString] parameters:parameters
                progress:^(NSProgress * _Nonnull downloadProgress) {
                }
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     NSError *jsonError;
                     NSArray* arrData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&jsonError];
                     completionBlock(arrData, error);
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     completionBlock(nil, error);
            }] ;
        }
        else    {
            NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey: NSLocalizedString(@"Empty Completion", nil),
                                       NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Empty Completion", nil),
                                       NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Empty Completion", nil)
                                       };
            NSError *errorNoCompletion = [NSError errorWithDomain:@"Empty Completion"
                                                          code:-3
                                                      userInfo:userInfo];
            if(completionBlock) {
                completionBlock(nil,errorNoCompletion);
            }
            else    {
                [self showError:errorNoCompletion];
            }
        }
    }
    else    {
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Empty Acronym", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Empty Acronym", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Empty Acronym", nil)
                                   };
        NSError *errorNoAcronym = [NSError errorWithDomain:@"Empty Acronym"
                                    code:-5
                                userInfo:userInfo];

        if(completionBlock) {
            completionBlock(nil,errorNoAcronym);
        }
        else    {
            [self showError:errorNoAcronym];
        }

    }
}
/*!
 @brief This method calls Custom Alert View Controller, A transparent alert box showing the error condition.

 @discussion This method calls Custom Alert View Controller, A transparent alert box showing the error condition.
 @param error: error to display in alert box

 */
-(void) showError:(NSError*)error   {
    if(! error)   {
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Empty Error", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Empty Error", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Empty Error", nil)
                                   };
        error = [NSError errorWithDomain:@"Empty Error"
                                                      code:-4
                                                  userInfo:userInfo];
    }
    CustomAlertViewController *alertController = [CustomAlertViewController alertControllerWithTitle:@"ERROR" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [alertController show];
}

@end
