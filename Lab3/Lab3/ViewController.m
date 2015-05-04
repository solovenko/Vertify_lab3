//
//  ViewController.m
//  Lab3
//
//  Created by Артем Соловьенко on 26.03.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize player1NameLabel = _player1NameLabel;
@synthesize player1InputNameTextField = _player1InputNameTextField;

@synthesize players;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (void)prepareForSegue:(NSStoryboardSegue *)segue
                 sender:(id)sender {
    
    ASSecondController* second = segue.destinationController;
    second.representedObject = self.players;
    [[[[self view] window] windowController] close];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    NSString *name1 = _player1InputNameTextField.stringValue;
    NSString *name2 = _player2InputNameTextField.stringValue;
    return [self isAllowToSegue:name1 and:name2];
}

/* Правильно ли введены имена
 
 */
- (BOOL)isAllowToSegue: (NSString*) firstname and: (NSString*) secondName{
    
    BOOL isAllowToSegue = YES;
    
    NSString* inputNamePlayer1 = firstname;
    if ([inputNamePlayer1 isEqualToString:@""]) {
        _player1NameLabel.stringValue = [NSString stringWithFormat: @"Введите имя игрока 1!", nil];
        isAllowToSegue = NO;
    } else {
        NSUInteger length = [inputNamePlayer1 length];
        if (length < 2) {
            _player1NameLabel.stringValue = [NSString stringWithFormat: @"Слишком короткое имя!", nil];
            isAllowToSegue = NO;
        } else {
            _player1NameLabel.stringValue = [NSString stringWithFormat: @"Привет, %@!",inputNamePlayer1];
        }
    }
    
    
    NSString* inputNamePlayer2 = secondName;
    if ([inputNamePlayer2 isEqualToString:@""]) {
        _player2NameLabel.stringValue = [NSString stringWithFormat: @"Введите имя игрока 2!", nil];
        isAllowToSegue = NO;
    } else {
        NSUInteger length = [inputNamePlayer2 length];
        if (length < 2) {
            _player2NameLabel.stringValue = [NSString stringWithFormat: @"Слишком короткое имя!", nil];
            isAllowToSegue = NO;
        } else {
            _player2NameLabel.stringValue = [NSString stringWithFormat: @"Привет, %@!",inputNamePlayer2];
        }        
    }
    

    if (isAllowToSegue == YES){
        
        ASPlayer* player1 = [[ASPlayer alloc]init];
        player1.name = inputNamePlayer1;
        player1.score = 0;
        player1.skips = 0;
        
        ASPlayer* player2 = [[ASPlayer alloc]init];
        player2.name = inputNamePlayer2;
        player2.score = 0;
        player2.skips = 0;
        
        self.players = [[NSArray alloc]initWithObjects:
                        player1,
                        player2,
                        nil];
    }
    
    return isAllowToSegue;
}

- (IBAction)submitButton:(id)sender {

//    [self performSegueWithIdentifier:@"toGameWindowSegue" sender:sender];
    
}

@end
