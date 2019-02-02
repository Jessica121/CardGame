//
//  Deck.m
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Deck()
// this property is a pointer. need to init it specifically. else nil.
@property (strong, nonatomic) NSMutableArray *cards; // internal DS
@end

@implementation Deck

- (NSMutableArray *) cards
{
    // make sure cards is never nil.
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards indexOfObject:card];
    }
}

- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    // check null array.
    if([self.cards count]) {
        // unsigned: local NSNumber 
        unsigned index = arc4random() % [self.cards count];     // access self property use self. notation.
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return nil;
}

@end
