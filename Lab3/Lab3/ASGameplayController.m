//
//  ASSecondController.m
//  Lab3
//
//  Created by Артем Соловьенко on 30.04.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import "ASGameplayController.h"

@interface ASGameplayController ()

@end

@implementation ASGameplayController

@synthesize player1SkipCounter = _player1SkipCounter;
@synthesize player2SkipCounter = _player2SkipCounter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)viewDidAppear {
    [super viewDidAppear];
    
    [self startInitionalize];
    [self update];
    
}

#pragma mark - Methods

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

/*  
    Начальная инициализация
 */
- (void)startInitionalize {
    
    _gameInfoTextField.stringValue = @"";
    _gamePreviousCityLabel.stringValue = @"";
    _currentTurn = ASTurnPlayer1;
    _usedCitiesArray = [NSMutableArray new];
    
    _gameTipLetterLabel.stringValue = @"Введите имя города России:";
    
    NSArray* players = [self representedObject];
    
    _player1 = [players objectAtIndex:0];
    _player2 = [players objectAtIndex:1];
    
    _player1NameLabel.stringValue = [NSString stringWithFormat: @"Игрок 1: %@", [_player1 name]];
    _player2NameLabel.stringValue = [NSString stringWithFormat: @"Игрок 2: %@", [_player2 name]];
    
    _skipFlag = NO;
    
    //Загрузка городов
    
    NSString* fileName = [NSMutableString stringWithString:@"/tmp/db.txt"];
    NSString *fileString = [NSString stringWithContentsOfFile:fileName
                                                     encoding:NSUTF8StringEncoding
                                                        error: NULL];
    
    _listOfCitiesArray = [NSMutableArray arrayWithArray:[fileString componentsSeparatedByString:@"\n"]];
    
}

- (void)update {
    //Очки
    _player1ScoreLabel.stringValue = [NSString stringWithFormat:
                                      @"Количество очков: %ld",
                                      (long)[_player1 score]];
    _player2ScoreLabel.stringValue = [NSString stringWithFormat:
                                      @"Количество очков: %ld",
                                      (long)[_player2 score]];
    //Пропуски
    _player1SkipsLabel.stringValue = [NSString stringWithFormat:
                                      @"Пропуски: %ld из 3",
                                      (long)_player1.skips];
    _player2SkipsLabel.stringValue = [NSString stringWithFormat:
                                      @"Пропуски: %ld из 3",
                                      (long)_player2.skips];
    //Ход
    switch (_currentTurn) {
        case ASTurnPlayer1:
            _gameTurnLabel.stringValue = [NSString stringWithFormat: @"Ход -  %@!", [_player1 name]];
            break;
        case ASTurnPlayer2:
            _gameTurnLabel.stringValue = [NSString stringWithFormat: @"Ход -  %@!", [_player2 name]];
            break;
    }
    
    if (_skipFlag) {
        
        _gameInfoTextField.stringValue = @"Предыдущий игрок пропустил ход. \nВведите новое название города";
        
        //Отображение предыдущего города
        if ([_usedCitiesArray count] > 0 ){
            _gamePreviousCityLabel.stringValue = [NSString stringWithFormat:@"Предыдущий город: %@",
                                                  [_usedCitiesArray lastObject]];
            _gameTipLetterLabel.stringValue = [NSString stringWithFormat: @"Введите любое имя города России:"];
        }

        
    } else {
        //Очистка системной подсказки
        _gameInfoTextField.stringValue = @"";
        
        //Отображение предыдущего города
        if ([_usedCitiesArray count] > 0 ){
            _gamePreviousCityLabel.stringValue = [NSString stringWithFormat:@"Предыдущий город: %@",
                                                  [_usedCitiesArray lastObject]];
            
            NSString *lastString = [_usedCitiesArray lastObject];
            NSUInteger lengthLastWord = [lastString length];
            NSString *lastLetterInUsedWord = [lastString substringFromIndex:lengthLastWord - 1];
            
            if ([lastLetterInUsedWord caseInsensitiveCompare:@"ь"] == NSOrderedSame ||
                [lastLetterInUsedWord caseInsensitiveCompare:@"ъ"] == NSOrderedSame ||
                [lastLetterInUsedWord caseInsensitiveCompare:@"й"] == NSOrderedSame){
                
                lastLetterInUsedWord = [lastString substringWithRange:NSMakeRange(lengthLastWord - 2, 1)];
            }
            
            _gameTipLetterLabel.stringValue = [NSString stringWithFormat: @"Введите имя города России на букву: %@", lastLetterInUsedWord];
        }

    }
    
}

- (void)nextTurn: (ASTurnPlayer)turn {
    
    switch (turn) {
        case ASTurnPlayer1:
            _currentTurn = ASTurnPlayer2;
            break;
        case ASTurnPlayer2:
            _currentTurn = ASTurnPlayer1;
            break;
    }
}

