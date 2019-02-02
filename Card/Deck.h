//
//  Deck.h
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#ifndef Deck_h
#define Deck_h
#import "card.h"

@interface Deck : NSObject

- (void) addCard: (Card *) card atTop:(BOOL)atTop;
- (void) addCard: (Card *) card; // to make the upper one optional

- (Card *) drawRandomCard;

@end
#endif /* Deck_h */
