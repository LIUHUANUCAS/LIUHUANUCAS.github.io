---
layout: post
title:  "优先队列(Priority Queue)"
date:   2018-03-22 09:41:36 +0800
categories: algorithm

---

# 优先队列(Priority Queue)


## 1.优先队列概述

- 队列是具有先进先出(FIFO)特性的一种数据结构
- 优先队列是在队列的基础上，依据某种方式重新安排队列的元素排列顺序
- 可以认为队列中的元素具有某种排序方式，这种排列的依据就是元素的优先级，所以称为优先队列
- 由于优先队列内部需要实现对于元素的排序，所以，优先队列的实现，要比常规队列要复杂，涉及到出、入队列时，调整队头元素，以及在队列内部保持一定的顺序
- 下面首先介绍队列的使用，原理后面再介绍
- 实现原理是使用数组实现的一颗平衡二叉树

## 2.优先队列使用(Java语言)

- java语言的队列是```PritorityQueue```
- 对于**基本类型**的数据```int/Integer,String```等，```PritorityQueue```默认是**升序排序**
- 对于**非基本类型**数据，需要实现接口```Comparable {public int compareTo(Object o)}```接口，优先队列内部会调用**compareTo**接口来进行比较优先级
- 或者在队列初始化时，可以指定特定的比较器，```Comparator {public int compare(Object o1, Object o2)}```  如果指定，那么会**优先使用**这个比较器来进行大小比较

- 先看下基本类型数据，优先队列的使用方式



```java
public static void IntQueue() {
	PriorityQueue<Integer> pqueue = new  PriorityQueue<Integer>();
	pqueue.add(0);
	pqueue.add(-1);
	pqueue.add(3);
	pqueue.add(-3);
	pqueue.add(5);
	while(!pqueue.isEmpty()) {
		int e = pqueue.poll();//出队列
		System.out.println(e);
	}
	// -3 -1 0 3 5 
}

```

- 自定义类型数据优先队列的使用，实现```Comparable```接口

```java
/**自定义类型，实现Comparable接口，并按照w从小到大排序*/
class Node implements Comparable<Node>{
	int id;
	int w;
	Node(int id,int w){
		this.id = id;
		this.w = w;
	}

	@Override
	public String toString() {
		return "(" + id +"," + w +")";
	}

	@Override
	public int compareTo(Node o) {
		return this.w - o.w ;
	}
}

public static void NodeQueue() {
	PriorityQueue<Node> pqueue = new  PriorityQueue<Node>();
	pqueue.add(new Node(1,1));
	pqueue.add(new Node(2,-1));
	pqueue.add(new Node(5,6));
	pqueue.add(new Node(3,3));
	pqueue.add(new Node(4,-3));
	while(!pqueue.isEmpty()) {
		Node e = pqueue.poll();//出队列
		System.out.println(e);
	}
	//(4,-3) (2,-1) (1,1) (3,3) (5,6)
}

```

- 自定义类型数据优先队列的使用，优先队列初始化时，指定```Comparator```接口

```
public static void NodeQueue2() {
		Comparator<Node2> comparator = new Comparator<Node2>() {
			@Override
			public int compare(Node2 o1, Node2 o2) {
				return -o1.w + o2.w;
			}
		};
		
		PriorityQueue<Node2> pqueue = new  PriorityQueue<Node2>(comparator);
		pqueue.add(new Node2(1,1));
		pqueue.add(new Node2(2,-1));
		pqueue.add(new Node2(5,6));
		pqueue.add(new Node2(3,3));
		pqueue.add(new Node2(4,-3));
		while(!pqueue.isEmpty()) {
			Node2 e = pqueue.poll();
			System.out.println(e);
		}
		// (5,6) (3,3) (1,1) (2,-1) (4,-3)
	}

```

```java
Comparator<Node> comparator = new Comparator<Node>() {
		@Override
		public int compare(Node o1, Node o2) {
			return -o1.w + o2.w;
		}
	};
	PriorityQueue<Node> pqueue = new  PriorityQueue<Node>(comparator);
	pqueue.add(new Node(1,1));
	pqueue.add(new Node(2,-1));
	pqueue.add(new Node(5,6));
	pqueue.add(new Node(3,3));
	pqueue.add(new Node(4,-3));
	while(!pqueue.isEmpty()) {
		Node e = pqueue.poll();
		System.out.println(e);
	}
}
class Node implements Comparable<Node>{
	int id;
	int w;
	Node(int id,int w){
		this.id = id;
		this.w = w;
	}
	
	@Override
	public String toString() {
		return "(" + id +"," + w +")";
	}

	@Override
	public int compareTo(Node o) {
		return this.w - o.w ;
	}
}

```

- 如果一个类实现了```Comparable``` 接口同时指定优先队列的构造参数实现了```Comparator```接口那么会**优先使用**```Comparator```定义的比较函数
