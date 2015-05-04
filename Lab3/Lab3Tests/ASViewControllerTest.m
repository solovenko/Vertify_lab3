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
{
    ViewController *vc;
}

@end

@implementation ASViewControllerTest

- (void)setUp {
    [super setUp];
    vc = [ViewController new];
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
//    XCTFail(@"Unit tests are not implemented yet in SampleProjectTests");
}

- (void)testIsAllowToSegue1{
    
//    ViewController *vc = [ViewController new];
    NSString *name1 = @" ";
    NSString *name2 = @"";
    BOOL result = [vc isAllowToSegue:name1 and:name2];
    XCTAssertEqual(NO, result);
}

- (void)testIsAllowToSegue2{
    
    NSString *name1 = @"Артем";
    NSString *name2 = @"ы";
    BOOL result = [vc isAllowToSegue:name1 and:name2];
    XCTAssertEqual(NO, result);
}

- (void)testIsAllowToSegue3{
    
    NSString *name1 = @"Артем";
    NSString *name2 = @"длорпавыолдпав";
    BOOL result = [vc isAllowToSegue:name1 and:name2];

    XCTAssertEqual(YES, result);
}

- (void)testIsAllowToSegue4{
    
    NSString *name1 = @"Артем";
    NSString *name2 = @"длорпавыолдпав";
    BOOL tempResult = [vc isAllowToSegue:name1 and:name2];
    BOOL result;
    if (tempResult) {
        result = ([vc players] != nil);
    }
    XCTAssertEqual(YES, result);
}

- (void)testIsAllowToSegue5{
    
    NSString *name1 = @"";
    NSString *name2 = @"длорпавыолдпав";
    BOOL tempResult = [vc isAllowToSegue:name1 and:name2];
    BOOL result;
    if (tempResult) {
        result = ([vc players] != nil);
    }
    XCTAssertEqual(NO, result);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