- (BOOL)gameLogic: (NSString*)enteredCity : (BOOL) skipFlag {
    
    BOOL isSuccessful = NO;
    
//    NSString *enteredNameOfCity = [NSString stringWithFormat: _gameInputCityTextField.stringValue, nil];
    
    BOOL isFinden = NO;
    
    NSString *resultString;
    
    for (NSString *element in _listOfCitiesArray) {
        
        NSUInteger length = [element length];
        
        if ([element caseInsensitiveCompare:enteredCity] == NSOrderedSame && length > 1){
            isFinden = YES;
            resultString = element;
        }
        
    }
    
    if (!isFinden){
        
        _gameInfoTextField.stringValue = [NSString stringWithFormat:@"Такого города не существует! Повторите попытку"];
        
    } else {
        
        BOOL isUsed = NO;
        
        for (NSString *element in _usedCitiesArray) {
            if ([element caseInsensitiveCompare:enteredCity] == NSOrderedSame){
                isUsed = YES;
            }
        }
        
        if (isUsed){
            
            _gameInfoTextField.stringValue = [NSString stringWithFormat:@"Такой город уже был назван! Повторите попытку"];
            
        } else {
            
            if (_skipFlag) {
                
                [_usedCitiesArray addObject: resultString];
                isSuccessful = YES;
                [self addBonus];
                
            } else {
                
                if ([_usedCitiesArray count] > 0) {
                    
                    NSString *inputLastLetter = [resultString substringToIndex:1];
                    
                    NSString *lastString = [_usedCitiesArray lastObject];
                    NSUInteger lengthLastWord = [lastString length];
                    NSString *lastLetterInUsedWord = [lastString substringFromIndex:lengthLastWord - 1];
                    
                    if ([lastLetterInUsedWord caseInsensitiveCompare:@"ь"] == NSOrderedSame ||
                        [lastLetterInUsedWord caseInsensitiveCompare:@"ъ"] == NSOrderedSame ||
                        [lastLetterInUsedWord caseInsensitiveCompare:@"й"] == NSOrderedSame){
                        lastLetterInUsedWord = [lastString substringWithRange:NSMakeRange(lengthLastWord - 2, 1)];
                    }
                    
                    if ([inputLastLetter caseInsensitiveCompare:lastLetterInUsedWord] == NSOrderedSame) {
                        
                        [_usedCitiesArray addObject: resultString];
                        isSuccessful = YES;
                        [self addBonus];
                        
                    } else {
                        
                        _gameInfoTextField.stringValue = [NSString stringWithFormat:@"Ошибка! Введённое название города не начинается с буквы, \nуказанной в конце предыдущего слова!"];
                        
                    }
                    
                } else {
                    
                    [_usedCitiesArray addObject: resultString];
                    isSuccessful = YES;
                    [self addBonus];
                }
                
            }
            
        }
    }
    
    return isSuccessful;

}

- (void)addBonus {
    switch (_currentTurn) {
        case ASTurnPlayer1:
            _player1.score++;
            break;
            
        case ASTurnPlayer2:
            _player2.score++;
            break;
    }
}

- (void)doSegue: (NSString*) identifier {
    
    [self performSegueWithIdentifier:identifier sender:self];
    [[[[self view] window] windowController] close];
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue
                 sender:(id)sender {
    
    ASEndGameController* endGameController = segue.destinationController;
    endGameController.representedObject = [self representedObject];
    [[[[self view] window] windowController] close];
}

#pragma mark - Action Buttons
- (IBAction)enterButton:(id)sender {
    
    NSString *enteredNameOfCity = [NSString stringWithFormat: _gameInputCityTextField.stringValue, nil];
    
    if ([self gameLogic:enteredNameOfCity :_skipFlag]) {
        [self nextTurn:_currentTurn];
        _skipFlag = NO;
        [self update];        
    }
}

- (IBAction)skipButton:(id)sender {
    
    _skipFlag = YES;
    
    switch (_currentTurn) {
        case ASTurnPlayer1:
            _player1.skips++;
            if ([_player1 skips] > 2){
                [self doSegue:@"toEndGameWindowSegue"];
            }
            break;
            
        case ASTurnPlayer2:
            _player2.skips++;
            if ([_player2 skips] > 2){
                [self doSegue:@"toEndGameWindowSegue"];
            }
            break;
    }
    
    [self nextTurn: _currentTurn];
    [self update];

}

- (IBAction)endButton:(id)sender {
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"Нет"];
    [alert addButtonWithTitle:@"Да"];
    [alert setMessageText:@"Вы действительно хотите закончить игру?"];
    [alert setInformativeText:@"Подведение итогов игры произойдёт по текущим результатам!"];
    [alert setAlertStyle:NSWarningAlertStyle];
    
    //Переопределение нажатия клавиш на кнопки
    //Для кнопки "Нет"
    NSButton *button  = [[alert buttons]objectAtIndex:0];
    [button setKeyEquivalent:@""];
    //Для кнопки "Да"
    button  = [[alert buttons]objectAtIndex:1];
    [button setKeyEquivalent:@"\r"];
    
    if ([alert runModal] == NSAlertSecondButtonReturn) {
        [self doSegue:@"toEndGameWindowSegue"];
    }
}
    
@end

