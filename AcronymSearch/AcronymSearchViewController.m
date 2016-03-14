/*!
 @class AcronymSearchViewController

 @brief This is the main view controller for acronym search app.

 This is the main view controller for acronym search app.

 @author Shruti Gupta
 @version    1.0
 */

#import "AcronymSearchViewController.h"
#import "ApplicationData.h"
#import "Constants.h"
#import "WebServiceCall.h"
#import "AcronymApiResultParser.h"
#import "CustomAlertViewController.h"
#import "MBProgressHUD.h"

@interface AcronymSearchViewController ()
{
    NSMutableArray *searchResult;
    BOOL isSearching;
}

@property (strong, atomic) ApplicationData *applicationData;
@property (weak, nonatomic) IBOutlet UITableView *tblViewAcronymSearchResult;
@property (weak, nonatomic) IBOutlet UISearchBar *searchAcronym;

@end
static NSString *reuseIdentifierForAcronymSearchResult = @"acronymSearchResultList";

@implementation AcronymSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _applicationData = [ApplicationData sharedManager];
    searchResult = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 @brief This method is called when the user taps Search from search Bar.

 @discussion This method is called when the user taps Search from search Bar. it makes a webservice call to get the response and displays the lfs values from response in table View.
 */
-(void)searchAcronymMeaning
{
    //call
    WebServiceCall *serviceCall =[WebServiceCall new];
    NSString *searchString = _searchAcronym.text ;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [serviceCall getAcronymMeaning:searchString fromApi:^(NSArray *responseValues, NSError *error) {
            if(error)   {
                [self showError:error];
            }
            if((responseValues)&&(responseValues.count>0))  {
                //parse the response
                AcronymApiResultParser *parseResponse = [AcronymApiResultParser new];
                searchResult = [parseResponse parseResponseValues:responseValues];
            }
            else    {
                [searchResult removeAllObjects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showEmptyResponseMessage];
                });
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tblViewAcronymSearchResult reloadData];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });

        }];

    });

}
/*!
 @brief This method shows message empty response, this is not an error, but the acronym passed had no lfs objects in its response or the response was empty.
 @discussion This method shows message empty response, this is not an error, but the acronym passed had no lfs objects in its response or the response was empty.
 */
-(void) showEmptyResponseMessage
{
    CustomAlertViewController *alertController = [CustomAlertViewController alertControllerWithTitle:@"Empty Response" message:[NSString stringWithFormat:@"No response values for acronym %@",_searchAcronym.text] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:^{
            [searchResult removeAllObjects];
        }];
    });
}

/*!
 @brief This method calls Custom Alert View Controller, A transparent alert box showing the error condition.

 @discussion This method calls Custom Alert View Controller, A transparent alert box showing the error condition.
 @param error: error to display in alert box

 */
-(void)showError:(NSError *)error
{
    //show alert
    CustomAlertViewController *alertController = [CustomAlertViewController alertControllerWithTitle:@"ERROR" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:^{

        }];
    });
}

#pragma mark UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierForAcronymSearchResult];
    if (cell == nil)    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifierForAcronymSearchResult];
    }
    if (isSearching) {
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
    }

    return cell;
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    isSearching = YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    //search acronym
    [self searchAcronymMeaning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
