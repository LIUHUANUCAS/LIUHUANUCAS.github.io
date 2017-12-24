---
layout: post
title:  "Go Routine Channel 使用"
date:   2017-12-24 21:57:36 +0800
categories: Go
---


# Go 生产者消费者模型 

标签（空格分隔）： Go

---

## 1.生产者消费者模型的实现

```go
func main() {
     in := make(chan int)
     out := make(chan int)
     go Producer(in)
     go Consumer(in, out)

     for x := range out { //读取管道，直到关闭，如果没有值，那么阻塞
          fmt.Println(x)
     }
}

func Consumer(in <-chan int, out chan<- int) {
     for x := range in { //读取管道，直到关闭管道为止，没有值，那么阻塞
          out <- x * x //写入管道
     }
     close(out) //关闭写入管道
}

func Producer(out chan<- int) {
     for i := 1; i < 10; i++ {
          out <- i //写入管道
     }
     close(out) //关闭写管道
}

```

## 2.channel的性质

### 1.使用make创建channel，且创建的变量为和，map,slice等一致均为引用类型

``` go
    ch := make(chan Type,Len)//
    ch := make(chan int)//创建一个int类型的管道
```
- 其中Type表示管道当中存放数据的类型，Len表示管道的长度，当Len不为0时，也称为可缓冲的管道
- Len可以省略，当省略Len长度时，默认只能一次性的读取和写入，也就是只有当管道为空的时候才能写入一个元素，当管道有元素的时候，才能读取管道
- 当管道为空的时候，读取routine会阻塞，当管道有数据的时候，写入routine会阻塞



### 2.Channel使用方式

#### 2.1 向管道写入内容

```go
    x := 1
    ch <- x //写入内容
```
- 只有在管道内没有数据的时候才能写入成功，否则routine会阻塞

#### 2.2 从管道读取内容

```go
    x := <- ch  //读取内容
```
- 只有在管道内有数据的时候才能读取成功，否则routine会阻塞

#### 2.3 使用for range 从管道读取内容
```go
    for x := range ch {
        //do something with x
    }
```
- 当使用for range 从管道读取数据的时候，管道没有数据，那么循环会阻塞，只有当管道被关闭的时候，for 循环才会结束

#### 2.4 关闭管道
```go
    close(ch)
```
- 当一方在从管道中读取数据时，写入管道的routine关闭了管道，那么读取方会收到一个读取管道失败的结果，可以根据这个结果来结束对管道的读取。对于for range 循环，会结束循环。

### 2.Bufer Channel使用方式
- 对于上述无缓冲的Channel，每次只能读取和写入一个元素的方式，Go 提供一种具有缓冲区的Channel方式，具体的是在创建管道 时，指定管道的大小，存储元素的个数。
- 我们使用可缓冲的管道来重写上述生产者消费者模型，并对比运行的效率

```go
const (
	N = 1000000
	Buflen = 100
)

func main(){
	main_channel()
	main_channel_buffer()
}

func main_channel_buffer() {
	start := time.Now()

	defer func(){
		cost := time.Since(start)
		fmt.Println("channel_buffer_cost=",cost)
	}()

	in := make(chan int,Buflen)
	out := make(chan int,Buflen)
	go Producer(in)
	go Consumer(in, out)

	for x := range out {
		x += 1
	}

}

func main_channel() {
	start := time.Now()
	defer func(){
		cost := time.Since(start)
		fmt.Println("channel_cost=",cost)
	}()
	in := make(chan int)
	out := make(chan int)
	go Producer(in)
	go Consumer(in, out)

	for x := range out {
		x += 1
	}
}

func Consumer(in <-chan int, out chan<- int) {
	for x := range in {
		out <- x * x
	}
	close(out)
}

func Producer(out chan<- int) {
	for i := 1; i < N; i++ {
		out <- i
	}
	close(out)
}
```
- 对上述两种具有缓冲和无缓冲的管道的实验结果分析，运行的结果表明，使用缓冲区能够极大提高整个程序的运行效率，无缓冲的运行时间大约是有缓冲的4倍


