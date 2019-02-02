//
//  CardMatchingGame.h
//  Card
//
//  Created by Rongrong Wang on 2/2/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//
#import <AppKit/AppKit.h>
#import "Deck.h"

#ifndef CardMatchingGame_h
#define CardMatchingGame_h

@interface CardMatchingGame : NSObject
@property (nonatomic, readonly) NSInteger score;

// designated initilizer, the subclass have to call super this to init.
// and its in the header file to its public. subclass know it.
- (instancetype) initWithCardCount: (NSInteger *) count
                        usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex: (NSInteger *) index;

- (Card *) cardAtIndex: (NSInteger *) index;

@end;
#endif /* CardMatchingGame_h */
