//
//  Card.m
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"

@interface Card()
@end

@implementation Card
// ---- below is all there in obj - c ----
// non atomic property synthesize them.
@synthesize contents = _contents;       // underbar is the instance of the property
@synthesize chosen = _chosen;
@synthesize matched = _matched;
// getter name same as the property
// dash means its a meth
- (NSString *) contents         // * means return a pointer of string
{
    return _contents;
}

- (void) setContents:(NSString *)contents
{
    _contents = contents;
}
// --- End below ---

- (int) match:(NSArray *)cards
{
    int score = 0;
    // dot notation is only for getter.
    // [] is sending messages. basically calling functions.
    // is equal to string send to a string,
    // [<msg reciver> <message name> : < argument passed along the message>]
    for(Card *card in cards) {  // have * cuz have pointer
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }

    return score;
}

@end


