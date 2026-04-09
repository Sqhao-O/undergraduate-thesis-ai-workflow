# 🎓 本科毕业论文 AI 辅助工作流（开源文档）

> **一套面向 AI 工具小白的完整工作流指南，帮助你用 AI 工具高效辅助完成本科毕业论文**

> ⚡ **这是快速上手教程！** 如需详细教程，点击 👉 <a href="#全部文档索引" style="display: inline-block; padding: 12px 28px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">📑 全部文档索引 </a>

---

## ⚠️ 学术诚信声明（必读）

### 🚨 重要警告

**本文档中AI 仅作辅助工具，不提倡、不支持任何形式的学术造假，使用者需严格遵守所在院校学术规范，一切违规使用导致的学术责任由使用者自行承担。**

- ✅ **AI 可以帮你做的：**
  - 梳理思路、整理文献综述框架
  - 代码编写与调试
  - 仿真/实验环境搭建
  - 论文格式排版
  - 语言润色和语法检查

- ❌ **AI 不能替你做的：**
  - **创新点和核心研究内容必须自己完成！**
  - 实验数据和结果必须真实可靠
  - 论文观点和分析必须是原创思考
  - 禁止使用 AI 代写整篇论文
  - 禁止伪造数据或引用

> 💡 **记住：毕业论文是你大学四年的总结，AI 只是你的助手，不是你的代笔者。**

---

## 📖 目录

