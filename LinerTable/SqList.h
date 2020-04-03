//
//  SqList.h
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import <Foundation/Foundation.h>

// 顺序表

typedef struct {
    ElemType *data;
    int length;
} SqList;

// 初始化顺序存储结构的线性表
Status initSqList(SqList *list);

// 获取 index 的元素, 结果保存在 e 中
Status getElem(SqList *list, int index, ElemType *e);

// 在 index 处插入元素 e
Status listInsert(SqList *list, int index, ElemType e);

// 删除 index 处的元素, 被删除的元素保存在 e 中
Status listDelete(SqList *list, int index, ElemType *e);

// 清空list
Status listClear(SqList *list);

// 销毁list
Status listDestroy(SqList *list);

// 打印 list 所有元素
void listPrint(SqList *list);
