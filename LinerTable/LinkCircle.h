//
//  LinkCircle.h
//  LinerTable
//
//  Created by Louis.B on 2020/4/1.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>

// 单向循环链表

Status initLinkCircle(LinkList *list);

Status insertLinkCircle(LinkList *list, int index, ElemType e);

Status deleteLinkCircle(LinkList *list, int index);

Status getLinkCircleElem(LinkList list, ElemType e, int *index);

void destroyLinkCircle(LinkList *list);

void printLinkCircle(LinkList list);
