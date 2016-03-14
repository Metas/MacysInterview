/*!
 @class ApplicationData

 @brief This is the ApplicationData implementation file for AcronymSearch App.

 Managing singleton functions and getting plist values in this file.

 @author Shruti Gupta
 @version    1.0
 */

#import "ApplicationData.h"
#import "Constants.h"

static NSString *plistFile = @"AcronymSearchPlist";
static NSString *plist = @"plist";

@implementation ApplicationData
/*!
 @brief This is a class method to set Singleton object ApplicationData.

 @discussion This method to set Singleton object ApplicationData.

 @return ApplicationData instance
 */
+ (ApplicationData *)sharedManager
{
    static ApplicationData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    if (self = [super init]){
        [self setPlistData];
    }
    return self;
}

/*!
 @brief This method is used to get the plist data and set the corrsponding values in a singleton for easy access within the app.
 
 @discussion This method is used to get the plist data and set the corrsponding values in a singleton for easy access within the app.
.
 */
-(void)setPlistData
{
    NSString *plistPath = [[NSBundle bundleForClass:[self class]] pathForResource:plistFile ofType:plist];
    if(plistPath)   {
        NSDictionary *values = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        if([values objectForKey:acronymSearchApiPlistKey])
            [self setAcronymSearchURL:[values objectForKey:acronymSearchApiPlistKey]];
    }
}
@end
