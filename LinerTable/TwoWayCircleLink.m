//
//  TwoWayCircleLink.m
//  LinerTable
//
//  Created by Louis.B on 2020/4/3.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import "TwoWayCircleLink.h"
Status initTwoWayCircleLink(TwoWayLink *list) {
    if ((*list) != NULL) {
        printf("创建链表失败：list已经有指向");
        return ERROR;
    }
    
    *list = (TwoWayLink)malloc(sizeof(TwoWayNode));
    if ((*list) == NULL) {
        printf("创建链表失败：malloc 错误");
        return ERROR;
    }
    
    (*list)->prev = *list;
    (*list)->next = *list;
    (*list)->data = -32767;
    return OK;
}

Status insertTwoWayCircleElem(TwoWayLink *list, int index, ElemType data) {
    if ((*list) == NULL) {
        printf("插入元素失败：链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("插入元素失败：index < 1\n");
        return ERROR;
    }
    
    TwoWayLink p = *list;
    int i = 1;
    while (p->next != *list && i < index) {
        p = p->next;
        i++;
    }
    
    if (i < index) {
        printf("插入元素失败：索引 %d 越界\n", index);
        return ERROR;
    }
    
    TwoWayLink tmp = (TwoWayLink)malloc(sizeof(TwoWayNode));
    if (!tmp) {
        printf("插入元素失败：malloc error\n");
        return ERROR;
    }
    
    tmp->data = data;
    
    tmp->prev = p;
    tmp->next = p->next;
    p->next = tmp;
    tmp->next->prev = tmp;
    return OK;
}

Status deleteTwoWayCircleIndex(TwoWayLink *list, int index, ElemType *data) {
    if ((*list) == NULL) {
        printf("删除元素失败：链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("删除元素失败：index < 1\n");
        return ERROR;
    }
    
    TwoWayLink p = *list;
    int i = 1;
    while (p->next != *list && i <= index) {
        p = p->next;
        i++;
    }
    
    if (i - 1 != index) {
        printf("删除元素失败：index = %d 越界\n", index);
        return ERROR;
    }
    
    p->prev->next = p->next;
    p->next->prev = p->prev;
    printf("删除元素 %d, 索引 %d\n", p->data, index);
    free(p);
    return OK;
}

Status getTwoWayCircleElem(TwoWayLink list, ElemType data, int *index) {
    if (!list) {
        printf("获取元素失败, 链表尚未初始化\n");
        return ERROR;
    }
    
    TwoWayLink p = list->next;
    int i = 1;
    while (p != list) {
        if (p->data == data) {
            *index = i;
            printf("查询元素 %d 成功, 索引为 %d\n", data, i);
            return OK;
        }
        p = p->next;
        i++;
    }
    
    printf("查询元素 %d 失败, 元素不存在\n", data);
    return ERROR;
}

Status destroyTwoWayCircleLink(TwoWayLink *list) {
    if (!(*list)) {
        printf("释放链表失败：链表尚未初始化\n");
        return ERROR;
    }
    TwoWayLink del = *list;
    TwoWayLink next;
    do {
        next = del->next;
        printf("释放节点：%d\n", del->data);
        free(del);
        del = next;
    } while (del != *list);
    *list = NULL;
    return OK;
}

void printTwoWayCircleLink(TwoWayLink list) {
    
    if (!list) {
        printf("\n");
        return;
    }
    
    TwoWayLink p = list->next;
    while (p != list) {
        printf("%d   ", p->data);
        p = p->next;
    }
    printf("\n");
}
