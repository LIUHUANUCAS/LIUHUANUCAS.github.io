---
layout: post
title:  "Go Time的使用方法"
date:   2017-12-24 20:37:36 +0800
categories: Go
---

# time包使用

```go
a :=  1
fmt.Printf("%02d",a)
```

- %cNd,表示对齐N位，不够的用字符c补齐


- 时间戳转time.Time 类型

```go
    timestamp := 1513580645
    t := time.Unix(timestamp,0)
```

- 获取特定格式数据:2017-12-22 19:15:56
```go
    time.Now().String()[:19]
```

```go

```



