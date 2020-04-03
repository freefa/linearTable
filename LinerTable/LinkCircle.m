//
//  LinkCircle.m
//  LinerTable
//
//  Created by Louis.B on 2020/4/1.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import "LinkCircle.h"

Status initLinkCircle(LinkList *list) {
    ElemType e;
    while (1) {
        printf("请输入链表元素, 输入0结束：");
        scanf("%d", &e);
        
        if (e == 0) {
            break;
        }
        
        LinkList tmp = (LinkList)malloc(sizeof(Node));
        if (!tmp) {
            printf("创建节点失败\n");
            return ERROR;
        }
        
        tmp->data = e;
        if (*list == NULL) {
            tmp->next = tmp;
            *list = tmp;
        } else {
            LinkList prev = *list;
            while (prev->next != *list) {
                prev = prev->next;
            }
            tmp->next = prev->next;
            prev->next = tmp;
        }
    }
    return OK;
}

Status insertLinkCircle(LinkList *list, int index, ElemType e) {
    if (*list == NULL || index < 1) {
        printf("插入失败：链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("插入失败：index < 1\n");
        return ERROR;
    }
    
    LinkList prev = *list;
    LinkList tmp;
    if (index == 1) {
        // 找到尾结点(首元节点的前驱)
        while (prev->next != *list) {
            prev = prev->next;
        }
        
        tmp = malloc(sizeof(Node));
        if (tmp == NULL) {
            printf("创建节点 %d 失败\n", e);
            return ERROR;
        }
        
        tmp->data = e;
        tmp->next = *list;
        prev->next = tmp;
        *list = tmp;
        return OK;
    }
    
    int place = 1;
    while (place < index - 1 && prev->next != *list) {
        place++;
        prev = prev->next;
    }
    
    if (place + 1 != index) {
        printf("创建节点 %d 失败：index = %d，越界\n", e, index);
        return ERROR;
    }
    
    tmp = (LinkList)malloc(sizeof(Node));
    tmp->data = e;
    tmp->next = prev->next;
    prev->next = tmp;
    return OK;
}

Status deleteLinkCircle(LinkList *list, int index) {
    if (*list == NULL) {
        printf("删除链表元素失败：链表尚未初始化\n");
        return ERROR;
    }
    
    if (index < 1) {
        printf("删除链表元素失败：index < 1\n");
        return ERROR;
    }
    
    LinkList prev = *list;
    LinkList tmp;
    if (index == 1) {
        if (prev->next == *list) {
            // 删除第一个节点,链表中只有一个节点
            free(prev);
            *list = NULL;
            return OK;
        }
        
        while (prev->next != *list) {
            prev = prev->next;
        }
        tmp = *list;
        prev->next = tmp->next;
        *list = tmp->next;
        free(tmp);
        return OK;
    }
    
    int place = 1;
    while (place < index - 1 && prev->next != *list) {
        place++;
        prev = prev->next;
    }
    
    if (place + 1 != index || prev->next == *list) {
        printf("删除节点 %d 失败：越界\n", index);
        return ERROR;
    }
    
    tmp = prev->next;
    prev->next = tmp->next;
    free(tmp);
    return OK;
}

Status getLinkCircleElem(LinkList list, ElemType e, int *index) {
    if (list == NULL) {
        printf("查询链表元素 %d 失败：链表尚未初始化\n", e);
        return ERROR;
    }
    
    LinkList tmp = list;
    int idx = 1;
    do {
        if (tmp->data == e) {
            *index = idx;
            printf("查询链表元素 %d 成功，索引为 %d\n", e, idx);
            return OK;
        }
        idx++;
        tmp = tmp->next;
    } while (tmp != list);
    printf("查询链表元素 %d 失败：不存在该元素\n", e);
    return ERROR;
}

void destroyLinkCircle(LinkList *list) {
    if (*list == NULL) {
        return;
    }
    
    LinkList head = *list;
    LinkList tmp = head;
    
    do {
        tmp = head->next;
        printf("释放节点 %d\n", head->data);
        free(head);
        head = tmp;
    } while (head != *list);
    
    *list = NULL;
}

void printLinkCircle(LinkList list) {
    if (!list) {
        return;
    }
    LinkList tmp = list;
    do {
        printf("%4d", tmp->data);
        tmp = tmp->next;
    } while (tmp != list);
    printf("\n");
}
