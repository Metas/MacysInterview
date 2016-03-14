/*!
 @class CustomAlertViewController

 @brief This is an alertViewController subclass, to be called from any class.

 This is an alertViewController subclass, to be called from any class.

 @author Shruti Gupta
 @version    1.0
 */
#import "CustomAlertViewController.h"

@interface CustomAlertViewController ()
@property (nonatomic, strong) UIWindow *alertWindow;
@end

@implementation CustomAlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[self alertWindow] setHidden:YES];
    [self setAlertWindow:nil];
}

/*!
 @brief This method is used Show the alert view.

 @discussion This method is used to get the data in the shared file location.
 */
- (void)show
{
    [self showAnimated:YES];
}

/*!
 @brief This method is used Show the alert view.

 @discussion This method is used to get the data in the shared file location.

 @param animated Set to "YES" to animate the alert display.
 */
- (void)showAnimated:(BOOL)animated
{
    UIViewController *blankViewController = [[UIViewController alloc] init];
    [[blankViewController view] setBackgroundColor:[UIColor clearColor]];
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setRootViewController:blankViewController];
    [window setBackgroundColor:[UIColor clearColor]];
    [window setWindowLevel:UIWindowLevelAlert + 1];
    [window makeKeyAndVisible];
    [self setAlertWindow:window];
    [blankViewController presentViewController:self animated:animated completion:nil];
}

/*!
 @brief Displays an alert with an OK button.

 @discussion Dispays an alert with OK button.
 @param title The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
 @param message Descriptive text that provides additional details about the reason for the alert.
 */
+ (void)presentOkayAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message
{
    CustomAlertViewController *alertController = [CustomAlertViewController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"OK", @"WPSKit", @"Alert button title") style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okayAction];
    [alertController show];
}

/*!
 @brief Displays the description of the provided error in an alert.

 @discussion Displays the description of the provided error in an alert.
 @param error The error to display.
 */
+ (void)presentOkayAlertWithError:(nullable NSError *)error
{
    NSString *title = NSLocalizedStringFromTable(@"Error",  @"WPSKit", @"Alert title.");
    NSString *message = [error localizedDescription];
    [[self class] presentOkayAlertWithTitle:title message:message];
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
