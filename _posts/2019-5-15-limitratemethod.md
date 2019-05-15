---
layout: post
title:  "限流方法"
date:   2019-5-15 09:22:36 +0800
categories: algorithm

---

# 限流方法

标签（空格分隔）： algorithm

---
## 计数法
- 在一段时间T内，维持一个计数C，当C大于一个量的时候限制速度

```go
type CountLimit struct {
	timeStamp int64 // 窗口起始时间
	count     int32 // 窗口内请求量
	limitRate int32 // 限速大小
	deltaTime int64 // 窗口大小
}

func (c *CountLimit) limitrate() bool {
	now := time.Now().Unix()
	if now < c.timeStamp+c.deltaTime { // 在时间窗口内
		c.count += 1
		return c.count < c.limitRate // 是否超过限流大小
	} else { // 不在窗口内，直接返回限流
		c.timeStamp = now
		c.count = 0
		return true
	}
}

```
## 滑动窗口计数法
- 无

## 漏桶算法
- 漏桶算法是一个桶以固定的速率流出水
- 每一滴水流出的速度是一定的，所以每一滴水流出的时间是固定的，两滴水之间的时间间隔不能超过这个流出时间
- 实现中应该使用比秒更小的时间单位来计算通过的时间

```go

type LeakyBucket struct {
    limitRate   int32 // 限速大小
    nextTime    int64 // 下一滴水可以流出的最早时间，如果在这个时间点内，那么不能流出，限流
    interval    int64 // 时间间隔 = 1000 / limitRate
}

func (l *LeakyBucket)limitRate() bool {
    now := time.Now().Unix()
    timeGap := now - l.nextTime 
    
    if now > l.nextTime {
        l.nextTime = now + 1000/limitRate // 更新下次通过的时间，可以是当前通过的时间到
        return false // 可以通过
    }else {
        // 限速
        return false;
    }
}

func main(){
    l := LeakyBucket{}
    l.limitRate = 100
    l.interval = 1000 / l.limitRate
    l.nextTime = time.Now().Unix() + l.interval
    
    // if l.limitRate() {} // do something
}

```

## 令牌桶算法

- 有一个固定容量的令牌桶，每次请求的时候，依据上次请求的时间，把这段时间内应该放入桶内的令牌加入桶中，当然不能超过固定容量
- 然后，从桶中取令牌
- 如果还有令牌，那么取出一个，不限速放行
- 如果没有令牌，那么限速
- 在实现的过程中，需要按照比秒更小的单位来计算放入桶内的令牌数，比如毫秒，这样能够计算到1s之内放入的数据
- 或者计算放入一个令牌需要的时间1/limitrate，每次时间到达这个时间时，需要放入一个令牌

```go
type TokenBucket struct {
	timeStamp   int64 // 桶起作用时间
	count       int32 // 桶内请求量
	limitRate   int32 // 限速大小
	totalTokens int32 // 令牌桶大小
}

func (t *TokenBucket) limitrate() bool {
	now := time.Now().Unix()
	passData := int32(now-t.timeStamp) * t.limitRate
	t.count = min(t.totalTokens, t.count+passData) // 桶的容量是固定的，放入的令牌要不大于桶的容量
	t.timeStamp = now // 更新时间
	if t.count < 1 {  // 从令牌桶内去令牌，没有令牌了，限速
		return true
	} else { // 还有令牌
		t.count -= 1 // 取令牌
		return false
	}
}

```

## 备注
- 使用的时候需要加锁
- 大多数选用令牌桶算法实现简单，理解起来简单，能够处理大量异常请求的情况





