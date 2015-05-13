//
//  ASSecondControllerTest.m
//  Lab3
//
//  Created by Артем Соловьенко on 04.05.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ASGameplayController.h"

@interface ASSecondControllerTest : XCTestCase
{
    ASGameplayController *sc;
}

@end

@implementation ASSecondControllerTest

- (void)setUp {
    [super setUp];
    sc = [ASGameplayController new];
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

- (void)testGameLogic {
    [sc startInitionalize];
    
    BOOL skipFlag = NO;
    NSString *city = @"Москва";
    //Назовём город Москва в первый раз
    [sc gameLogic:city :skipFlag];
    
    //Во второй раз метод gameLogic должен вернуть NO
    XCTAssertEqual(NO, [sc gameLogic:city :skipFlag]);
}

- (void)testGameLogic2 {
    [sc startInitionalize];
    
    BOOL skipFlag = NO;
    NSString *city = @"Пекин";
    XCTAssertEqual(NO, [sc gameLogic:city :skipFlag]);
}

- (void)testGameLogic3 {
    [sc startInitionalize];
    
    BOOL skipFlag = NO;
    NSString *city = @"";
    XCTAssertEqual(NO, [sc gameLogic:city :skipFlag]);
}

- (void)testGameLogic4 {
    [sc startInitionalize];
    
    BOOL skipFlag = NO;
    NSString *city = @"Грозный";
    
    [sc gameLogic:@"Санкт-Петербург" :skipFlag];
    
    XCTAssertEqual(YES, [sc gameLogic:city :skipFlag]);
}

- (void)testGameLogic5 {
    [sc startInitionalize];
    
    BOOL skipFlag = NO;
    NSString *city = @"Калининград";
    
    BOOL flag1 = [sc gameLogic:@"Москва" :skipFlag];
    BOOL flag2 = [sc gameLogic:@"Астрахань" :skipFlag];
    BOOL flag3 = [sc gameLogic:@"Норильск" :skipFlag];
    BOOL flag4 = [sc gameLogic:city :skipFlag];
    
    BOOL result = flag1 && flag2 && flag3 && flag4;
    
    XCTAssertEqual(YES, result);
}

- (void)testNextTurn {
    [sc startInitionalize];
    ASTurnPlayer currentPlayer = ASTurnPlayer2;
    [sc nextTurn:[sc currentTurn]];
    
    XCTAssertEqual(currentPlayer, [sc currentTurn]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
