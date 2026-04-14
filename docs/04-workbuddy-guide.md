# 04 - WorkBuddy（腾讯小龙虾）使用教程

> **适用人群：** 需要对论文进行精细化 AI 排版和格式检查的用户
> **预计耗时：** 20-30 分钟（首次配置） + 10 分钟/每次排版

> [返回 README 主文档](../README.md#全部文档索引) | 如需概览和快速开始，点击链接

---

## 目录

1. [WorkBuddy 是什么？](#1-workbuddy-是什么)
2. [安装与启动](#2-安装与启动)
3. [Paper Check Skill 下载](#3-paper-check-skill-下载)
4. [准备工作：组织文件结构](#4-准备工作组织文件结构)
5. [初始化 Skill 并加载论文](#5-初始化-skill-并加载论文)
6. [读取排版要求](#6-读取排版要求)
7. [执行自动排版与检测](#7-执行自动排版与检测)
8. [查看结果与导出](#8-查看结果与导出)
9. [WorkBuddy vs Lark-Formatter 对比](#9-workbuddy-vs-lark-formatter-对比)
10. [常见问题](#10-常见问题)
11. [总结](#11-总结)

---

## 1. WorkBuddy 是什么？

### 1.1 基本信息

| 属性 | 详情 |
|------|------|
| **英文名称** | WorkBuddy |
| **中文名称** | 小龙虾 / 腾讯小龙虾 |
| **开发团队** | 腾讯 |
| **类型** | AI 智能助手平台 |
| **核心能力** | Agent 模式下可调用各种 Skill 完成复杂任务 |

### 1.2 在本工作流中的角色

WorkBuddy 的 **Paper Check Skill** 可以：

- 读取学校的论文格式规范文档（PDF/DOCX/TXT）
- 自动检测 DOCX 论文中的格式问题
- 一键或逐项修复格式错误
- 生成详细的修改对比报告

### 1.3 为什么用 WorkBuddy 做精细排版？

Lark-Formatter 擅长处理**规则明确的格式**（如标题编号、字体行距），而 WorkBuddy 的优势在于：

- 能理解自然语言描述的格式规范
- 能处理复杂的、特殊的格式要求
- 提供智能化的修改建议
- 生成对比报告，方便人工确认

### 1.4 为什么 WorkBuddy 使用独立的 Skill？

**原因：WorkBuddy 的 Paper Check Skill 需要配置 Python 环境路径**，这对于不熟悉命令行的用户可能有些麻烦。

其他 Skill（如 brainstorming、academic-paper-reviewer、pptx、pdf、docx）都通过 Claude Code 的 `/skills` 命令直接调用，**无需额外配置**，开箱即用。

因此：
- **论文构思、润色、PPT 制作** → 用 Claude Code Skills
- **论文精细排版** → 用 WorkBuddy（虽然需要配置，但排版效果更好）

这是一个**主动选择**：为了更好的排版效果，宁可多花一点配置时间。

---

## 2. 安装与启动

### 2.1 获取 WorkBuddy

1. 访问 WorkBuddy 官方渠道(https://copilot.tencent.com/work/)获取安装包
2. 根据你的操作系统下载对应版本
3. 运行安装程序完成安装

### 2.2 启动方式 — Claw 模式

WorkBuddy 有多种工作模式，本工作流需要使用 **Claw 模式**（Agent 模式）：

1. 启动 WorkBuddy 应用程序
2. 在模式选择中切换到 **Claw 模式**
3. Claw 模式允许你通过对话方式操作文件、调用 Skill

### 2.3 打开项目文件夹

在 WorkBuddy 中打开你的论文所在的文件夹：

```
方法一：
1. 点击 "打开文件夹" 或 "Open Folder"
2. 选择存放论文的目录
3. 确认打开

方法二：
直接将文件夹拖拽到 WorkBuddy 窗口中
```

---

## 3. Paper Check Skill 下载

### 3.1 Skill 是什么？

Skill 是 WorkBuddy 的"技能插件"，类似于手机 App。每个 Skill 实现特定功能。

**Paper Check Skill** 是专门用于**论文格式检查和自动排版**的技能。

### 下载地址

👉 **https://clawhub.ai/sashavegal/paper-check**

这是 Paper Check Skill 在 ClawHub（WorkBuddy 的 Skill 市场）上的页面。

### 3.2 下载步骤

```
1. 打开浏览器，访问上面的下载地址
2. 查看 Skill 的说明信息（版本、功能介绍等）
3. 点击 "Download" 或 "下载" 按钮
4. 下载得到一个 Skill 文件包（通常是压缩包或文件夹）
5. 记住下载的位置，下一步会用到
```

> 关于 ClawHub：
> ClawHub (clawhub.ai) 是 WorkBuddy 的 Skill 分享平台，类似于 VS Code 的扩展市场。你可以在上面找到社区贡献的各种 Skill。

---

## 4. 准备工作：组织文件结构

在使用 WorkBuddy 进行排版之前，需要按照特定的方式组织你的文件。

### 4.1 目标文件夹结构

在你的工作目录下创建如下结构：

```
你的工作目录/
├── skill/                    ← 新建的文件夹，放 Skill 相关内容
│   └── paper-check/          ← Paper Check Skill 文件放在这里
│       ├── SKILL.md          ← Skill 定义文件
│       └── （其他 Skill 文件）
│
├── thesis.docx               ← 你的论文文件 ★ 与 skill 文件夹平级
├── format-rules.docx         ← 学校的格式规范文件 ★ 与 skill 文件夹平级
└── format-rules.pdf          ← 或者 PDF 格式的规范也行
```

### 4.2 关键要点

#### 4.2.1 要点一：skill 文件夹位置

创建一个名为 `skill` 的文件夹，将下载的 Paper Check Skill 放入其中。

#### 4.2.2 要点二：论文文件位置

**论文文件（thesis.docx）必须与 `skill` 文件夹平级（同一级目录），不是放在 skill 里面！**

```
正确的结构：
  工作目录/
  ├── skill/           ← Skill 放这里
  │   └── paper-check/
  └── thesis.docx      ← 论文在这里！（和 skill 平级）

错误的结构：
  工作目录/
  └── skill/
      ├── paper-check/
      └── thesis.docx  ← 论文不应该放这里！
```

#### 4.2.3 要点三：格式规范文件

将学校的论文格式要求文件也放到**同一级目录**：

- 格式规范可能是 `.docx`、`.pdf` 或 `.txt` 格式
- 文件名可以自定义，如 `format-rules.docx` 或 `学校论文格式要求.pdf`

### 4.3 具体操作步骤

```
1. 在 D 盘（或其他位置）创建一个工作文件夹：
   如 D:\Thesis-Formatting\

2. 将以下文件复制进去：
   - 你的论文：thesis.docx
   - 学校格式规范：format-rules.pdf（或 .docx）

3. 创建 skill 子文件夹：
   - 在 D:\Thesis-Formatting\ 下新建文件夹，命名为 "skill"

4. 将下载的 Paper Check Skill 解压/放入 skill 文件夹：
   - 最终路径类似：D:\Thesis-Formatting\skill\paper-check\
```

---

## 5. 初始化 Skill 并加载论文

### 5.1 步骤一：在 Claw 模式中进入工作目录

```
1. 启动 WorkBuddy
2. 切换到 Claw 模式
3. 使用 "打开文件夹" 功能，进入 D:\Thesis-Formatting\
```

### 5.2 步骤二：初始化 Skill

在 Claw 模式的对话框中，输入初始化指令：

```
请初始化 skill 文件夹中的 paper-check 技能，
读取并理解该技能的功能和规则。
```

WorkBuddy 会：
1. 自动扫描 `skill/` 文件夹
2. 读取 `paper-check` Skill 的定义文件 (`SKILL.md`)
3. 加载 Skill 的功能和指令集
4. 返回确认信息："Paper Check 技能已就绪"

### 5.3 步骤三：加载论文文件

告诉 WorkBuddy 你的论文文件名：

```
请读取 thesis.docx 文件，这是我的毕业论文。
```

WorkBuddy 会：
1. 找到并打开 `thesis.docx`
2. 解析文档结构（章节、段落、图表等）
3. 显示基本信息（总页数、章节数等）

### 5.4 步骤四：加载格式规范

告诉 WorkBuddy 格式规范文件：

```
请同时读取 format-rules.pdf（或 format-rules.docx），
这是学校要求的论文格式规范，后续排版需要遵循这些规定。
```

WorkBuddy 会：
1. 读取格式规范文件
2. 提取关键格式要求（字体、字号、页边距、编号规则等）
3. 建立格式检查标准

---

## 6. 读取排版要求

在正式排版前，先让 WorkBuddy 总结它理解的格式要求：

```
根据刚才读取的学校格式规范，请总结以下排版要求：
1. 正文字体、字号、行距
2. 各级标题的格式
3. 页边距设置
4. 图表编号和引用格式
5. 参考文献格式
6. 其他特殊要求
```

### 6.1 确认格式要求正确

这一步非常重要！请仔细核对 WorkBuddy 输出的格式要求是否与你学校的规范一致。

如果发现有不一致的地方，及时指出：

```
不对，正文字号应该是小四，不是五号。
页边距应该是上下2.54cm，左右3.17cm。
```

WorkBuddy 会修正它的理解，然后继续。

---

## 7. 执行自动排版与检测

### 7.1 方式一：全自动排版（推荐首次使用）

```
请根据格式规范对 thesis.docx 进行全面检查和自动排版，
包括但不限于：
- 字体字号调整
- 标题编号规范化
- 行距和段间距调整
- 页边距设置
- 图表格式统一
- 参考文献格式化
```

WorkBuddy 会：
1. 逐项检查论文的每个部分
2. 发现不符合规范的地方
3. 自动修复可修复的问题
4. 对于不确定的问题，列出清单让你确认

### 7.2 方式二：分步检查（推荐精细控制）

如果你想逐步控制排版过程：

```
第一步：请先检查所有标题格式是否正确，
       包括一级、二级、三级标题的字体、字号、编号。

第二步：请检查正文格式，包括字体、字号、行距、首行缩进。

第三步：请检查图片和表格的编号、标题位置、引用格式。

第四步：请检查参考文献的格式是否符合 GB/T 7714 标准。

第五步：请检查页眉、页脚、页码是否正确。
```

### 7.3 方式三：仅检测不修改

如果你只想知道有哪些问题：

```
请检查 thesis.docx 中所有不符合格式规范的地方，
但不要直接修改，列出所有问题的详细报告。
```

这会输出一份**问题清单**，你可以逐一决定是否修复。

---

## 8. 查看结果与导出

### 8.1 排版完成后

WorkBuddy 通常会：

1. **输出修改摘要：**
   ```
   已完成论文格式检查与排版
   
   修改统计：
   - 修改标题格式：12 处
   - 调整正文字体：8 处
   - 修正行距：5 处
   - 统一图表编号：3 处
   - 其他调整：7 处
   总计修改：35 处
   ```

2. **保存修改后的文件：**  
   通常会保存为新的文件（如 `thesis_formatted.docx`）或在原文件上直接修改

3. **生成对比报告：**  
   详细记录每处修改的前后对比

### 8.2 导出最终版本

```
请将排版后的论文保存为 thesis_final.docx，
同时生成一份修改对比报告 report.md。
```

### 8.3 验证排版效果

用 Word 打开排好版的文件，逐项检查：

- [ ] 封面信息完整且格式正确
- [ ] 摘要页格式正确
- [ ] 目录页码准确
- [ ] 各级标题样式一致
- [ ] 正文格式统一
- [ ] 图片有编号且居中
- [ ] 表格有三线表样式
- [ ] 公式编号靠右
- [ ] 参考文献排列整齐
- [ ] 页码位置正确

---

## 9. WorkBuddy vs Lark-Formatter 对比

在实际使用中，建议两个工具**配合使用**：

| 对比维度 | Lark-Formatter | WorkBuddy |
|----------|----------------|-----------|
| **工具类型** | 桌面 GUI 程序 | AI Agent 平台 |
| **操作方式** | 点按钮、选选项 | 自然语言对话 |
| **核心原理** | 规则引擎（if-then） | AI 大模型理解 |
| **速度** | 快（秒级） | 相对慢（分钟级） |
| **灵活性** | 固定模板 | 高度灵活 |
| **擅长场景** | 标题编号、批量字体/行距 | 复杂规范理解、细节检查 |
| **特殊需求支持** | 弱（需手动配置） | 强（AI 可理解自然语言） |
| **对比报告** | 无 | 有详细修改报告 |
| **适用阶段** | 初步排版 | 精细调整 |
| **费用** | 免费 | 部分 Skill 免费 |

### 9.1 推荐的使用顺序

```
Markdown 论文
    ↓
  Pandoc → thesis.docx        （格式转换）
    ↓
  Lark-Formatter              （快速初步排版）
    ↓  ↓
    │  人工大量修改内容         （★ 最重要！）
    ↓  ↓
  WorkBuddy                   （AI 精细检查 + 修bug）
    ↓
  thesis_final.docx           （最终版 ✓）
```

---

## 10. 常见问题

### Q: WorkBuddy 和"小龙虾"是什么关系？

**A:** "小龙虾"是 WorkBuddy 的内部昵称/代号，两者指的是同一个产品。英文名叫 WorkBuddy，中文常称小龙虾。

### Q: Paper Check Skill 是免费的吗？

**A:** 请以 Skill 下载页面 (https://clawhub.ai/sashavegal/paper-check) 的说明为准。部分 Skill 可能免费或有免费额度。

### Q: WorkBuddy 支持哪些格式的论文？

**A:** 主要支持 DOCX 格式（Word 文档）。如果学校要求 PDF 提交，建议先用 WorkBuddy 处理好 DOCX，再用 Word 导出为 PDF。

### Q: 格式规范文件必须是哪种格式？

**A:** 一般支持 DOCX、PDF、TXT 格式。PDF 是最常见的（因为学校发的规范通常是 PDF）。WorkBuddy 的 AI 能从 PDF 中提取文字内容来理解格式要求。

### Q: 排版后不满意怎么办？

**A:** 
1. WorkBuddy 会保留原文档，不会覆盖
2. 你可以用对比报告回退任何修改
3. 可以多次运行，逐步调整直到满意
4. 结合人工微调达到最佳效果

### Q: WorkBuddy 能替代人工校对吗？

**A:** 不能完全替代！WorkBuddy 能大幅减少机械性的格式调整工作，但最终还需要你自己通读检查，确保：
- 内容没有因排版被意外改动
- 所有格式确实符合学校要求
- 特殊情况（如导师额外要求）已处理

### Q: 有没有视频教程可以学习？

**A:** 有的！B站上有相关教程视频：

**【开源毕业论文一键排版工具 Lark-Formatter V0.2 LTS】**  
👉 https://b23.tv/aBf4B83

虽然这个视频主要讲 Lark-Formatter，但也涉及了整体论文排版的思路和流程，非常值得一看。

### Q: Skill 文件夹的名字必须是 "skill" 吗？

**A:** 以 WorkBuddy 当前的实际界面和提示为准。不同版本的约定可能有所不同。"skill" 是常见的默认名称，但如果界面提示用其他名字（如 ".workbuddy"、"skills"、"extensions" 等），以界面提示为准。

---

## 11. 总结

### 11.1 WorkBuddy 使用流程回顾

```
1. 下载安装 WorkBuddy
        ↓
2. 切换到 Claw 模式
        ↓
3. 从 ClawHub 下载 Paper Check Skill
        ↓
4. 组织文件结构：
   - skill/paper-check/     ← Skill 文件
   - thesis.docx            ← 论文（与 skill 平级！）
   - format-rules.pdf       ← 格式规范（与 skill 平级！）
        ↓
5. 打开工作文件夹
        ↓
6. 初始化 Skill → 加载论文 → 读取格式规范
        ↓
7. 执行自动排版/检查
        ↓
8. 查看结果 → 导出最终版
```

### 11.2 最佳实践Tips

1. **先用 Lark-Formatter 做初步排版**，再用 WorkBuddy 做精细调整
2. **保留原始文件的备份**，防止误操作
3. **仔细核对格式规范的解读**，确保 AI 理解无误
4. **利用对比报告**逐项确认修改
5. **最终一定要自己用 Word 打开检查一遍**

---

> 相关链接：
> - **Paper Check Skill 下载：** https://clawhub.ai/sashavegal/paper-check
> - **B站教程视频：** https://b23.tv/aBf4B83
> - **Lark-Formatter GitHub：** https://github.com/Alouetter/Lark-Formatter

---

---

## 文档导航

> **阅读进度：第 5 篇 / 共 6 篇**

### 阅读进度

| # | 文档 | 状态 |
|---|------|------|
| 1 | [README 主文档](../README.md#全部文档索引) | 已读完 |
| 2 | [01 Claude Code 配置](./01-claude-code-setup.md) | 已读完 |
| 3 | [02 CC Switch 配置](./02-cc-switch-guide.md) | 已读完 |
| 4 | [03 Pandoc 使用](./03-pandoc-usage.md) | 已读完 |
| **5** | **04 WorkBuddy 排版** | 当前阅读中 |
| 6 | [05 完整工作流](./05-workflow-guide.md) | 最后一篇 |

### 上一篇 / 下一篇

| 上一篇 | 下一篇 |
|:---:|:---:|
| [3 03 Pandoc 使用](./03-pandoc-usage.md) | [5 05 完整工作流](./05-workflow-guide.md) |

---

<p align="center">
  <strong>AI 帮你提效，才华属于你自己。</strong>
</p>
