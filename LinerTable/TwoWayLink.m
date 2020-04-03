//
//  TwoWayLink.m
//  LinerTable
//
//  Created by Louis.B on 2020/4/3.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import "TwoWayLink.h"

Status initTwoWayLink(TwoWayLink *list) {
    if ((*list) != NULL) {
        printf("initTwoWayLink error: *list is Already initialized\n");
        return ERROR;
    }
    
    *list = (TwoWayLink)malloc(sizeof(TwoWayNode));
    if ((*list) == NULL) {
        printf("initTwoWayLink error: malloc error\n");
        return ERROR;
    }
    
    (*list)->prev = NULL;
    (*list)->next = NULL;
    (*list)->data = -32767;
    
    TwoWayLink p = *list;
    for (int i = 1; i <=10; i++) {
        TwoWayLink tmp = (TwoWayLink)malloc(sizeof(TwoWayNode));
        if (tmp == NULL) {
            printf("initTwoWayLink, insert error at index: %d\n", i);
            continue;
        }
        tmp->data = i;
        tmp->next = NULL;
        tmp->prev = p;
        p->next = tmp;
        p = tmp;
    }
    return OK;
}

Status insertTwoWayNode(TwoWayLink *list, int index, ElemType data) {
    if ((*list) == NULL) {
        printf("insertTwoWayNode error: 链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("插入节点失败: index < 1\n");
        return ERROR;
    }
    
    TwoWayLink p = *list;
    for (int i = 1; i < index && p; i++) {
        p = p->next;
    }
    
    if (p == NULL) {
        printf("插入节点失败：index = %d，越界\n", index);
        return ERROR;
    }
    
    TwoWayLink tmp = (TwoWayLink)malloc(sizeof(TwoWayNode));
    tmp->data = data;
    tmp->prev = p;
    tmp->next = p->next;
    p->next = tmp;
    if (tmp->next) {
        tmp->next->prev = tmp;
    }
    return OK;
}

Status deleteTwoWayNode(TwoWayLink *list, int index, ElemType *data) {
    if ((*list) == NULL) {
        printf("删除节点失败：链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("删除节点失败：index < 1\n");
        return ERROR;
    }
    
    TwoWayLink p = *list;
    for (int i = 1; i <= index; i++) {
        p = p->next;
    }
    
    if (p == NULL) {
        printf("删除节点失败：越界 index = %d\n", index);
        return ERROR;
    }
    
    *data = p->data;
    p->prev->next = p->next;
    if (p->next) {
        p->next->prev = p->prev;
    }
    printf("删除节点：%d\n", p->data);
    free(p);
    return OK;
}

Status getTwoWayElem(TwoWayLink list, ElemType data, int *index) {
    if (!list) {
        printf("查找元素失败：链表尚未初始化\n");
        return ERROR;
    }
    
    TwoWayLink p = list->next;
    for (int i = 1; p != NULL; i++, p = p->next) {
        if (p->data == data) {
            *index = i;
            printf("查找到元素 %d, 索引为 %d\n", data, i);
            return OK;
        }
    }
    printf("查找元素失败：不存在该元素 %d\n", data);
    return ERROR;
}

Status destroyTwoWayLink(TwoWayLink *list) {
    if (*list == NULL) {
        printf("destroyTwoWayLink error: NULL list");
        return ERROR;
    }
    
    TwoWayLink del = *list;
    TwoWayLink next;
    do {
        next = del->next;
        printf("释放节点：%d\n", del->data);
        free(del);
        del = next;
    } while (next);
    *list = NULL;
    return OK;
}

void printTwoWayLink(TwoWayLink list) {
    if (list == NULL) {
        printf("\n");
        return;
    }
    
    TwoWayLink p = list;
    while ((p = p->next)) {
        printf("%d   ", p->data);
    }
    printf("\n");
}
