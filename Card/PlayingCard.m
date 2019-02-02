//
//  PlayingCard.m
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

// overriding the contents getter method.
- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

// synthesize it when we provide getter &&&& setter.
@synthesize suit = _suit;

// plus meth is a class method. send it to a class, not an instance.
// cant do instance var. can do self.
// for creating things, or utility classes. return constant n stuff.
+ (NSArray *) validSuits
{
    return @[@"1", @"2", @"3", @"4"];
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"B", @"C", @"D"];
}

// the property with pointers could be nil.
// if its a hazard, override the getter.
- (NSString *) suit
{
//    if(!_suit) return @"?";
//    return _suit;
    return _suit ? _suit : @"?";
}

// this is private as its not declared in the header file.
- (void) setSuit:(NSString *) suit
{
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// public
+ (NSInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
