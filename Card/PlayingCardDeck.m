//
//  PlayingCardDeck.m
//  Card
//
//  Created by Rongrong Wang on 2/1/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

// create and return an instance of the class.
// [[PlayingCardDeck alloc] init] always do two []s.
// the return type must be instancetype because parent class different class name issue.
- (instancetype) init
{
    self = [super init];        // init without arguments.
    // if the initilizer cannot init inself, it will return a nil.
    // so ensure its not null.
    if(self)
    {
        for(NSString *suit in [PlayingCard validSuits]) {
            for(NSInteger i = 0; i < [PlayingCard maxRank]; i++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = i;
                card.suit = suit;
                [self addCard: card];
            }
        }
    }
    return self;
}

@end
