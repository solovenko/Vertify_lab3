//
//  ASEndGameController.h
//  Lab3
//
//  Created by Артем Соловьенко on 03.05.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ASPlayer.h"
#import "ASLoginController.h"

@interface ASEndGameController : NSViewController

@property (weak) IBOutlet NSTextField *winnerNameLabel;
@property (weak) IBOutlet NSTextField *winnerScoreLabel;


#pragma mark - Methods
- (void)startInit;

#pragma mark - Actions
- (IBAction)exitGame:(id)sender;

@end
