//
//  ASEndGameController.m
//  Lab3
//
//  Created by Артем Соловьенко on 03.05.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import "ASEndGameController.h"

@interface ASEndGameController ()

@end

@implementation ASEndGameController

@synthesize winnerNameLabel = _winnerNameLabel;
@synthesize winnerScoreLabel = _winnerScoreLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)viewDidAppear {
    [super viewDidAppear];
    [self startInit];
}

#pragma mark - Methods

- (void)prepareForSegue:(NSStoryboardSegue *)segue
                 sender:(id)sender {
    
    [[[[self view] window] windowController] close];
}


- (void)startInit {
    
    NSArray *players = [self representedObject];
    
    ASPlayer *player1 = [players objectAtIndex:0];
    ASPlayer *player2 = [players objectAtIndex:1];
    
    if ([player1 score] > [player2 score]) {
        _winnerNameLabel.stringValue = [NSString stringWithFormat:@"Победитель: \n%@",
                                        [player1 name]];
        _winnerScoreLabel.stringValue = [NSString                                          stringWithFormat:@"Набранно очков: %ld",
                                         (long)[player1 score]];
    } else {
        _winnerNameLabel.stringValue = [NSString stringWithFormat:@"Победитель: \n%@",
                                        [player2 name]];
        _winnerScoreLabel.stringValue = [NSString                                          stringWithFormat:@"Набранно очков: %ld",
                                         (long)[player2 score]];
    }
    
    
    
}

#pragma mark - Actions

- (IBAction)exitGame:(id)sender {
    
    [[NSApplication sharedApplication]terminate:self];
}

@end
