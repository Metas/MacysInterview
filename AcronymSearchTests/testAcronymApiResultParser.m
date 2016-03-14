//
//  testAcronymApiResultParser.m
//  AcronymSearch
//
//  Created by Shruti Gupta on 3/14/16.
//  Copyright © 2016 Shruti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AcronymApiResultParser.h"

@interface testAcronymApiResultParser : XCTestCase

@end

@implementation testAcronymApiResultParser

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
//-(NSMutableArray*) parseResponseValues :(NSArray *)responseValues;
-(void)testEmptyResponseInParseResponseValues   {
    AcronymApiResultParser *parser =[AcronymApiResultParser new];
    NSMutableArray *result = [parser parseResponseValues:nil];
    XCTAssertTrue(result.count ==0 ,"nil responseValues, return empty result");
}
-(void)testNilResponseInParseResponseValues   {
    AcronymApiResultParser *parser =[AcronymApiResultParser new];
    NSMutableArray *result = [parser parseResponseValues:nil];
    XCTAssertTrue(result.count ==0 ,"empty responseValues, return empty result");
}
-(void)testNoLfsResponseInParseResponseValues   {
    NSArray *sampleResponse = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:@"HMM" forKey:@"sfs"], nil];
    AcronymApiResultParser *parser =[AcronymApiResultParser new];
    NSMutableArray *result = [parser parseResponseValues:sampleResponse];
    XCTAssertTrue(result.count ==0 ,"empty responseValues, return empty result");
}
-(void)testLfsResponseInParseResponseValues   {
    NSArray *sampleResponse = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:[NSDictionary dictionaryWithObject:@"test" forKey:@"lf"], nil] forKey:@"lfs"], nil];
    AcronymApiResultParser *parser =[AcronymApiResultParser new];
    NSMutableArray *result = [parser parseResponseValues:sampleResponse];
    XCTAssertTrue(result.count == 1 ,"lfs in responseValues, return lfs value result");
}

@end
