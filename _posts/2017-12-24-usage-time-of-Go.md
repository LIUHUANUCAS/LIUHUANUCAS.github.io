# time包使用


```go
a :=  1
fmt.Printf("%02d",a)
```

- %cNd,表示对齐N位，不够的用字符c补齐

# Go Time 的使用

## 1.format形式

- 获取年月日方法

```Go
    t := time.Now()
    y := t.Year() // 年
    m := int(t.Month()) //月
    d := t.Day()// 日
    h := t.Hour() //小时
    min := t.Minute()//分钟
    s := t.Second()//秒
    fmt.Printf("%d-%d-%d",y,m,d)// 2017-12-26
    fmt.Printf("%d%02d%02d",y,m,d) // 20180101
```

- 获取格式为:2017-12-29 16:58:39

```Go
    t := time.Now()
    fmt.Println(t.String()[:19])
    layout := "2006-01-02 15:04:05"
    fmt.Println(t.Format(layout))
```

- 获取三个小时之前的时间

```Go
    du, _ := time.ParseDuration("-3h")
    t := time.Now().Add(du)
```

- 获取三天之前的时间

```Go
    t := time.Now()
    t.AddDate(0,0,-3) 
    fmt.Println(t)
```
- t.AddDate(year,month,day) 正数向前，负数向后


- 时间戳转time.Time 类型

```go
    timestamp := 1513580645
    t := time.Unix(timestamp,0)
```


- 获取时间戳

```go
    t := time.Now()
    timestamp := t.Unix()
```

- 两个时间的间隔

```go
    t1 := time.Now()
    //do some function
    t2 := time.Now()
    sub := t2.Since(t1)
```

- 字符串转时间

```Go
    layout := "2006-01-02 15:04:05" // 这个格式，不能改，据说是Go诞生的时间，可能有特殊含义吧
    t , err := time.Parse(layout,"2017-12-26 17:20:21")
    fmt.Println(t)
```

- 标准时间字符串转化为时间
- 使用byte读取数据库当中的timestamp字段时，会出现标准的时间格式

```Go
    layout := "2006-01-02T15:04:05Z07:00"
    timeStr := "2018-01-02T11:30:21Z"
    t , _ := time.Parse(layout,timeStr)
    // t , _ := time.Parse(time.RFC3339,timeStr)
    fmt.Println(t)
```
- 上述RFC3339的时间格式是UTC时间，需要转化为本地的CST时间
- 其他的字符串时间转换可以参考Go的说明文档 [time][1]


- 获取一段时间之前的时间

```go
    now := time.Unix()
    ago := 3*24*60*60 // 3days ago
    before := time.Unix(now - age,0) //获取当前时间的之前一个时刻
```



[1]:https://golang.org/pkg/time/#pkg-constants