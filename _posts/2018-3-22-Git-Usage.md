---
layout: post
title:  "Git使用方法"
date:   2018-03-22 10:10:36 +0800
categories: algorithm

---

# git 使用方法小结

## 1.git 创建本地分支

### 1.1 在本地创建分支

```git
    git branch branch_name  //创建本地分支
    git checkout branch_name //切换分支
```

- 可以使用如下命令创建并切换分支

```git
    git checkout -b branch-name //创建本地分支,并切换到新分支上
```

- 创建的分支都是基于当前的所在的分支

### 1.2 在本地创建分支 关联本地分支和远程分支

```git
    git push origin branch_name:remote_branchname //
    git branch --set-upstream-to=origin/remote_branch_name  branch_name 关联本地和远程的分支
```

### 1.3 从其他分支拉取自己的分支步骤

```git
    1.git checkout remote_branch
    2.git branch yourlocal_branch
    3.git checkout  yourlocal_branch
    4.git push origin yourlocal_branch:remote_branch
    5.git branch --set-upstream-to=origin/remote_branch yourlocal_branch
```

## 2.删除分支

### 2.1 删除本地分支

```git
    git branch -d branch_name //这里当前所在的分支不能是要删除的分支
```

### 2.2 删除远程分支

```git
    git push origin --delete branch_name
```

### 2.3 删除远程分支在本地的索引

```git
    git branch -r -d origin/branch_name
```

### 3 Git保存临时结果

```git
    git stash // 可以保存在工作区内的修改的内容，到本地栈当中
    git stash list //查看保存的栈
    git stash apply stash@{n} //恢复栈保存的内容到工作区内
    git stash pop //弹出最近一次保存的结果
```


### 4 重命名分支

```git
    git branch -m newname //在当前需要重命名的分支
    git branch -m oldname newname //不在当前重命名的分支，需要命名别的分支的时候
    git push origin :oldname newname //重命名远程分支
    git push origin -u newname
```

### 5 配置用户名和代理


```git
git config --global --list // 查看配置信息
git config --global user.name "yourname"
git config --global user.email "yourname@example.com"
git config --global https.proxy 'https://dev-proxy.oa.com:8080'
git config --global http.proxy 'http://dev-proxy.oa.com:8080'
```