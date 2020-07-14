# Neovim 配置

# 编辑器设置（Editor Setup）

## 选项（Options）

### <kbd>Tab</kbd>的相关配置

```vim
set expandtab       " Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    " Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   " Indent by 4 spaces when pressing <TAB>
 
set autoindent      " Keep indentation from previous line
set smartindent     " Automatically inserts indentation in some cases
set cindent         " Like smartindent, but stricter and more customisable
```

1. `tabstop` ： 一个tab等于多少个空格，当 `expandtab`的情况下，会影响在插入模式下按下`<tab>`键输入的空格，以及真正的 `\t` 用多少个空格显示；当在 `noexpandtab` 的情况下，只会影响 `\t` 显示多少个空格（因为插入模式下按 `<tab>` 将会输入一个字符 `\t` ）
2. `expandtab` ：设为真，在插入模式下按`<tab>`会插入空格，用`>`缩进也会用空格空出来；如果设置为假`noexpandtab`，那么插入模式下按`<tab>`就是输入`\t`，用`>`缩进的结果也是在行前插入`\t`。
3. `softtabstop` ：按下 `<tab>` 将补出多少个空格。在 `noexpandtab` 的状态下，实际补出的是 `\t` 和空格的组合。所以这个选项非常奇葩，比如此时 `tabstop=4 softtabstop=6` ，那么按下 `<tab>` 将会出现一个 `\t` 两个空格。
4. `shiftwidth` ：使用 `>>` `<<` 或 `==` 来缩进代码的时候补出的空格数。这个值也会影响 `autoindent` 自动缩进的值。

#### 参考

[关于Tab的总结](https://www.kawabangga.com/posts/2817)

### `set list`; `set listchars`

#### 参考

[链接](http://yyq123.blogspot.com/2011/11/vim-listchars.html)

### `set formatoptions`

选项`formatoptions` 确定了跟文本格式化有关的基本选项，常用的数值有：

- `t`：根据`textwidth`自动折行。

- `c`：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符。
- `r`：插入模式下在注释中键入回车时，插入合适的注释起始字符。
- `q`：允许使用`gq`命令对注释进行格式化。
- `n`：识别编号列表，编号行的下一行的缩进由数字后的空白决定（与`2`冲突，需要`autoindent`）。
- `2`：使用一段的第二行的缩进来格式化文本。
- `l`：在当前行长度超过`textwidth`时，不自动重新格式化。
- `m`：在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）。
- `M`：在拼接两行时（重新格式化，或者是手工使用`J`命令），如果前一行的结尾或后一行的开头是多字节字符，则不插入空格，非常适合中文。

#### 参考

[修改Vim的注释自动格式化](https://www.cnblogs.com/ayanmw/p/3432005.html)

### `set clipboard`

#### 参考

[Stack Overflow](https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings)

### 通用参考

[Vim Doc 中文版](https://yianwillis.github.io/vimcdoc/doc/options.html)

# 终端配置（Terminal Setup）

# 使用[vim-plug](https://github.com/junegunn/vim-plug)来安装插件（Install Plugins with vim-plug）

# 开关（Switches）

# 插件设置（Plugin Settings）

## eleine