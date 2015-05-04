//
//  ViewController.h
//  Lab3
//
//  Created by Артем Соловьенко on 26.03.15.
//  Copyright (c) 2015 Артем Соловьенко. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ASSecondController.h"
#import "ASPlayer.h"

@interface ViewController : NSViewController {

}

@property __weak IBOutlet NSTextField *player1NameLabel;
@property __weak IBOutlet NSTextField *player1InputNameTextField;
@property (weak) IBOutlet NSTextField *player2NameLabel;
@property (weak) IBOutlet NSTextField *player2InputNameTextField;

@property (retain, nonatomic) NSArray* players;

#pragma mark - Methods
- (void)prepareForSegue:(NSStoryboardSegue *)segue
                 sender:(id)sender;
- (BOOL)isAllowToSegue:(NSString*) firstname and: (NSString*) secondName;

#pragma mark - ActionsMark
-(IBAction)submitButton:(id)sender;

@end

