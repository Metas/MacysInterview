//
//  TestApplicationData.m
//  AcronymSearch
//
//  Created by Shruti Gupta on 3/14/16.
//  Copyright © 2016 Shruti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ApplicationData.h"

@interface TestApplicationData : XCTestCase

@end

@implementation TestApplicationData

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

#pragma mark - helper methods

- (ApplicationData *)createUniqueInstance {

    return [[ApplicationData alloc] init];

}

- (ApplicationData *)getSharedInstance {

    return [ApplicationData sharedManager];

}

#pragma mark - tests

- (void)testSingletonSharedInstanceCreated {

    XCTAssertNotNil([self getSharedInstance]);

}

- (void)testSingletonUniqueInstanceCreated {

    XCTAssertNotNil([self createUniqueInstance]);

}

- (void)testSingletonReturnsSameSharedInstanceTwice {

    ApplicationData *s1 = [self getSharedInstance];
    XCTAssertEqual(s1, [self getSharedInstance]);

}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {

    ApplicationData *s1 = [self getSharedInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {

    ApplicationData *s1 = [self createUniqueInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

@end

