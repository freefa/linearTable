//
//  LinkList.h
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>

// 单向链表

Status listInit(LinkList *list);

Status getLinkElem(LinkList list, int index, ElemType *e);

Status insertElem(LinkList *list, int index, ElemType e);

Status insertHeadElem(LinkList *list, ElemType e);

Status insertTailElem(LinkList *list, ElemType e);

Status deleteElem(LinkList *list, int index, ElemType *e);

Status destroyLinkList(LinkList *list);

void linkListPrint(LinkList list);
