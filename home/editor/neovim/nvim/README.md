我简单的做了配置，配置结构如下

- lua/config 存放我对 neovim 的配置，如开启相对行号，快捷键等
- lua/plugin 存放我对 neovim 的插件相关的配置
    - lua/plugin 下文件是我声明的插件
    - lua/plugin/config 下是插件的设置

## 快捷键说明

由于我本身没有长时间使用 neovim 进行开发工作，所以有关 lsp 等快捷键的设置可能并不够合理

|快捷键|用途|
|:--|:--|
|ctrl + s|保存|
|ctrl + h,j,k,l|在编辑模式下进行上下左右的挪动|
|tab/shift + tab|调整缩进，这个是在 visual 模式下使用的，我是用来选中一段，然后用 tab/shitt + tab 改变那一段的缩进|
|alt + 1,2,3| 切换到第 1,2,3 个打开的文件|
|alt + c|关闭当前打开的文件|
|space + tf|查找文件|
|space + tg|调用 rigrep 搜索|
|space + tgc|调出 git commit 信息窗口|
|space + tgs|调出 git status 窗口|
|space + td|显示 lsp 检查到的错误|
|space + tld|跳转到符号定义的位置，前提是 lsp 能找到|
|space + tlr|显示符号被引用的位置，前提是 lsp 能找到|
|space + lf|对当前文件进行 lsp 格式化|
|space + rn|调用 lsp 进行符号重命名|
|space + teh|分出一个水平的终端窗口| 
|space + tev|分出一个竖直的终端窗口| 
|space + tef|分出一个悬浮在中间的终端窗口| 
|space + e|在左侧呼出一个文件管理器|
|space + ec|关闭呼出来的文件管理器|

我甚至配置了 dap，但是我本身不太用，也懒得写相关的快捷键了。

有的快捷键我没写上去，比如 `K` 可以调出 lsp 对这个符号的说明（比如是变量的话就说明它的类型）
