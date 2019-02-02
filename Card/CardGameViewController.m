//
//  CardGameViewController.m
//  Card
//
//  Created by Rongrong Wang on 2/1/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//
#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic) int flipCount;
// it is weak as it is hold strongly by the UI.
@property (weak, nonatomic) IBOutlet NSTextField *flipLabel;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation CardGameViewController
-(CardMatchingGame *) game
{
    // lazy init.
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount: 0 usingDeck:self.deck];
    return _game;
}

- (Deck *) deck
{   // lazy init.
    if(_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction) touchCardButton:(NSButton *)sender
{
    NSImage *cardImg = [NSImage imageNamed:@"IMG_8712.jpg"];
    [sender setImage:cardImg];
    _flipCount++;
}

// every time increase the flip count, it calls both the setter and the getter
// to update the UI, uodate within the setter (ot getter) method.
- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    [_flipLabel setStringValue:[NSString stringWithFormat: @"Flipcount : @d", _flipCount]];
    NSLog(@"FlipCount", _flipCount);
}


@end