- [基础概念讲解](#基础概念讲解)
- [环境配置](#环境配置)
- [核心工具介绍](#核心工具介绍)
- [完整工作流步骤](#完整工作流步骤)
- [快速开始](#快速开始)

---

## 基础概念讲解

### 🤖 大模型 vs Agent：有什么区别？

如果你是 AI 小白，这两个概念可能让你很困惑。让我用一个简单的例子解释：

#### 大语言模型（LLM / 大模型）

**就像一个超级聪明的"聊天机器人"。**

- 📌 **特点：** 只能对话，你问它答
- 📌 **能力：** 回答问题、写文章、翻译、总结
- 📌 **例子：** ChatGPT 对话框、Kimi 聊天窗口、通义千问
- 📌 **局限：** 它不能直接操作你的电脑文件，不能运行代码

```
你 → 提问 → 大模型 → 回答文字给你
```

#### AI Agent（智能体）

**就像一个"能干活的数字助手"。**

- 📌 **特点：** 不只是聊天，还能执行任务
- 📌 **能力：** 读写文件、运行命令、调用工具、搜索网络、多步推理
- 📌 **例子：** Claude Code、Kimi Agent、OpenCode
- 📌 **优势：** 你说"帮我写个 Python 程序"，它真的会创建文件并运行

```
你 → 下达任务 → Agent 思考 → 调用工具(读写文件/运行代码) → 完成任务 → 返回结果
```

#### 本工作流用到的角色分工

| 工具 | 类型 | 在工作流中的角色 |
|------|------|------------------|
| Kimi | 大模型 | 写需求文档、头脑风暴 |
| Claude Code | Agent | 读工程文件、写代码、跑仿真 |
| WorkBuddy | Agent | 论文格式精细化排版 |

---

## 环境配置

### 第一步：安装 Claude Code

#### 前置依赖（必须先装！）

Claude Code 在 Windows 上运行**需要两个前置工具**，请按顺序安装：

| 顺序 | 工具 | 是否必须 | 下载地址 | 用途 |
|------|------|---------|----------|------|
| **1️⃣** | **Git for Windows** | ✅ 必须装 | https://git-scm.com/downloads/win | Claude Code 内部使用 Git Bash 执行命令 |
| **2️⃣** | **Node.js** | ✅ 必须装 | https://nodejs.org/ | Claude Code 的运行环境 |

> ⚠️ **Windows 用户特别注意：没有 Git，Claude Code 根本跑不起来！**  
> <a href="docs/01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 查看完整安装教程 </a>

#### 用 npm 安装 Claude Code

打开终端（命令提示符 / PowerShell），输入：

```bash
npm install -g @anthropic-ai/claude-code
```

> 💡 **什么是 npm？** npm 是 Node.js 自带的包管理器，相当于一个"应用商店"，用来安装各种开发工具。安装 Node.js 后就自动有了。

#### 验证所有工具安装成功

打开终端，**依次运行以下命令**：

```bash
# ① 验证 Git（Windows 必装！）
git --version
# 预期输出：git version 2.x.x

# ② 验证 Node.js
node --version
# 预期输出：v20.x.x 或 v18.x.x

# ③ 验证 Claude Code
claude --version
# 预期输出：@anthropic-ai/claude-code/1.0.12 ...
```

> 🎉 如果三条命令都显示版本号，说明环境配置完成！

> 💡 **详细安装教程和问题排查 →** <a href="docs/01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 查看完整教程 </a>

---

### 第二步：终端/命令行基础操作

很多工具需要在**终端**中操作。别被吓到，其实很简单！

#### 如何打开终端

**Windows 系统：**
- 方法一：按 `Win + R`，输入 `powershell`，回车
- 方法二：在文件夹地址栏输入 `powershell`，回车
- 方法三：右键点击"开始菜单"，选择"Windows PowerShell"

#### 常用命令速查

| 操作 | 命令 | 说明 |
|------|------|------|
| 切换到 D 盘 | `d:` | 从 C 盘切换到 D 盘 |
| 进入文件夹 | `cd 文件夹名` | 进入指定目录 |
| 返回上级目录 | `cd ..` | 返回上一级 |
| 查看当前目录内容 | `dir` 或 `ls` | 列出文件和文件夹 |
| 清屏 | `cls` 或 `clear` | 清空屏幕内容 |
| 退出当前程序 | `Ctrl + C` | 强制终止 |

#### 实操示例：进入桌面上的项目文件夹

```bash
# 1. 切换到 D 盘
d:

# 2. 进入桌面（假设用户名是 LENOVO）
cd Users\LENOVO\Desktop

# 3. 进入你的项目文件夹
cd 你的项目名

# 或者一行搞定：
cd d:\Users\LENOVO\Desktop\你的项目名
```

---

### 第三步：跳过 Claude Code 登录（可选）

如果你暂时没有 Anthropic 账号或不想登录，可以用这个方法跳过初始设置：

1. 打开文件资源管理器
2. 进入 `C:\Users\你的用户名\` 目录（例如 `C:\Users\LENOVO\`）
3. 找到 `.claude.json` 文件（注意前面有个点，这是隐藏文件）
   - 💡 **看不到隐藏文件？** 点击文件资源管理器顶部"查看"选项卡 → 勾选"隐藏的项目"
4. **右键点击 `.claude.json`** → 选择"打开方式" → 选择"记事本"
5. 你会看到类似这样的内容：

```json
{
  "changelogLastFetched": 1775491529999
}
```

6. **修改方法：**
   - 在最后一行 `{` 后面的内容末尾添加英文逗号 `,`
   - 然后新起一行添加：`"hasCompletedOnboarding": true`
   - 修改后应该是这样：

```json
{
  "changelogLastFetched": 1775491529999,
  "hasCompletedOnboarding": true
}
```

7. 按 `Ctrl + S` 保存文件，关闭记事本

> ⚠️ 注意：JSON 格式非常严格，必须使用**英文标点符号**，中文逗号或引号会导致错误！

---

## 核心工具介绍

### 1. CC Switch — 配置管理神器

**GitHub 仓库：** https://github.com/farion1231/cc-switch

CC Switch 是一个跨平台的桌面端 All-in-One 助手工具，专门用于管理多个 AI 编程工具的配置。

#### 支持管理的工具（共 5 个）

| 工具 | 说明 |
|------|------|
| Claude Code | Anthropic 的 AI 编程 Agent |
| Codex | OpenAI 的 CLI 编程工具 |
| OpenCode | 开源的 AI 编程终端 |
| OpenClaw | AI Agent Gateway 网关 |
| Gemini CLI | Google 的 AI 编程工具 |

#### 主要功能

- ➕ **添加 Provider：** 支持 Anthropic、OpenAI、Kimi、Minimax 等多种 API 服务商
- 🔀 **一键切换 API 配置：** 快速在不同的 API Key 之间切换
- 🛠️ **管理 MCP 服务器：** 配置 Model Context Protocol 服务扩展
- 📦 **管理 Skills：** 管理 AI 工具的技能插件
- 🖥️ **系统托盘常驻：** 最小化到系统托盘，随时快速切换

#### 支持的系统

- Windows 10+
- macOS 12+
- Ubuntu 22.04+ / Debian 11+ / Fedora 34+

#### 详细配置教程

👉 <a href="docs/02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 查看详细配置教程 </a>

---

### 2. Pandoc — 文档转换利器

**GitHub 仓库：** https://github.com/jgm/pandoc （由 John MacFarlane 开发）

Pandoc 是一个通用的文档转换工具，被称为"文档转换界的瑞士军刀"。

#### 核心功能

将 **Markdown 格式**的论文转换为 **DOCX 格式**（Word 文档），这是论文提交的标准格式。

#### 基本命令

```bash
# 验证安装
pandoc --version

# 基本转换
pandoc input.md -o output.docx

# 使用 Word 模板（保持学校论文格式）
pandoc input.md -o output.docx --reference-doc=template.docx
```

#### 详细使用教程

👉 <a href="docs/03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 查看详细使用教程 </a>

---

### 3. Lark-Formatter — 论文排版工具

**GitHub 仓库：** https://github.com/Alouetter/Lark-Formatter

Lark-Formatter 是一款 DOCX 格式论文的一键排版工具，基于 PySide6 + python-docx 开发。

#### 核心功能

- 📝 **多级标题编号：** 自动处理一级、二级、三级标题
- 📐 **自动化格式调整：** 字体、字号、行距、页边距等
- 🖨️ **一键排版：** 加载 DOCX 文件后一键完成全部格式调整

#### 当前版本

0.2.1 Hotfix（基于 0.20 LTS）

#### 启动方式（Windows）

```bash
# 直接双击运行
start_app.bat
```

---

### 4. WorkBuddy（腾讯小龙虾）— 智能精细排版

**下载地址：** https://copilot.tencent.com/work/

WorkBuddy 是腾讯推出的 AI 助手平台，通过配置**论文智能排版 Skill**，可以对论文进行精细化的格式检查和自动修正。

#### Paper Check Skill

**Skill 下载地址：** https://clawhub.ai/sashavegal/paper-check

该 Skill 可以：
- 📄 读取学校的论文格式规范文档
- 🔍 自动检测论文中的格式问题
- 🛠️ 一键修复格式错误
- 📊 生成修改对比报告

#### 学习资源

**skill作者B站教程：** 【开源毕业论文一键排版工具 Lark-Formatter V0.2 LTS】
https://b23.tv/aBf4B83

#### 详细使用教程

👉 <a href="docs/05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 查看详细使用教程 </a>

---

## 完整工作流步骤

下面是从零开始完成本科毕业论文的完整流程：

### 📊 工作流总览

```
┌─────────────────┐     ┌─────────────────┐     ┌──────────────────┐
│  步骤一：需求    │ ──→ │  步骤二：开发    │ ──→ │  步骤三：论文初稿  │
│  文档编写       │     │  与仿真         │     │  Markdown编写    │
│                │     │                │     │                  │
│  工具:Kimi      │     │  工具:Claude Code │     │  工具:Markdown   │
└─────────────────┘     └─────────────────┘     └────────┬─────────┘
                                                         │
                                                         ↓
┌─────────────────┐     ┌─────────────────┐     ┌──────────────────┐
│  步骤六：最终    │ ←─ │  步骤五：精细    │ ←─ │  步骤四：格式转换  │
│  排版与提交     │     │  排版           │     │  Markdown→DOCX   │
│                │     │                │     │                  │
│  人工校对+导出  │     │  工具:WorkBuddy  │     │  工具:Pandoc      │
└─────────────────┘     └─────────────────┘     └──────────────────┘
        ↑                                               │
        │                                               ↓
┌─────────────────┐                           ┌──────────────────┐
│  步骤七：人工    │                           │  步骤4.5：大量修改 │
│  完善内容       │                           │  内容补充完善     │
│                │                           │                  │
│  自己写！自己写！ │                           │  工具:Word + 人工 │
└─────────────────┘                           └────────┬─────────┘
                                                       │
         ┌─────────────────────────────────────────────┘
         ↓
┌─────────────────┐
│  步骤5a：初步排版 │
│                │
│  工具:Lark-     │
│  Formatter     │
└────────┬─────────┘
         │
         ↓ （回到步骤五）
```

### 🔧 详细步骤说明

#### 步骤一：用 Kimi Agent 编写需求文档

1. 打开下载好的 Kimi 客户端
2. 切换到 **Agent 模式**（免费版限次数）
3. 告诉 Kimi 你的毕业论文题目和要求
4. 让它帮你整理成一份**结构化的 Markdown 需求文档**
5. 包含：研究背景、技术路线、功能模块、预期成果等
6. 把需求文档放入你的项目文件夹内

#### 步骤二：用 Claude Code 进行开发与仿真

1. 打开终端，进入你的项目文件夹
2. 启动 Claude Code：`claude`
3. 让它读取项目文件夹内的需求文档和工程文件、编写代码、运行调试

##### Claude Code 常用指令

| 指令 | 作用 |
|------|------|
| `/init` | 初始化项目，了解项目结构 |
| `/clear` 或 `Ctrl + C` | 清空当前上下文，重新开始 |
| `/compact` | 压缩上下文，保留关键信息 |
| `/help` | 查看所有可用指令 |
| `/quit` 或 `exit` | 退出 Claude Code |

#### 步骤三：编写 Markdown 格式的论文初稿

1. 使用 Claude Code 根据整个工程文件编写 Markdown 格式的论文初稿
2. 使用 VS Code 查看文档并进行修改
3. 再回到第一步循环操作直到初稿完成

#### 步骤四：用 Pandoc 将 Markdown 转换为 DOCX

```bash
pandoc thesis.md -o thesis.docx --reference-doc=school_template.docx
```

> 💡 如果有学校的 Word 模板，一定要用 `--reference-doc` 参数，可以保持一致的字体和样式。

#### 步骤 4.5：人工大量修改完善（⭐ 关键步骤）

**这一步是最重要的！你需要：**

- ✅ 补充自己的分析和见解
- ✅ 用自己的话重写 AI 生成的内容
- ✅ 添加真实的实验数据和研究结果
- ✅ 确保所有引用都真实存在
- ✅ 检查逻辑连贯性
- ✅ 让论文体现你自己的思考

#### 步骤五：用 Lark-Formatter 初步排版

1. 下载并解压 Lark-Formatter
2. 双击 `start_app.bat` 启动程序
3. 加载你的 thesis.docx 文件
4. 点击"一键排版"
5. 导出排好版的文档

#### 步骤六：用 WorkBuddy 精细化排版

1. 在 WorkBuddy 中加载 Paper Check Skill
2. 放入论文文件和学校的格式规范要求
3. 让 AI 检测并修复格式问题
4. 生成对比报告，确认所有格式正确

#### 步骤七：最终人工校对与提交

- 📖 通读全文，检查错别字
- 📊 确认图表编号和引用
- 🔗 检查参考文献格式
- 📄 按照学校要求导出 PDF
- 🏫 提交！

---

## 快速开始

### 最小化起步方案（3 步装完环境 + 验证）

如果你觉得上面的步骤太多，从这里开始就行：

#### 第一步：安装 Git（Windows 必装！）

1. 打开浏览器访问：**https://git-scm.com/downloads/win**
2. 下载 **64-bit Git for Windows Setup**
3. 双击运行安装程序，一路点 **Next**（注意 PATH 选项选第二个：让第三方软件也能用 Git）
4. 打开终端验证：

```bash
git --version
# 预期输出：git version 2.x.x
```

> 💡 详细安装教程 → <a href="docs/01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📖 Git 安装教程 →</a>

#### 第二步：安装 Node.js + Claude Code

```bash
# 1. 先装 Node.js（去官网下载安装包）
# https://nodejs.org/ → 下载 LTS 版本 → 一路 Next 安装

# 2. 再装 Claude Code
npm install -g @anthropic-ai/claude-code
```

#### 第三步：安装 Pandoc

1. 访问：**https://pandoc.org/installing.html**
2. 下载 Windows 安装包并运行
3. 终端验证：`pandoc --version`

#### ✅ 一站式验证（全部装完后跑一遍）

```bash
# ① Git
git --version          # git version 2.x.x

# ② Node.js + npm
node --version         # v20.x.x 或 v18.x.x+
npm --version          # 10.x.x

# ③ Claude Code
claude --version       # @anthropic-ai/claude-code/x.x.x

# ④ Pandoc
pandoc --version       # pandoc x.x.x
```

> 🎉 **5 条命令全部返回版本号 = 环境就绪，开干！**

#### 然后就可以开始了！

```bash
# 启动 Claude Code
claude
```

> 💡 **更多细节：** <a href="docs/02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">🔑 CC Switch 配置密钥 →</a> <a href="docs/04-workflow-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📋 完整工作流图解 →</a>

---

## 项目结构

```
.
├── README.md                    # 主文档（你正在看的这个）
├── CREDITS.md                   # 致谢与许可证清单
├── LICENSE                      # CC BY 4.0 许可证
└── docs/
    ├── 01-claude-code-setup.md  # Claude Code 详细配置教程
    ├── 02-cc-switch-guide.md    # CC Switch 配置密钥指南
    ├── 03-pandoc-usage.md       # Pandoc 安装与使用详解
    ├── 04-workflow-guide.md     # 完整工作流图解
    └── 05-workbuddy-guide.md    # WorkBuddy 排版教程
```

---

## 📜 许可证

本项目采用 **Creative Commons Attribution 4.0 International (CC BY 4.0)** 许可证发布。

详见 [LICENSE](LICENSE) 文件。

---

<p align="center">
  <strong>⚠️ 再次强调：AI 是工具，不是替代品。请诚实做人，认真做学问。</strong>
</p>

<p align="center">
  Made with ❤️ for 毕业生们
</p>

---

<a id="全部文档索引"></a>

## 📑 全部文档索引

### 🔗 快速跳转

| # | 文档 | 内容摘要 | 链接 |
|---|------|----------|------|
| **0** | **README.md** | 项目总览、基础概念、快速开始、工具介绍、工作流步骤 | ✅ **当前页面** |
| **1** | `01-claude-code-setup.md` | Git 安装 / Node.js 安装 / Claude Code 安装与验证 / 跳过登录 / 常用指令 | <a href="./docs/01-claude-code-setup.md" style="display: inline-block; padding: 10px 20px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 14px;">📖 开始阅读 →</a> |
| **2** | `02-cc-switch-guide.md` | CC Switch 下载安装 / 添加 Provider / 配置 API 密钥 / MCP 管理 | <a href="./docs/02-cc-switch-guide.md" style="display: inline-block; padding: 10px 20px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 14px;">📖 开始阅读 →</a> |
| **3** | `03-pandoc-usage.md` | Pandoc 安装验证 / 支持格式列表 / 转换命令 / Word模板使用 / 中文处理 | <a href="./docs/03-pandoc-usage.md" style="display: inline-block; padding: 10px 20px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 14px;">📖 开始阅读 →</a> |
| **4** | `04-workflow-guide.md` | 完整工作流 8 阶段图解 / Markdown写作规范 / 时间规划建议 | <a href="./docs/04-workflow-guide.md" style="display: inline-block; padding: 10px 20px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 14px;">📖 开始阅读 →</a> |
| **5** | `05-workbuddy-guide.md` | WorkBuddy 安装 / Paper Check Skill / 自动排版实战 / 对比报告 | <a href="./docs/05-workbuddy-guide.md" style="display: inline-block; padding: 10px 20px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 14px;">📖 开始阅读 →</a> |

---

### 🚀 开始阅读

<p align="center">
  <a href="./docs/01-claude-code-setup.md" style="display: inline-block; padding: 12px 28px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">
    ➡️ 开始阅读第1篇：Claude Code 配置教程 →
  </a>
</p>

> 💡 **提示：** 每个文档的末尾都有「上一篇 / 下一篇」按钮，读完一篇直接点下一篇即可继续！
