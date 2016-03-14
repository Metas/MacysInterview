//
//  WebServiceCallTest.m
//  AcronymSearch
//
//  Created by Shruti Gupta on 3/14/16.
//  Copyright © 2016 Shruti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WebServiceCall.h"

@interface WebServiceCallTest : XCTestCase

@end

@implementation WebServiceCallTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
//-(void)getAcronymMeaning:(NSString *)acronym fromApi:(void(^) (NSArray *responseValues, NSError *error))completionBlock ;
-(void)testGetAcronymMeaningWithNilAcronym  {
    WebServiceCall *webService = [WebServiceCall new];
    [webService getAcronymMeaning:nil fromApi:^(NSArray *responseValues, NSError *error) {
        BOOL result = [error.localizedDescription  isEqualToString:@"Empty Acronym" ];
        XCTAssertTrue(result,@"Nil acronym");
    }];

}
-(void)testGetAcronymMeaningWithEmptyAcronym  {
    WebServiceCall *webService = [WebServiceCall new];
    [webService getAcronymMeaning:nil fromApi:^(NSArray *responseValues, NSError *error) {
        BOOL result = [error.localizedDescription  isEqualToString:@"Empty Acronym" ];
        XCTAssertTrue(result,@"Empty acronym");
    }];
}

-(void)testGetAcronymMeaningWithNilCompletionHandler  {
    WebServiceCall *webService = [WebServiceCall new];
    [webService getAcronymMeaning:@"HMM" fromApi:nil];
    //test this in UI, it should show a error popup
}

-(void)testGetAcronymMeaningWithNoInternet  {
    WebServiceCall *webService = [WebServiceCall new];
    [webService getAcronymMeaning:@"HMM" fromApi:^(NSArray *responseValues, NSError *error) {
        XCTAssertNotNil(error,@"Error in connectivity");
    }];
}
-(void)testGetAcronymMeaningWithInternet  {
    WebServiceCall *webService = [WebServiceCall new];
    [webService getAcronymMeaning:@"HMM" fromApi:^(NSArray *responseValues, NSError *error) {
        XCTAssertNil(error,@"everything good");
    }];
}

@end
