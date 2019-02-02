//
//  card.h
//  Card
//
//  Created by Rongrong Wang on 1/31/19.
//  Copyright © 2019 Rongrong Wang. All rights reserved.
//

#import <Foundation/Foundation.h>           // import the entire lib

#ifndef card_h
#define card_h

@interface Card : NSObject
// everything in a heap.
// strong: keep it in the heap as long as it has strong ref to it. automatic ref counting. clears up immediately once the cnt == 0
// weak: keep it memo as it have a strong pointer. when it collected, weak pointer set to nil.
// nonatomic: calling the setter and getter not thread safe, cannot have two threads set/get it. diff stuff in diff thread.
// if atomic, getter and setter have the lock code.
@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL chosen; // primitive types are not stored in the heap, no strong or weak.
@property (nonatomic) BOOL matched; // still non atomic

-(int) match: (NSArray *) cards;        // 0 dont match, else higher better match.

@end
#endif /* card_h */
