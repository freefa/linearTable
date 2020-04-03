//
//  Constant.h
//  LinerTable
//
//  Created by Louis.B on 2020/3/31.
//  Copyright © 2020 Louis.B. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

typedef int Status;

typedef int ElemType;

#define MAXSIZE 100

typedef struct Node {
    ElemType data;
    struct Node *next;
} Node;

typedef Node *LinkList;

typedef struct TwoWayNode {
    ElemType data;
    struct TwoWayNode *prev;
    struct TwoWayNode *next;
} TwoWayNode;

typedef TwoWayNode *TwoWayLink;

#endif /* Constant_h */
