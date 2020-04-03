//
//  LinkList.m
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import "LinkList.h"

Status listInit(LinkList *list) {
    struct Node *n = (struct Node *)malloc(sizeof(Node));
    if (!n) {
        return ERROR;
    }
    
    n->next = NULL;
    
    *list = n;
    
    return OK;
}

Status getLinkElem(LinkList list, int index, ElemType *e) {
    if (!list || index < 1) {
        return ERROR;
    }
    
    LinkList p = list->next;
    int i = 1;
    
    while (p && i < index) {
        p = p->next;
        i++;
    }
    
    if (!p || i < index) {
        return ERROR;
    }
    
    *e = p->data;
    
    return OK;
}

Status insertElem(LinkList *list, int index, ElemType e) {
    if (!*list || index < 1) {
        return ERROR;
    }
    
    LinkList p = *list;
    int i = 1;
    while (p->next && i < index) {
        p = p->next;
        i++;
    }
    
    if (i < index) {
        return ERROR;
    }
    
    LinkList n = malloc(sizeof(Node));
    if (!n) {
        return ERROR;
    }
    
    n->data = e;
    n->next = p->next;
    p->next = n;
    
    return OK;
}

Status insertHeadElem(LinkList *list, ElemType e) {
    if (!list) {
        return ERROR;
    }
    
    LinkList p = *list;
    LinkList ele = malloc(sizeof(Node));
    if (!ele) {
        return ERROR;
    }
    ele->data = e;
    ele->next = p->next;
    p->next = ele;
    return OK;
}

Status insertTailElem(LinkList *list, ElemType e) {
    if (!list) {
        return ERROR;
    }
    
    LinkList p = *list;
    while (p->next) {
        p = p->next;
    }
    
    LinkList node = malloc(sizeof(Node));
    if (!node) {
        return ERROR;
    }
    
    node->data = e;
    node->next = NULL;
    p->next = node;
    
    return OK;
}

Status deleteElem(LinkList *list, int index, ElemType *e) {
    if (!list || index < 1) {
        return OK;
    }
    
    LinkList p = *list;
    int i = 1;
    while (p && i < index) {
        p = p->next;
        i++;
    }
    
    if (!p || i < index) {
        return OK;
    }
    
    if (p->next) {
        LinkList delNode = p->next;
        p->next = delNode->next;
        *e = delNode->data;
        free(delNode);
    }
    
    return OK;
}

Status destroyLinkList(LinkList *list) {
    if (list) {
        LinkList p = *list;
        LinkList q;
        while (p) {
            q = p->next;
            free(p);
            printf("链表释放节点成功\n");
            p = q;
        }
        *list = NULL;
    }
    return OK;
}

void linkListPrint(LinkList list) {
    if (!list) {
        return;
    }
    
    LinkList p = list;
    while (p) {
        printf("%d   ", p->data);
        p = p->next;
    }
    printf("\n");
}
