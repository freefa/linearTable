//
//  TwoWayCircleLink.h
//  LinerTable
//
//  Created by Louis.B on 2020/4/3.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>

// 双向循环链表

Status initTwoWayCircleLink(TwoWayLink *list);

Status insertTwoWayCircleElem(TwoWayLink *list, int index, ElemType data);

Status deleteTwoWayCircleIndex(TwoWayLink *list, int index, ElemType *data);

Status getTwoWayCircleElem(TwoWayLink list, ElemType data, int *index);

Status destroyTwoWayCircleLink(TwoWayLink *list);

void printTwoWayCircleLink(TwoWayLink list);
