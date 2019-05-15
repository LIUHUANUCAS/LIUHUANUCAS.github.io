package main

import "time"

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

type LeakyBucket struct {
	limitRate int32 // 限速大小
	nextTime  int64 // 下一滴水可以流出的最早时间，如果在这个时间点内，那么不能流出，限流
	interval  int64 // 时间间隔 = 1000 / limitRate
}

func (l *LeakyBucket) limitRate() bool {
	now := time.Now().Unix()
	timeGap := now - l.nextTime

	if now > l.nextTime {
		l.nextTime = now + 1000/limitRate // 更新下次通过的时间，可以是当前通过的时间到
		return false                      // 可以通过
	} else {
		// 限速
		return false
	}
}

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
	t.timeStamp = now                              // 更新时间
	if t.count < 1 {                               // 从令牌桶内去令牌，没有令牌了，限速
		return true
	} else { // 还有令牌
		t.count -= 1 // 取令牌
		return false
	}
}

func main() {
	l := LeakyBucket{}
	l.limitRate = 100
	l.interval = 1000 / l.limitRate
	l.nextTime = time.Now().Unix() + l.interval

	// if l.limitRate() {} // do something
}

func main() {

}
