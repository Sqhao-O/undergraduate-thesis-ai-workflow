# 04 - 完整工作流图解

> 📌 **适用人群：** 想要了解从需求文档到最终排版全流程的用户  
> ⏱️ **预计耗时：** 阅读本文档约 10 分钟，完成整个工作流约 2-4 周

> 🔙 **返回** <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📑 README 主文档 →</a> | 如需概览和快速开始，点击链接 →

---

## 目录

1. [工作流总览](#工作流总览)
2. [阶段一：需求整理（Kimi Agent）](#阶段一需求整理kimi-agent)
3. [阶段二：代码开发与仿真（Claude Code）](#阶段二代码开发与仿真claude-code)
4. [阶段三：论文初稿编写（Markdown）](#阶段三论文初稿编写markdown)
5. [阶段四：格式转换（Pandoc）](#阶段四格式转换pandoc)
6. [阶段五：内容完善（人工修改）⭐](#阶段五内容完善人工修改⭐)
7. [阶段六：初步排版（Lark-Formatter）](#阶段六初步排版lark-formatter)
8. [阶段七：精细排版（WorkBuddy）](#阶段七精细排版workbuddy)
9. [阶段八：最终校对与提交](#阶段八最终校对与提交)
10. [时间规划建议](#时间规划建议)
11. [各工具协作关系图](#各工具协作关系图)

---

## 工作流总览

### 完整流程图

```
┌─────────────────────────────────────────────────────────────────────┐
│                     本科毕业论文 AI 辅助工作流                         │
│                                                                    │
│   ┌─────────┐    ┌─────────┐    ┌──────────┐    ┌──────────┐       │
│   │  阶段一  │ →  │  阶段二  │ →  │  阶段三   │ →  │  阶段四   │       │
│   │  需求    │    │  开发    │    │  初稿     │    │  转换     │      │
│   │         │    │  仿真    │    │ Markdown  │    │ DOCX     │      │
│   └────┬────┘    └────┬────┘    └─────┬────┘    └─────┬────┘       │
│        │              │               │               │            │
│        ▼              ▼               ▼               ▼            │
│   ┌─────────┐    ┌─────────┐    ┌──────────┐    ┌──────────┐      │
│   │ Kimi    │    │ Claude  │    │ Claude   │    │ Pandoc   │      │
│   │ Agent   │    │ Code    │    │ Code     │    │          │      │
│   └─────────┘    └─────────┘    └──────────┘    └──────────┘       │
│                                                                    │
│                                    ┌──────────┐                    │
│                           ┌──────→ │  阶段五   │                    │
│                           │        │ 人工修改  │ ←──────────┐       │
│                           │        │ (核心!)  │             │       │
│                           │        └─────┬────┘             │       │
│                           │              │                  │       │
│                           │              ▼                  │       │
│                           │        ┌──────────┐             │       │
│                           │        │  阶段六   │             │       │
│                           │        │ 初步排版  │ ────────────┘       │
│                           │        └─────┬────┘                    │
│                           │              │                         │
│                           │              ▼                         │
│                           │        ┌──────────┐                    │
│                           │        │  阶段七   │                    │
│                           │        │ 精细排版  │                    │
│                           │        └─────┬────┘                    │
│                           │              │                         │
│                           │              ▼                         │
│                           │        ┌──────────┐                    │
│                           └───────→│  阶段八   │                    │
│                                   │ 最终提交  │                    │
│                                   └──────────┘                    │
└─────────────────────────────────────────────────────────────────────┘
```

### 各阶段速查表

| 阶段 | 任务 | 主要工具 | AI参与度 | 人工参与度 |
|------|------|----------|----------|-----------|
| 一 | 整理需求和思路 | Kimi Agent | 🔥🔥🔥 高 | 🔥 低 |
| 二 | 写代码、做仿真 | Claude Code | 🔥🔥🔥 高 | 🔥🔥 中 |
| 三 | 编写论文初稿 | Markdown 编辑器 | 🔥🔥 中 | 🔥🔥🔥 高 |
| 四 | 转换为 Word 格式 | Pandoc | — | 🔥 低（自动） |
| 五 | **内容完善** | **Word + 人脑** | **❌ 不用！** | **🔥🔥🔥 最高** |
| 六 | 初步格式排版 | Lark-Formatter | 🔥 中 | 🔥🔥 中 |
| 七 | 精细格式检查 | WorkBuddy (小龙虾) | 🔥🔥 高 | 🔥🔥 中 |
| 八 | 最终校对人眼 + PDF | — | — | 🔥🔥🔥 最高 |

---

## 阶段一：需求整理（Kimi Agent）

### 目标

明确毕业论文的：
- 研究方向和题目
- 技术路线和方案
- 功能模块划分
- 预期成果和创新点

### 使用工具

**Kimi Agent**（https://kimi.moonshot.cn/）

> 💡 为什么用 Kimi？因为它的中文理解能力强、上下文窗口大，适合长文本的需求梳理。

### 操作步骤

```
1. 打开 Kimi 网站（需要登录）
2. 如果有 Agent 模式，切换到 Agent 模式
3. 在对话框中输入你的初步想法，例如：

   "我要做一个基于深度学习的图像识别系统作为本科毕业论文，
    帮我整理一份完整的需求文档框架，包括研究背景、技术选型、
    功能模块设计、预期成果等。"

4. 根据Kim i的输出进行多轮对话，逐步细化需求
5. 将最终确定的内容保存为 Markdown 文件（requirements.md）
```

### 输出产物

```markdown
# requirements.md 示例结构

## 论文题目
基于 XXX 的 YYY 系统研究与实现

## 研究背景
（AI 帮你整理的背景资料）

## 技术路线
- 方案 A：...
- 方案 B：... （推荐）
- 选择理由：...

## 功能模块
1. 数据预处理模块
2. 核心算法模块
3. 用户界面模块
4. ...

## 创新点（必须自己想！！！）
1. ...
2. ...

## 参考文献
（AI 帮你搜集的）
```

### ⚠️ 注意事项

- ✅ 让 AI 帮你**整理和归纳**
- ✅ 用 AI **扩展阅读面**
- ❌ 不要让 AI 替你决定**创新点**——这必须是原创！

---

## 阶段二：代码开发与仿真（Claude Code）

### 目标

根据需求文档，完成：
- 项目工程搭建
- 核心代码编写
- 代码调试与测试
- 仿真/实验运行
- 结果数据收集

### 使用工具

**Claude Code**（详见 <a href="./01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 Claude Code 配置教程 →</a>）

### 操作步骤

```
1. 打开终端（PowerShell）
2. 进入项目文件夹：
   cd d:\你的项目路径
3. 启动 Claude Code：
   claude
4. 让它读取需求文档：
   > 请读取 requirements.md 文件，理解项目的整体需求
5. 分步让 Claude Code 实现：
   > 请先搭建项目的基础目录结构
   > 请实现数据预处理模块
   > 请编写核心算法代码
   > 请帮我运行测试，看看有没有错误
6. 运行仿真/实验：
   > 请运行 main.py 并分析输出结果
7. 收集实验数据和结果截图
```

### 与 Claude Code 对话的最佳实践

#### ✅ 好的做法

```
> 请你读取当前文件夹下的《需求文档.md》，根据文档里的需求，完整编写可直接运行的代码，创建对应的工程文件，代码要添加详细注释，符合本科毕设的规范要求。

> 我在运行时遇到了 TypeError: ... 错误，
  请帮我定位原因并修复。

> 请在 tests/ 目录下创建单元测试文件，
  测试 core.py 中的所有公开函数。
```

#### ❌ 不好的做法

```
> 帮我写个毕设
> 你说该怎么做？
> 我的程序出错了（但不给具体信息）
```

### 输出产物

```
项目文件夹/
├── src/                 ← 源代码
│   ├── main.py
│   ├── simulator.py
│   ├── utils.py
│   └── ...
├── data/                ← 数据文件
│   ├── input/
│   └── output/          ← 仿真结果数据
├── tests/               ← 测试代码
├── results/             ← 实验结果和图表
│   ├── fig1_accuracy.png
│   ├── fig2_loss.png
│   └── data_results.csv
├── requirements.txt     ← Python 依赖
└── README.md            ← 项目说明
```

---

## 阶段三：论文初稿编写（Markdown）

### 目标

用Claude Code将你的研究成果写成完整的学术论文初稿，可以先创建一个 Markdown 文件，然后使用Claude Code根据模板填写内容。

### Markdown 论文模板结构

```markdown
---
title: "基于XXX的YYY系统研究与实现"
author: "你的名字"
date: "2026年4月"
lang: zh-CN
---

# 摘要

[中文摘要，200-300字]

**关键词：** 关键词1；关键词2；关键词3

# Abstract

[英文摘要，与中文摘要对应]

**Keywords:** Keyword1; Keyword2; Keyword3

# 第一章 绪论

## 1.1 研究背景与意义

## 1.2 国内外研究现状

## 1.3 本文主要工作

## 1.4 论文组织结构

# 第二章 相关技术与理论基础

## 2.1 XXX技术介绍
## 2.2 YYY方法概述
## 2.3 本章小结

# 第三章 系统设计与实现

## 3.1 系统总体架构
## 3.2 各模块详细设计
## 3.3 关键代码实现
## 3.4 本章小结

# 第四章 仿真/实验与结果分析

## 4.1 实验环境配置
## 4.2 实验方案设计
## 4.3 实验结果展示
![实验结果图](results/fig1.png)

*图 4-1 XXX方法的准确率对比*

## 4.4 结果分析与讨论
## 4.5 本章小结

# 第五章 总结与展望

## 5.1 工作总结
## 5.2 不足与展望

# 致谢

# 参考文献

# 附录
```

### 插入图片的方法

```markdown
![系统架构图](images/architecture.png)

图 3-1 系统整体架构图
```

> 💡 图片放在与 .md 文件同级的 `images/` 或 `results/` 文件夹中。

### 插入表格的方法

```markdown
| 方法 | 准确率(%) | 召回率(%) | F1值(%) |
|------|-----------|-----------|---------|
| 方法A | 85.2 | 83.1 | 84.1 |
| 方法B | 89.7 | 87.3 | 88.5 |
| **本文方法** | **94.3** | **92.8** | **93.5** |

表 4-1 不同方法的性能对比
```

---

## 阶段四：格式转换（Pandoc）

### 目标

将 Markdown 格式的论文转换为学校要求的 DOCX（Word）格式。

### 使用工具

**Pandoc**（详见 <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 Pandoc 使用教程 →</a>）

### 操作步骤

```
1. 确保已安装 Pandoc：
   pandoc --version

2. 准备学校的 Word 模板文件（template.docx）

3. 执行转换命令：
   pandoc thesis.md -o thesis.docx \
     --reference-doc=template.docx \
     --toc \
     --toc-title="目  录"

4. 双击打开 thesis.docx，检查转换效果
```

### 转换后检查清单

- [ ] 所有章节标题格式正确
- [ ] 图片正常显示
- [ ] 表格正常显示
- [ ] 公式正常显示
- [ ] 目录自动生成
- [ ] 字体基本正确（后续工具会微调）
- [ ] 页码位置正确

---

## 阶段五：内容完善（人工修改）⭐

### ⚠️⚠️⚠️ 这是最重要的一步！！！⚠️⚠️⚠️

**这一步没有 AI 参与，完全靠你自己！**

### 为什么这一步最重要？

- AI 生成的只是"草料"，你需要把它变成"菜肴"
- 你的独立思考和分析是论文的灵魂
- 导师审阅的是**你的理解**，不是 AI 的文字堆砌
- 学术诚信要求所有核心内容必须是原创

### 具体要做的事

#### 1. 重写所有 AI 生成的段落

```
原文（AI生成）：
"深度学习技术在近年来取得了显著的进展，其通过多层神经网络结构
能够自动提取数据的层次化特征表示..."

改为（你自己写的）：
"在本研究中，我们采用了卷积神经网络（CNN）作为核心特征提取器。
选择 CNN 的原因有三方面：（1）其在图像局部特征捕捉方面的天然优势；
（2）参数共享机制大幅降低了模型复杂度；（3）经过预训练的 CNN
可以作为有效的特征提取器..."
```

#### 2. 补充真实的分析和见解

- [ ] 加入你对实验结果的**个人解读**
- [ ] 说明为什么某个方法比另一个更好
- [ ] 分析失败的原因和改进方向
- [ ] 联系实际应用场景讨论意义

#### 3. 确保所有数据真实

- [ ] 所有数字都是实际运行的**真实结果**
- [ ] 所有引用文献都**真实存在**
- [ ] 所有图表都是自己**生成的**
- [ ] 不要编造任何数据！

#### 4. 语言风格统一

- [ ] 全文保持一致的叙述口吻
- [ ] 专业术语使用一致
- [ ] 避免中英文混杂（专有名词除外）
- [ ] 检查语法和错别字

### 修改时长建议

**至少预留1-2个月时间**来专门做这件事。不要急于进入排版环节。

---

## 阶段六：初步排版（Lark-Formatter）

### 目标

对 DOCX 论文进行一键自动化排版，处理基本的格式问题。

### 使用工具

**Lark-Formatter**  
**GitHub：** https://github.com/Alouetter/Lark-Formatter  
**当前版本：** 0.2.1 Hotfix（基于 0.20 LTS）

### 操作步骤

```
1. 下载 Lark-Formatter
   GitHub Releases 页面下载最新版本

2. 解压到任意目录（如 D:\Tools\Lark-Formatter）

3. 启动程序：
   - Windows: 双击 start_app.bat
   - 或者终端中运行 start_app.bat

4. 加载论文文件：
   - 点击"打开文件"或拖拽 thesis.docx 到窗口

5. 配置排版选项（根据学校要求）：
   - 正文字体、字号
   - 标题字体、字号
   - 行距设置
   - 页边距设置
   - 标题编号方式

6. 点击"一键排版"

7. 检查排版结果：
   - 标题编号是否正确（1, 1.1, 1.1.1...）
   - 字体是否统一
   - 行距是否合适
   - 页边距是否正确

8. 导出/保存排好版的文件
```

### Lark-Formatter 能做什么？

| 功能 | 说明 |
|------|------|
| 多级标题编号 | 自动处理一级/二级/三级标题编号 |
| 字体设置 | 统一正文、标题字体和字号 |
| 行距调整 | 设置固定行距或倍数行距 |
| 页边距 | 统一设置上下左右页边距 |
| 段落缩进 | 首行缩进两个字符 |
| 页眉页脚 | 添加页码等信息 |

### 排版后检查

- [ ] 一级标题："第一章"、"第二章"... 编号正确
- [ ] 二级标题："1.1"、"1.2"... 编号正确
- [ ] 三级标题："1.1.1"、"1.1.2"... 编号正确
- [ ] 正文字体字号符合学校要求
- [ ] 行距符合要求（通常 1.25 或 1.5 倍）
- [ ] 页边距符合要求

---

## 阶段七：精细排版（WorkBuddy）

### 目标

使用 WorkBuddy 的 Paper Check Skill 进行精细化的格式检测和修复。

### 使用工具

**WorkBuddy（腾讯小龙虾）下载地址：** https://www.codebuddy.cn/work/ 
**Paper Check Skill 下载地址：** https://clawhub.ai/sashavegal/paper-check  

详细操作指南 → <a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 WorkBuddy 排版教程 →</a>

### 核心流程概要

```
1. 安装并启动 WorkBuddy（Claw 模式）
2. 下载 Paper Check Skill
3. 创建 skill 文件夹，放入论文和格式规范
4. 初始化 Skill，读取排版要求
5. 自动检测格式问题
6. 一键修复或手动确认修复
7. 生成对比报告
8. 导出最终版本
```

### WorkBuddy vs Lark-Formatter 的区别

| 维度 | Lark-Formatter | WorkBuddy |
|------|----------------|-----------|
| **类型** | 桌面应用程序 | AI Agent 平台 |
| **原理** | 规则引擎（固定规则） | AI 理解（智能判断） |
| **优势** | 快速、批量处理 | 更灵活、能理解复杂规范 |
| **擅长** | 标题编号、字体行距 | 复杂格式、细节检查 |
| **推荐用途** | 初步排版 | 精细调整 |

### 最佳实践

建议 **两者结合使用**：

```
Markdown 论文初稿
    ↓
  Pandoc 转换为 DOCX 格式
    ↓
  Lark-Formatter（初步排版：标题编号、字体、行距）
    ↓
  人工内容完善
    ↓
  WorkBuddy（精细检查：细节格式、特殊要求）
    ↓
  最终版论文 ✓
```

---

## 阶段八：最终校对与提交

### 最后的人工检查

这是最后一道防线！请逐项检查：

#### 内容检查

- [ ] 通读全文至少 **2 遍**
- [ ] 检查所有**错别字**
- [ ] 检查**语句通顺性**
- [ ] 检查**逻辑连贯性**
- [ ] 确认**创新点**表述清晰
- [ ] 确认**结论**与研究内容对应

#### 格式检查

- [ ] **封面信息**正确（姓名、学号、指导教师等）
- [ ] **摘要**中英文对照
- [ ] **关键词**数量和格式正确
- [ ] **目录**页码与正文一致
- [ ] **图表编号**连续且引用正确
- [ ] **参考文献**格式统一（GB/T 7714）
- [ ] **页眉页脚**正确
- [ ] **页码**从正文开始

#### 文件准备

- [ ] 导出 **PDF** 版本（学校一般要求 PDF 提交）
- [ ] 保留 **DOCX** 版本（备用）
- [ ] 准备**源代码**压缩包（如果需要）
- [ ] 准备**答辩PPT**（另外制作）

### 提交前自检表

```
□ 论文查重率在学校规定范围内（一般 < 30%）
□ 参考文献数量达到要求（一般 >= 15篇）
□ 所有实验数据可复现
□ 导师已经审阅过并给出修改意见
□ 所有导师意见已修改完成
□ 文件命名符合学校要求
□ PDF 可以正常打开和打印
```

---

## 时间规划建议

### 总体时间线（以 6 周为例）

```
第  1  周   ████████████████████░░░░░   阶段一+二：需求 + 开发
第  2  周   ░░░███████████████████░░░   阶段二+三：开发 + 初稿
第  3  周   ░░░░░░█████████████████░    阶段三：论文撰写
第 4-9 周   ██████████████████████░░░   阶段五：人工修改完善（重点！）
第  10 周   ░░░░░░░░░░░░████████████    阶段六+七：排版
第  11 周   ░░░░░░░░░░░░░░░░████████    阶段八：校对 + 提交
```


---

## 各工具协作关系图

```
                    ┌──────────────┐
                    │   Kimi Agent  │
                    │  (需求整理)   │
                    └──────┬───────┘
                           │ 输出需求文档
                           ↓
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  CC Switch   │ ←→ │ Claude Code  │ → │  项目代码     │
│ (API 管理)   │    │ (开发调试)    │    │  + 实验数据   │
└──────────────┘    └──────┬───────┘    └──────┬───────┘
                            │                   │
                            ↓                   ↓
                    ┌──────────────┐    ┌──────────────┐
                    │  Markdown    │    │  图表/数据    │
                    │  论文初稿     │    │  (插入论文)   │
                    └──────┬───────┘    └──────┬───────┘
                           │                   │
                           └───────┬───────────┘
                                   ↓
                          ┌──────────────┐
                          │    Pandoc     │
                          │  MD → DOCX   │
                          └──────┬───────┘
                                 ↓
                    ┌──────────────┐    ┌──────────────┐
                    │  人工大量修改  │ ←→ │ Lark-       │
                    │  (核心环节!)   │    │ Formatter   │
                    └──────┬───────┘    │ (初步排版)   │
                           │            └──────┬───────┘
                           ↓                   ↓
                   ┌──────────────┐     ┌──────────────┐
                   │  WorkBuddy    │ ←→ │  最终论文     │
                   │  (精细排版)    │     │  (DOCX/PDF)  │
                   └──────────────┘     └──────────────┘
```

---

## 总结

### 核心原则回顾

1. **AI 是辅助，不是替代** —— 创新点和核心内容必须自己做
2. **工具组合使用比单一工具更强** —— 每个工具都有其擅长的场景
3. **内容 > 格式** —— 先把内容写好，再考虑排版
4. **留足人工修改时间** —— 这是质量的关键保证
5. **尽早开始** —— 别等到最后一周才动手

### 快速导航

| 想了解更多？ | 跳转到 |
|-------------|--------|
| Claude Code 配置 | <a href="./01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📖 查看教程 →</a> |
| API 密钥配置 | <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📖 查看教程 →</a> |
| Pandoc 使用 | <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📖 查看教程 →</a> |
| WorkBuddy 排版 | <a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📖 查看教程 →</a> |

---

## 📖 文档导航

> 📍 **当前位置：第 4 篇 / 共 6 篇**（含 README）

### 🔗 快速跳转

| ⬅️ **上一篇** | 🔵 **当前位置** | **下一篇 ➡️** |
|:---:|:---:|:---:|
| <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📄 上一篇</a><br><small>Pandoc 文档转换详解</small> | **📘 04-workflow-guide.md**<br><small>完整工作流 8 阶段图解与时间规划</small> | <a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #0969da; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📔 下一篇 →</a><br><small>WorkBuddy 智能排版实战</small> |

### 🚀 继续阅读

<p align="center">

<a href="./03-pandoc-usage.md" style="display: inline-block; padding: 10px 24px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 15px; margin: 4px;">
    ⬅️ 上一篇：Pandoc 使用详解
</a>
&nbsp;&nbsp;
<a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 10px 24px; background-color: #0969da; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 15px; margin: 4px;">
    ➡️ 下一篇：WorkBuddy 排版教程 →
</a>

</p>

### 📑 全部文档索引

| # | 文档 | 状态 |
|---|------|------|
| 0 | <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📄 README 主文档 →</a> | ✅ 已读完 |
| 1 | <a href="./01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📘 开始阅读 →</a> | ✅ 已读完 |
| 2 | <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📗 开始阅读 →</a> | ✅ 已读完 |
| 3 | <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📙 开始阅读 →</a> | ✅ 已读完 |
| **4** | **📕 04-workflow-guide.md** | ✅ **当前阅读中** |
| 5 | <a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📔 最后1篇！→</a> | ⬅️ 最后1篇！ |

---

<p align="center">
  <strong>🎓 祝你毕业顺利！</strong>
</p>

<p align="center">
  记住：<strong>AI 帮你提效，才华属于你自己。</strong>
</p>
