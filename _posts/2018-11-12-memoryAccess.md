---
layout: post
title:  "第一个程序"
date:   2018-11-12 23:31:36 +0800
categories: assembly

---

## 程序源代码

```assembly
assume cs:codesg

codesg segment
	mov ax,0123H
	mov bx,0456H
	add ax,bx
	add ax,ax
	mov ax,4c00H
	int 21H
codesg ends
end

```

## 程序构成

- assume cs:XXX 表示程序段地址和寄存器cs相关联
- end 表示源程序的结束
- XXX segment 表示一个段
- XXX ends 表示段的结束

## 程序返回

- ```mov ax,4c00H```
- 

## 编译

```
masm 1.asm
```
- 生成目标文件1.obj
- 中间生成 ```.lst```  列表文件，```.crf ``` 交叉引用文件
- 可以忽略上述两个文件

## 连接

```
link 1.obj
```
- 生成可执行文件1.exe
- 中间生成 ```.map```  映射文件，```.lib ``` 库文件
- 可以忽略上述两个文件
- 

## 汇编从写入到执行过程

- 编写代码 1.asm
- masm 编译代码 生成1.obj
- link 连接1.obj 生成 1.exe
- 加载
- 运行
- 

## 程序在windows内存中的布局

```
    -----
         |
SA: psp  |  DS=SA
    exe  | SA+10H:0H,程序的入口cs:ip指向地方
    ---  | 


```
- psp:地址为 DS ，查看psp内容可以使用 ```-d ds:0```
- psp的头两个字节是 CD 20 
- -d ds:80 地方能够看到可执行文件名