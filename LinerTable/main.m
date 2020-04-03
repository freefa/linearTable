//
//  main.m
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqList.h"
#import "LinkList.h"
#import "LinkCircle.h"
#import "TwoWayLink.h"
#import "TwoWayCircleLink.h"

#pragma mark - 顺序表
void testSqList() {
    SqList list;
    printf("初始化顺序表\n");
    if (ERROR == initSqList(&list)) {
        exit(-1);
    }
    
    printf("插入元素 1--10\n");
    for (int i = 1; i <= 10; i++) {
        listInsert(&list, i, i);
    }
    listPrint(&list);
    
    printf("删除第 5 个元素：\n");
    ElemType e;
    listDelete(&list, 5, &e);
    listPrint(&list);
    
    printf("删除第 0 个元素：\n");
    listDelete(&list, 0, &e);
    listPrint(&list);
    
    printf("删除第 1 个元素：\n");
    listDelete(&list, 1, &e);
    listPrint(&list);
    
    printf("删除第 10 个元素：\n");
    listDelete(&list, 10, &e);
    listPrint(&list);
    
    printf("在第 10 个位置 插入元素 5:\n");
    listInsert(&list, 10, 5);
    listPrint(&list);
    
    printf("在第 0 个位置 插入元素 5:\n");
    listInsert(&list, 0, 5);
    listPrint(&list);
    
    printf("在第 1 个位置 插入元素 5:\n");
    listInsert(&list, 1, 5);
    listPrint(&list);
    
    e = -32767;
    printf("获取第 10 个节点的值:\n");
    getElem(&list, 10, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 0 个节点的值:\n");
    getElem(&list, 0, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 7 个节点的值:\n");
    getElem(&list, 7, &e);
    printf("e = %d\n", e);
    
    printf("清空顺序表\n");
    listClear(&list);
    listPrint(&list);
    
    printf("释放顺序表\n");
    listDestroy(&list);
}

#pragma mark - 单向链表
void testLinkList() {
    LinkList list;
    if (ERROR == listInit(&list)) {
        printf("初始化单向链表失败!\n");
        exit(-1);
    }
    linkListPrint(list);
    
    printf("在链表中插入 10 个节点\n");
    for (int i = 1; i <= 10; i++) {
        insertElem(&list, i, i);
    }
    linkListPrint(list);
    
    printf("删除第 5 个节点\n");
    ElemType e;
    deleteElem(&list, 5, &e);
    linkListPrint(list);
    
    printf("删除第 0 个节点\n");
    deleteElem(&list, 0, &e);
    linkListPrint(list);
    
    printf("删除第 10 个节点\n");
    deleteElem(&list, 10, &e);
    linkListPrint(list);
    
    printf("删除第 1 个节点\n");
    deleteElem(&list, 1, &e);
    linkListPrint(list);
    
    printf("删除第 8 个节点\n");
    deleteElem(&list, 8, &e);
    linkListPrint(list);
    
    e = -32767;
    printf("获取第 10 个节点的值:\n");
    getLinkElem(list, 10, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 0 个节点的值:\n");
    getLinkElem(list, 0, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 7 个节点的值:\n");
    getLinkElem(list, 7, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 1 个节点的值:\n");
    getLinkElem(list, 1, &e);
    printf("e = %d\n", e);
    
    e = -32767;
    printf("获取第 5 个节点的值:\n");
    getLinkElem(list, 5, &e);
    printf("e = %d\n", e);
    
    printf("头插法 插入元素 100\n");
    insertHeadElem(&list, 100);
    linkListPrint(list);
    
    printf("尾插法 插入元素 101\n");
    insertTailElem(&list, 101);
    linkListPrint(list);
    
    destroyLinkList(&list);
}

#pragma mark - 单向循环链表
void testLinkCircle() {
    
    LinkList list;
    initLinkCircle(&list);
    printLinkCircle(list);
    
    int index;
    ElemType e;
    printf("请输入插入节点的 位置 和 元素值：");
    scanf("%d   %d", &index, &e);
    insertLinkCircle(&list, index, e);
    printLinkCircle(list);

    printf("请输入插入节点的 位置 和 元素值：");
    scanf("%d   %d", &index, &e);
    insertLinkCircle(&list, index, e);
    printLinkCircle(list);

    printf("请输入插入节点的 位置 和 元素值：");
    scanf("%d   %d", &index, &e);
    insertLinkCircle(&list, index, e);
    printLinkCircle(list);

    printf("请输入插入节点的 位置 和 元素值：");
    scanf("%d   %d", &index, &e);
    insertLinkCircle(&list, index, e);
    printLinkCircle(list);
    
    printf("请输入删除节点的位置：");
    scanf("%d", &index);
    deleteLinkCircle(&list, index);
    printLinkCircle(list);

    printf("请输入删除节点的位置：");
    scanf("%d", &index);
    deleteLinkCircle(&list, index);
    printLinkCircle(list);

    printf("请输入删除节点的位置：");
    scanf("%d", &index);
    deleteLinkCircle(&list, index);
    printLinkCircle(list);

    printf("请输入删除节点的位置：");
    scanf("%d", &index);
    deleteLinkCircle(&list, index);
    printLinkCircle(list);
    
    printf("请输入要查询的元素：");
    scanf("%d", &e);
    getLinkCircleElem(list, e, &index);
    
    printf("请输入要查询的元素：");
    scanf("%d", &e);
    getLinkCircleElem(list, e, &index);
    
    printf("请输入要查询的元素：");
    scanf("%d", &e);
    getLinkCircleElem(list, e, &index);
    
    printf("请输入要查询的元素：");
    scanf("%d", &e);
    getLinkCircleElem(list, e, &index);
    
    destroyLinkCircle(&list);
}

#pragma mark - 双向链表
void testTwoWayLink() {
    TwoWayLink list;
    initTwoWayLink(&list);
    printTwoWayLink(list);
    
    int index;
    ElemType data;
    printf("请输入要插入元素的位置和值：");
    scanf("%d %d", &index, &data);
    insertTwoWayNode(&list, index, data);
    printTwoWayLink(list);
    
    printf("请输入要插入元素的位置和值：");
    scanf("%d %d", &index, &data);
    insertTwoWayNode(&list, index, data);
    printTwoWayLink(list);
    
    printf("请输入要插入元素的位置和值：");
    scanf("%d %d", &index, &data);
    insertTwoWayNode(&list, index, data);
    printTwoWayLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayNode(&list, index, &data);
    printTwoWayLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayNode(&list, index, &data);
    printTwoWayLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayNode(&list, index, &data);
    printTwoWayLink(list);
    
    printf("请输入要查找的元素：");
    scanf("%d", &data);
    getTwoWayElem(list, data, &index);
    printTwoWayLink(list);
    
    printf("请输入要查找的元素：");
    scanf("%d", &data);
    getTwoWayElem(list, data, &index);
    printTwoWayLink(list);
    
    printf("请输入要查找的元素：");
    scanf("%d", &data);
    getTwoWayElem(list, data, &index);
    printTwoWayLink(list);
    
    printf("请输入要查找的元素：");
    scanf("%d", &data);
    getTwoWayElem(list, data, &index);
    printTwoWayLink(list);
    
    destroyTwoWayLink(&list);
}

#pragma mark - 双向循环链表
void testTwoWayCircleLink() {
    TwoWayLink list;
    initTwoWayCircleLink(&list);
    printTwoWayCircleLink(list);
    
    for (int i = 1; i <= 10; i++) {
        insertTwoWayCircleElem(&list, i, i);
    }
    printTwoWayCircleLink(list);
    
    int index;
    ElemType data;
    printf("请输入要插入元素的 位置 和 值：");
    scanf("%d %d", &index, &data);
    insertTwoWayCircleElem(&list, index, data);
    printTwoWayCircleLink(list);
    
    printf("请输入要插入元素的 位置 和 值：");
    scanf("%d %d", &index, &data);
    insertTwoWayCircleElem(&list, index, data);
    printTwoWayCircleLink(list);
    
    printf("请输入要插入元素的 位置 和 值：");
    scanf("%d %d", &index, &data);
    insertTwoWayCircleElem(&list, index, data);
    printTwoWayCircleLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayCircleIndex(&list, index, &data);
    printTwoWayCircleLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayCircleIndex(&list, index, &data);
    printTwoWayCircleLink(list);
    
    printf("请输入要删除元素的位置：");
    scanf("%d", &index);
    deleteTwoWayCircleIndex(&list, index, &data);
    printTwoWayCircleLink(list);
    
    printf("请输入要查询的元素：");
    scanf("%d", &data);
    getTwoWayCircleElem(list, data, &index);
    
    printf("请输入要查询的元素：");
    scanf("%d", &data);
    getTwoWayCircleElem(list, data, &index);
    
    printf("请输入要查询的元素：");
    scanf("%d", &data);
    getTwoWayCircleElem(list, data, &index);
    
    destroyTwoWayCircleLink(&list);
}

int main(int argc, const char * argv[]) {
    
//    testSqList();
//    testLinkList();
//    testLinkCircle();
//    testTwoWayLink();
    testTwoWayCircleLink();
    return 0;
}
