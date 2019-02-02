//
//  PlayingCard.h
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#ifndef PlayingCard_h
#define PlayingCard_h
#import "card.h"
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;     // 64 bit int.

// put the method in a header, its public.
+(NSArray *) validSuits;
+(NSInteger) maxRank;

@end

#endif /* PlayingCard_h */
