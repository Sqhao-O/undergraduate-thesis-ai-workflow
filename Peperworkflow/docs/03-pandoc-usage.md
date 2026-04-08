# 03 - Pandoc 安装与使用详解

> 📌 **适用人群：** 需要将 Markdown 论文转换为 Word (DOCX) 格式的用户  
> ⏱️ **预计耗时：** 10-15 分钟（安装） + 5 分钟（学习基本使用）

---

## 目录

1. [Pandoc 是什么？](#pandoc-是什么)
2. [安装 Pandoc](#安装-pandoc)
3. [验证安装成功](#验证安装成功)
4. [查看支持的格式](#查看支持的格式)
5. [基本转换命令](#基本转换命令)
6. [使用 Word 模板保持格式](#使用-word-模板保持格式)
7. [高级选项与技巧](#高级选项与技巧)
8. [Markdown 写作规范](#markdown-写作规范)
9. [常见问题](#常见问题)

---

## Pandoc 是什么？

**Pandoc** 是由 **John MacFarlane** 开发的**通用文档转换工具**，被称为"文档转换界的瑞士军刀"。

**GitHub 仓库：** https://github.com/jgm/pandoc  
**官网：** https://pandoc.org/

### 能做什么？

Pandoc 可以在数十种文档格式之间互相转换：

```
┌──────────┐
│  Markdown │ ← 我们写论文用这个（简单、专注内容）
└─────┬────┘
      │ 转换
      ↓
┌──────────┐
│   DOCX    │ ← 学校要求提交的格式（Word 文档）
└──────────┘
```

### 在本工作流中的角色

```
步骤三：写 Markdown 论文 → 【Pandoc 转换】→ 步骤四：得到 DOCX 文件 → 后续排版
```

---

## 安装 Pandoc

### 方法一：官网下载安装包（推荐）

1. 打开浏览器，访问 **https://pandoc.org/installing.html**
2. 根据你的操作系统选择对应的安装包：

| 操作系统 | 下载文件 |
|----------|----------|
| Windows | `.msi` 安装包（64-bit 推荐） |
| macOS | `.pkg` 安装包 |
| Linux | 通过包管理器或下载 deb/rpm |

3. **Windows 用户详细步骤：**
   - 下载 `.msi` 文件（如 `pandoc-3.x.x-windows-x86_64.msi`）
   - 双击运行安装程序
   - 一路点击 **Next** 即可完成安装

4. **macOS 用户详细步骤：**
   - 下载 `.pkg` 文件
   - 双击运行
   - 按提示拖拽到 Applications 文件夹

### 方法二：使用包管理器（进阶）

**Windows (Chocolatey)：**
```bash
choco install pandoc
```

**Windows (Scoop)：**
```bash
scoop install pandoc
```

**macOS (Homebrew)：**
```bash
brew install pandoc
```

**Linux (Ubuntu/Debian)：**
```bash
sudo apt install pandoc
```

---

## 验证安装成功

安装完成后，打开终端（PowerShell / 命令提示符），输入以下命令进行验证。

### 命令一：查看版本号 ✅ 必做

```bash
pandoc --version
```

**预期输出示例：**

```
pandoc 3.1.9
Compiled with pandoc-types 1.23.0.1, skylighting 0.14.1
Default user data directory: C:\Users\LENOVO\AppData\Roaming\pandoc
Copyright (C) 2006-2024 John MacFarlane
Web:  https://pandoc.org
This is free software; see the source for copying conditions.
There is NO warranty, not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

> 🎉 如果看到版本信息，说明 Pandoc 已正确安装！

### 命令二：查看帮助信息

```bash
pandoc --help
```

这会列出所有可用的命令行参数和选项。不需要全部记住，需要时查阅即可。

---

## 查看支持的格式

Pandoc 支持非常多的文档格式！你可以用以下命令查看完整的支持列表。

### 命令三：查看所有输入格式 ✅ 推荐

```bash
pandoc --list-input-formats
```

**部分输出示例（实际列表更长）：**

```
commonmark
commonmark_x
creole
csv
docbook
docx
epub
html
json
latex
...
markdown
markdown_gfm
markdown_mmd
...
rst
t2t
textile
twiki
vimwiki
```

> 💡 **我们主要用的是 `markdown` 和 `docx`**

### 命令四：查看所有输出格式 ✅ 推荐

```bash
pandoc --list-output-formats
```

**部分输出示例：**

```
asciidoc
beamer
commonmark
commonmark_x
context
docbook
docx       ← ★ 这是我们最常用的输出格式
dokuwiki
epub
epub3
fb2
html
html4
latex
...
pptx
rst
rtf
texinfo
textile
slideous
slidy
...
pdf        ← ★ PDF 也是常用输出格式（需要 LaTeX）
```

### 为什么这些命令很重要？

- **确认你的 Pandoc 功能完整**
- **了解你能处理哪些文件格式**
- **调试时判断是否缺少某个格式的支持**

---

## 基本转换命令

### 最简单的转换

将 `thesis.md`（Markdown 文件）转换为 `thesis.docx`（Word 文档）：

```bash
pandoc thesis.md -o thesis.docx
```

#### 参数说明

| 部分 | 含义 |
|------|------|
| `pandoc` | 程序名 |
| `thesis.md` | 输入文件（源文件） |
| `-o` | output 的缩写，指定输出文件 |
| `thesis.docx` | 输出文件（目标文件） |

### 批量转换

如果你有多个 Markdown 文件要合并转换：

```bash
pandoc chapter1.md chapter2.md chapter3.md -o thesis.docx
```

这会将三个章节按顺序合并为一个 DOCX 文件。

### 从其他格式转换

Pandoc 不只是 Markdown → DOCX，它支持各种格式互转：

```bash
# HTML 转 Markdown
pandoc article.html -o article.md

# DOCX 转 Markdown（逆向操作）
pandoc existing.docx -o restored.md

# Markdown 转 PDF（需要安装 LaTeX）
pandoc thesis.md -o thesis.pdf

# Markdown 转 HTML 网页
pandoc thesis.md -o thesis.html
```

---

## 使用 Word 模板保持格式 ⭐ 重要！

这是论文转换中**最关键的参数**！

学校通常有论文格式要求（字体、字号、页边距等）。如果你直接用默认方式转换，生成的 DOCX 可能不符合要求。**解决方案是使用学校的 Word 模板。**

### 什么是 Reference Doc（参考模板）？

Reference Doc 就是一个"样式母版"，告诉 Pandoc：
- 正文用什么字体和字号
- 标题用什么样式
- 行距是多少
- 页边距是多少

### 准备模板文件

1. 从学校教务处/导师处获取论文 Word 模板
2. 通常命名为 `template.docx` 或 `论文模板.docx`
3. 把它放在与你的 `thesis.md` 同一个文件夹下

### 使用模板转换的命令

```bash
pandoc thesis.md -o thesis.docx --reference-doc=template.docx
```

#### 完整参数说明

| 部分 | 含义 |
|------|------|
| `pandoc` | 程序名 |
| `thesis.md` | 你的 Markdown 论文 |
| `-o thesis.docx` | 输出的 Word 文件 |
| `--reference-doc=` | 指定参考模板 |
| `template.docx` | 学校提供的 Word 模板 |

> 💡 **强烈建议：** 总是使用 `--reference-doc` 参数来生成符合学校要求的格式！

### 如何制作自定义模板？

如果学校没有提供模板，或者你想微调样式：

1. 先创建一个基础的 DOCX 作为模板
2. 用 Word 打开，修改样式：
   - 修改「正文」样式的字体为宋体/Times New Roman
   - 修改「标题 1」「标题 2」等的样式
   - 设置页边距（通常上下左右 2.54cm 或按学校要求）
3. 保存为 `my-template.docx`
4. 转换时引用这个模板：

```bash
pandoc thesis.md -o thesis.docx --reference-doc=my-template.docx
```

---

## 高级选项与技巧

### 设置元数据（标题、作者等）

创建一个元数据文件 `metadata.yaml`：

```yaml
title: "基于深度学习的图像识别系统研究"
author: "张三"
date: "2026年4月"
lang: zh-CN
```

然后转换时加上元数据：

```bash
pandoc thesis.md -o thesis.docx --reference-doc=template.docx metadata.yaml
```

或者在 Markdown 文件开头直接写 YAML 头部：

```yaml
---
title: "基于深度学习的图像识别系统研究"
author: "张三"
date: "2026年4月"
lang: zh-CN
---

# 摘要

这里是摘要内容...

```

### 自动生成目录

添加 `--toc`（Table of Contents）参数：

```bash
pandoc thesis.md -o thesis.docx --reference-doc=template.docx --toc
```

这会在文档开头自动根据标题层级生成目录。

### 设置目录标题

```bash
pandoc thesis.md -o thesis.docx --toc --toc-title="目  录"
```

### 处理中文文档

对于中文论文，建议加上以下参数：

```bash
pandoc thesis.md -o thesis.docx \
  --reference-doc=template.docx \
  -V CJKmainfont="SimSun" \
  -V geometry:margin=1in
```

| 参数 | 说明 |
|------|------|
| `-V CJKmainfont="SimSun"` | 设置中文字体为宋体 |
| `-V geometry:margin=1in` | 设置页边距 |

### 插入图片

在 Markdown 中这样写图片：

```markdown
![系统架构图](images/architecture.png)

图 3-1 系统整体架构图
```

转换时 Pandoc 会自动将图片嵌入 DOCX。

> ⚠️ 注意图片路径是相对于 Markdown 文件的位置。

---

## Markdown 写作规范

为了让 Pandoc 正确转换，你需要按照一定的规范编写 Markdown。

### 标题层级

```markdown
# 第一章 绪论          ← 一级标题（对应 Word 的"标题 1"）
## 1.1 研究背景        ← 二级标题（对应 Word 的"标题 2"）
### 1.1.1 国内研究现状  ← 三级标题（对应 Word 的"标题 3"）
```

### 基本语法速查

| 元素 | Markdown 写法 | 效果 |
|------|--------------|------|
| **粗体** | `**文字**` | **粗体** |
| *斜体* | `*文字*` | *斜体* |
| 列表 | `- 项目` 或 `1. 项目` | 有序/无序列表 |
| 代码 | `` `代码` `` | `行内代码` |
| 代码块 | ``` 包围 | 独立代码块 |
| 链接 | `[文字](url)` | 可点击链接 |
| 图片 | `![描述](路径)` | 嵌入图片 |
| 表格 | 见下方 | 表格 |
| 公式 | `$公式$` 或 `$$公式$$` | LaTeX 数学公式 |

### 表格写法

```markdown
| 方法 | 准确率 | 召回率 |
|------|--------|--------|
| CNN | 95.2% | 93.8% |
| ResNet | 97.1% | 96.5% |
| 本文方法 | 98.5% | 97.9% |

表 2-1 不同方法的性能对比
```

### 公式写法

```markdown
行内公式：损失函数 $L = -\sum y \log(\hat{y})$

独立编号公式：

$$
E = mc^2 \tag{1}
$$
```

---

## 实操示例：从零转换一篇论文

假设你有以下文件结构：

```
我的论文/
├── thesis.md           ← 你写的 Markdown 论文
├── template.docx       ← 学校给的 Word 模板
└── images/
    ├── fig1.png
    └── fig2.png
```

### 步骤

1. **打开终端，进入论文目录：**

   ```bash
   cd d:\Users\LENOVO\Desktop\我的论文
   ```

2. **先验证 Pandoc 可用：**

   ```bash
   pandoc --version
   ```

3. **执行转换：**

   ```bash
   pandoc thesis.md -o thesis.docx --reference-doc=template.docx --toc
   ```

4. **检查结果：**

   在文件资源管理器中双击打开 `thesis.docx`，检查：
   - ✅ 标题样式是否正确
   - ✅ 字体是否符合要求
   - ✅ 图片是否正常显示
   - ✅ 目录是否自动生成
   - ✅ 表格是否正常

---

## 常见问题

### Q: 转换后中文变成乱码怎么办？

**A:** 这是字体问题。解决方法：

```bash
# 使用模板时一般不会乱码
pandoc thesis.md -o thesis.docx --reference-doc=template.docx

# 或者手动指定中文字体
pandoc thesis.md -o thesis.docx -V CJKmainfont="SimSun"
```

### Q: 报错 "pandoc 不是内部或外部命令"

**A:** 说明 Pandoc 没有被正确加入系统 PATH。
- 重启终端窗口再试
- 如果还不行，重新安装 Pandoc 并勾选 "Add to PATH" 选项
- 重启电脑

### Q: 图片转换后不显示

**A:** 检查以下几点：
1. 图片路径是否正确（相对路径 vs 绝对路径）
2. 图片文件是否存在
3. 图片格式是否支持（推荐 PNG、JPG）

### Q: 生成的 DOCX 格式和模板不一样

**A:** 可能原因：
1. 模板文件的样式名称不是标准的（如"正文"、"标题 1"）
2. 尝试在模板中使用 Word 的标准样式名称
3. 参考 Pandoc 文档关于模板的制作指南

### Q: 怎么把 Markdown 转成 PDF？

**A:** 有两种方法：

**方法一（需要安装 LaTeX）：**
```bash
pandoc thesis.md -o thesis.pdf --pdf-engine=xelatex
```

**方法二（推荐）：** 先转 DOCX，再用 Word 导出 PDF
```bash
pandoc thesis.md -o thesis.docx --reference-doc=template.docx
```
然后用 Word 打开 DOCX → 文件 → 导出为 PDF。

---

> 📌 **相关链接：**
> - **Pandoc GitHub：** https://github.com/jgm/pandoc
> - **Pandoc 官网：** https://pandoc.org/
> - **Pandoc 用户手册：** https://pandoc.org/MANUAL.html

---

## 📖 文档导航

> 📍 **当前位置：第 3 篇 / 共 6 篇**（含 README）

| ⬅️ **上一篇** | 🔵 **当前位置** | ⬇️ **下一篇** |
|:---:|:---:|:---:|
| [📗 02-cc-switch-guide.md](./02-cc-switch-guide.md)<br><small>CC Switch 配置 API 密钥</small> | **📙 03-pandoc-usage.md**<br><small>Pandoc 安装验证与文档转换详解</small> | [📘 04-workflow-guide.md →](./04-workflow-guide.md)<br><small>完整工作流 8 阶段图解</small> |

### 📑 全部文档索引

| # | 文档 | 状态 |
|---|------|------|
| 0 | [README.md — 主文档（项目总览）](../README.md) | ✅ 已读完 |
| 1 | [01-claude-code-setup.md](./01-claude-code-setup.md) | ✅ 已读完 |
| 2 | [02-cc-switch-guide.md](./02-cc-switch-guide.md) | ✅ 已读完 |
| **3** | **03-pandoc-usage.md** | ✅ **当前阅读中** |
| 4 | [04-workflow-guide.md](./04-workflow-guide.md) | ⬅️ 接下来读 |
| 5 | [05-workbuddy-guide.md](./05-workbuddy-guide.md) | ☐ 待阅读 |
