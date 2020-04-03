//
//  SqList.m
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#import "SqList.h"

Status initSqList(SqList *list) {
    list->data = malloc(sizeof(ElemType) * (MAXSIZE + 1));
    if (!list->data) {
        return ERROR;
    }
    list->length = 0;
    return OK;
}

Status getElem(SqList *list, int index, ElemType *e) {
    if (!list) {
        return ERROR;
    }
    
    if (index < 1 || index > list->length) {
        return ERROR;
    }
    
    *e = list->data[index];
    
    return OK;
}

Status listInsert(SqList *list, int index, ElemType e) {
    if (!list) {
        return ERROR;
    }
    
    if (index < 1 || index > list->length + 1 || list->length >= MAXSIZE) {
        return ERROR;
    }
    
    for (int i = list->length; i > index; i--) {
        list->data[i] = list->data[i - 1];
    }
    
    list->data[index] = e;
    
    list->length++;
    
    return OK;
}

Status listDelete(SqList *list, int index, ElemType *e) {
    if (!list) {
        return ERROR;
    }
    
    if (index < 1 || index > list->length) {
        return ERROR;
    }
    
    *e = list->data[index];
    
    for (int i = index; i < list->length; i++) {
        list->data[i] = list->data[i + 1];
    }
    
    list->length--;
    
    return OK;
}

Status listClear(SqList *list) {
    if (list) {
        list->length = 0;
    }
    return OK;
}

Status listDestroy(SqList *list) {
    if (list) {
        free(list->data);
        printf("释放线性表成功\n");
    }
    return OK;
}

void listPrint(SqList *list) {
    if (!list) {
        return;
    }
    
    for (int i = 1; i <= list->length; i++) {
        printf("%d  ", list->data[i]);
    }
    printf("\n");
}
