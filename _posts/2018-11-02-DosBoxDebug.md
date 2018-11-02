---
layout: post
title:  "macos debug 环境搭建"
date:   2018-11-02 21:41:36 +0800
categories: assembly

---
## 一、下载dos模拟器Dosbox 
- 有macos 版本的
- [下载地址][1] 或者百度网盘[地址][3] 提取码: 2ev8 
- 这个软件作用是模拟dos环境

## 二、下载dos下面的汇编开发环境
 - 这个只有windows版本的
 - [下载地址][2] ，提取码: 9qav 
 - 下载包里面包含了debug.exe,link.exe,make.exe masm.exe 用于汇编的开发工具

## 三、挂在包含debug.exe 文件的目录
- 在dosbox 输入: mount c ~/assembly/masm5/ 
- ``` ~/assembly/masm5/ ``` 包含debug.exe 即可使用debug命令

## 四、总结
- dosbox 是dos环境的模拟
- debug.exe 是提供的汇编语言的debug 工具，还有其他工具，make等
- 挂载目录下面需要有debug.exe 文件，这样在dosbox下才能找到debug工具
- windows下可以使用类似的方法，把debug.exe 放在挂载目录所在盘的根目录下，具体方法可网上搜索

[1]:https://www.dosbox.com/
[2]:https://pan.baidu.com/s/1lTQ_WwAux-MdI4QLYG_CeA 
[3]:https://pan.baidu.com/s/1_M737YDyxy5rWytRnIaAoQ 

