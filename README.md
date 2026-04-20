## 基础按键

*   **Leader 键 (`<leader>`)**: `Space` (空格键)
*   **Local Leader 键 (`<localleader>`)**: `Space` (空格键)

## 通用编辑 (General Editing)

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Insert | `<C-q>` | 退出插入模式 (等同于 `<Esc>`) |
| Normal | `n` | 跳转到下一个搜索结果，并将其置于屏幕中央 |
| Normal | `N` | 跳转到上一个搜索结果，并将其置于屏幕中央 |
| Normal/Visual | `d` | 删除内容到黑洞寄存器 (不影响剪贴板) |
| Normal | `<leader>c` | 清除当前搜索的高亮显示 |
| Normal | `<leader>u` | 复制整个文件内容，并保持光标位置不变 |

## 窗口导航 (Window Navigation)

使用 `Ctrl` 加上 Vim 的方向键 `hjkl` 来在不同的分割窗口之间移动。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<C-h>` | 聚焦到左侧窗口 |
| Normal | `<C-j>` | 聚焦到下方窗口 |
| Normal | `<C-k>` | 聚焦到上方窗口 |
| Normal | `<C-l>` | 聚焦到右侧窗口 |

## 窗口分割 (Window Splitting)

使用 `Leader` 加上 `hjkl` 来向对应的方向进行窗口分割。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<leader>h` | 向左分割窗口 |
| Normal | `<leader>j` | 向下方分割窗口 |
| Normal | `<leader>k` | 向上方分割窗口 |
| Normal | `<leader>l` | 向右分割窗口 |

## 窗口调整 (Window Resizing)

使用 `Ctrl` 加上方向键来调整当前窗口的宽高。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<C-Up>` | 减小窗口高度 |
| Normal | `<C-Down>` | 增加窗口高度 |
| Normal | `<C-Left>` | 减小窗口宽度 |
| Normal | `<C-Right>` | 增加窗口宽度 |

## 终端 (Terminal)

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<leader>t` | 在底部打开终端窗口并进入插入模式 |
| Terminal | `<C-q>` | 退出终端模式 (返回 Normal 模式) |

## Helix 风格移动与选择 (Helix-style)

模拟了一些 Helix 编辑器的习惯。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `gs` | 移动到行首 (等同于 `0`) |
| Normal | `gl` | 移动到行尾 (等同于 `$`) |
| Normal | `x` | Helix 风格的行选择 (按下 `x` 选中当前行，可配合数字 `nx` 选中多行) |
| Visual | `x` | Helix 风格退出选择模式 (等同于 `<Esc>`) |

## 代码移动 (Move Code)

使用 `Alt` (`<A>`) 加方向键或者 `jk` 在 Normal 和 Visual 模式下移动代码行或代码块。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<A-k>` 或 `<A-Up>` | 将当前行向上移动一行，并自动对齐 |
| Normal | `<A-j>` 或 `<A-Down>`| 将当前行向下移动一行，并自动对齐 |
| Visual | `<A-k>` 或 `<A-Up>` | 将选中的代码块向上移动一行，并保持选中状态 |
| Visual | `<A-j>` 或 `<A-Down>`| 将选中的代码块向下移动一行，并保持选中状态 |

## 翻页 (Scrolling)

使用 `Shift` 加上下方向键进行半屏翻页。

| 模式 | 快捷键 | 功能描述 |
| --- | --- | --- |
| Normal | `<S-Up>` | 向上翻半页 (等同于 `<C-u>`) |
| Normal | `<S-Down>` | 向下翻半页 (等同于 `<C-d>`) |

## 自动补全括号对 (Auto close pairs)

在插入模式下，输入以下字符会自动补全另一半并将光标置于中间：

`'`, `` ` ``, `"`, `(`, `[`, `{`, `<`
