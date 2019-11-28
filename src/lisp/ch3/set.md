
# 第三章

## begin 语法

```lisp
(begin <exp1> <exp2> .. <expn>)
```

- 顺序求值，最后一个表达式的值作为整个begin的返回值

## set! 语法

```lisp
(set! <name> <new-value>)
```

- name是一个符号
- new-value是任何表达式
