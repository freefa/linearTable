//
//  TwoWayLink.h
//  LinerTable
//
//  Created by Louis.B on 2020/4/3.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>

// 双向链表

Status initTwoWayLink(TwoWayLink *list);

Status insertTwoWayNode(TwoWayLink *list, int index, ElemType data);

Status deleteTwoWayNode(TwoWayLink *list, int index, ElemType *data);

Status getTwoWayElem(TwoWayLink list, ElemType data, int *index);

Status destroyTwoWayLink(TwoWayLink *list);

void printTwoWayLink(TwoWayLink list);
