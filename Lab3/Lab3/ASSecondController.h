//
//  ASSecondController.h
//  Lab3
//
//  Created by Артем Соловьенко on 30.04.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ASEndGameController.h"
#import "ASPlayer.h"

typedef enum {
    ASTurnPlayer1,
    ASTurnPlayer2
}ASTurnPlayer;

@interface ASSecondController : NSViewController

@property (retain) ASPlayer *player1;
@property (retain) ASPlayer *player2;

@property (assign, nonatomic) NSInteger player1SkipCounter;
@property (assign, nonatomic) NSInteger player2SkipCounter;


//Player1
@property (weak) IBOutlet NSTextField *player1NameLabel;
@property (weak) IBOutlet NSTextField *player1ScoreLabel;
@property (weak) IBOutlet NSTextField *player1SkipsLabel;
//Player2
@property (weak) IBOutlet NSTextField *player2NameLabel;
@property (weak) IBOutlet NSTextField *player2ScoreLabel;
@property (weak) IBOutlet NSTextField *player2SkipsLabel;

//Game
@property (assign, nonatomic) ASTurnPlayer currentTurn; //Игрок, обладающий текущим ходом
@property (retain) NSMutableArray *listOfCitiesArray;
@property (retain) NSMutableArray *usedCitiesArray;
@property (assign) BOOL skipFlag;


@property (weak) IBOutlet NSTextField *gameTurnLabel;
@property (weak) IBOutlet NSTextField *gamePreviousCityLabel;
@property (weak) IBOutlet NSTextField *gameTipLetterLabel;
@property (weak) IBOutlet NSTextField *gameInputCityTextField;
@property (weak) IBOutlet NSTextField *gameInfoTextField;

#pragma mark - Actions
- (IBAction)enterButton:(id)sender;
- (IBAction)skipButton:(id)sender;
- (IBAction)endButton:(id)sender;

#pragma mark - Methods
- (void)startInitionalize;
- (void)update;
- (void)nextTurn; //Следующий ход
- (BOOL)gameLogic;
- (void)addBonus;

#pragma mark - Segues

@end

