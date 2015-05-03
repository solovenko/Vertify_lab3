//
//  ASViewControllerTest.m
//  Lab3
//
//  Created by Артем Соловьенко on 03.05.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ASViewControllerTest : XCTestCase

@end

@implementation ASViewControllerTest

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
    XCTAssert(YES, @"Pass");
}

- (void)testExample2
{
    XCTFail(@"Unit tests are not implemented yet in SampleProjectTests");
}

- (void)testCheckNames{
    NSString *name1 = @" ";
    NSString *name2 = @"";
//    BOOL result =
//    XCTAssert(NO, )
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
