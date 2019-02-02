//
//  CardMatchingGame.m
//  Card
//
//  Created by Rongrong Wang on 2/2/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

// playing card game is model. not controller
#import "CardMatchingGame.h"

// private interface init with parethethese.
// inside there are privvate properties and methods
@interface CardMatchingGame()
// override the property to be read write.
@property (nonatomic, readwrite) NSInteger score;
// NSMutableArray only of type object
@property (nonatomic, strong) NSMutableArray *cards; // of cards
@end

@implementation CardMatchingGame : NSObject

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (NSMutableArray *) cards
{
    if(_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSInteger *)count usingDeck:(Deck *)deck
{
    self = [super init];        // NSObject super class designated init is init.
    if (self) {     // always check slef nil first. may not init properly.
        for(int i = 0; i < (int) count; i++) {
            Card *card = [deck drawRandomCard];
            if(card) {
                self.cards[i] = card;
            } else {
                self = nil; // ?????
                break;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSInteger *)index
{
    if((int)index < 0 || (int)index >= [self.cards count]) return nil;
    return self.cards[(int)index];
}

- (void) chooseCardAtIndex:(NSInteger *)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.matched) {
        if(card.chosen) card.chosen = NO;
        else {
            for(Card *otherCard in self.cards) {
                if(!otherCard.matched && otherCard.chosen) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        card.chosen = NO;
                    }
                    break;
                }
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }
        }
    }
}

@end
