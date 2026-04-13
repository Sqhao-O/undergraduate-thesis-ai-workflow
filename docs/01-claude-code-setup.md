# 01 - Claude Code 详细配置教程

> **适用人群：** 从未使用过 Claude Code 的初学者
> **预计耗时：** 20-30 分钟

> 返回 <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">README 主文档</a> | 如需概览和快速开始，点击链接

---

## 目录

1. [Claude Code 是什么？](#claude-code-是什么)
2. [系统要求与前置依赖](#系统要求与前置依赖)
3. [安装 Git for Windows](#安装-git-for-windows)
4. [安装 Node.js](#安装-nodejs)
5. [安装 Claude Code](#安装-claude-code)
6. [验证安装成功](#验证安装成功)
7. [首次启动与登录（可选）](#首次启动与登录可选)
8. [跳过登录的方法](#跳过登录的方法)
9. [Claude Code Skills 系统](#claude-code-skills-系统)
10. [Claude Code 常用指令大全](#claude-code-常用指令大全)
11. [基础使用示例](#基础使用示例)
12. [参考资源](#参考资源)

---

## 1. Claude Code 是什么？

**Claude Code** 是 Anthropic 公司推出的一款 **AI 编程 Agent（智能体）**。它运行在终端（命令行）中，可以通过自然语言对话来：

- 读取和理解你的项目代码
- 创建、修改、删除文件
- 执行终端命令（编译、运行、测试等）
- 搜索和替换代码
- 调试和修复 Bug
- 解释复杂代码逻辑

### 1.1 与普通聊天 AI 的区别

| 特性 | 普通 AI 聊天 | Claude Code |
|------|-------------|-------------|
| 运行环境 | 浏览器 / App | 终端（命令行） |
| 能否读文件 | 需要手动粘贴 | 自动读取整个项目 |
| 能否写文件 | 只能输出文字 | 直接创建/修改文件 |
| 能否运行命令 | 不能 | 可以执行任何命令 |
| 适用场景 | 问问题、聊思路 | 写代码、做项目 |

---

## 2. 系统要求与前置依赖

> **参考来源：** [Claude Code 官方文档 - 高级设置](https://code.claude.com/docs/zh-CN/setup) | [2.1 系统要求与环境准备](https://claudecode.tangshuang.net/tutorial/2.1%20%E7%B3%BB%E7%BB%9F%E8%A6%81%E6%B1%82%E4%B8%8E%E7%8E%AF%E5%A2%83%E5%87%86%E5%A4%87)

### 2.1 完整的系统要求

| 项目 | 要求 |
|------|------|
| **操作系统** | Windows 10 (版本 1809 / build 17763) 及以上，**64位系统** |
| **内存 (RAM)** | 4 GB 以上 |
| **网络** | 需要能访问 API 服务（或配置代理） |
| **Shell** | PowerShell、CMD 或 Git Bash |

### 2.2 前置依赖清单（必须全部安装！）

在安装 Claude Code 之前，你**必须**先安装以下工具：

| # | 工具 | 是否必须 | 用途 | 安装顺序 |
|---|------|---------|------|----------|
| 1 | **Git for Windows** | **Windows 必装** | Claude Code 内部使用 Git Bash 运行命令 | **最先安装** |
| 2 | **Node.js** | 必须安装 | Claude Code 的运行环境（npm 安装方式需要） | 第二个安装 |
| 3 | Claude Code | 目标工具 | AI 编程 Agent | 最后安装 |

### 2.3 为什么 Windows 用户必须装 Git？

根据 [Claude Code 官方文档](https://code.claude.com/docs/zh-CN/setup) 的说明：

> **"Windows 上的 Claude Code 需要 Git for Windows 或 WSL。Claude Code 在内部使用 Git Bash 来运行命令。"**

简单来说：**没有 Git，Claude Code 在 Windows 上根本跑不起来。**

---

## 3. 安装 Git for Windows

这是安装 Claude Code 的**第一步**，请务必完成！

### 3.1 步骤一：下载 Git 安装包

1. 打开浏览器，访问 Git 官方下载页面：

   👉 **https://git-scm.com/downloads/win**

2. 页面会自动检测你的系统并推荐合适的版本
3. 点击 **64-bit Git for Windows Setup** （除非你是 32 位系统才选 32-bit）
4. 下载得到 `.exe` 安装包（如 `Git-2.x.x-64-bit.exe`）

> 什么是 Git？
> Git 是一个版本控制工具，程序员用它来管理代码的历史版本。Claude Code 内部依赖 Git 来执行命令行操作，所以即使你不打算用 Git 管理代码版本，也必须安装它。

### 3.2 步骤二：运行安装程序

1. 双击下载的 `.exe` 文件
2. 如果弹出用户账户控制提示，点击 **「是」**
3. 出现安装向导后，**大部分选项直接点 Next（下一步）即可**
4. 以下几处需要注意的选项（其他保持默认）：

#### 3.2.1 关键选项说明

```
第 1 步：许可证协议 → Next
第 2 步：选择安装位置 → 默认即可 → Next
第 3 步：选择组件 → 全部默认勾选 → Next
第 4 步：开始菜单文件夹名 → 默认 "Git" → Next

第 5 步：选择默认编辑器
   → 选择 "Vim"（默认）
   → 如果你不会 Vim，也可以选 "Notepad"
   → 不影响后续使用 → Next

第 6 步：决定初始化新仓库(仓库)的分支名称
   → 保持默认 "Let Git decide"（会使用 main 分支）→ Next

第 7 步：调整你的 PATH 环境
   → 推荐选择第二个选项：
     "Git from the command line and also from 3rd-party software"
     （从命令行以及第三方软件中使用 Git）
   → 这样 Git 命令在 PowerShell 中也能直接使用 → Next

第 8 步：选择 SSH 执行文件 → 默认 → Next
第 9 步：选择 HTTPS 后端传输 → 默认 → Next
第 10 步：配置行尾符号转换
    → 推荐：第一个选项
      "Checkout Windows-style, commit Unix-style line endings"
      （Windows 风格换行检出，Unix 风格换行提交）→ Next
第 11~15 步：全部默认 → Next ... → Install
```

> 最关键的是第 7 步（PATH 配置），务必选择让第三方软件也能使用 Git！

### 3.3 步骤三：验证 Git 安装成功

打开终端（PowerShell），输入：

```bash
git --version
```

**预期输出：**

```
git version 2.47.1
```

> 如果看到 `git version x.xx.x` 格式的版本号，说明 Git 安装成功！

### 3.4 步骤四：验证 Git 路径可用

再输入以下命令，确认 Git 已加入系统 PATH（Claude Code 需要找到 Git Bash）：

```bash
where git
```

**预期输出（类似）：**

```
C:\Program Files\Git\cmd\git.exe
```

只要能看到路径就说明 PATH 配置正确。

> 如果 `where` 命令不可用，也可以用 PowerShell 的 `Get-Command git` 替代。

### 3.5 Git 安装失败排查

如果安装后 `git --version` 提示找不到：

| 尝试顺序 | 操作 |
|---------|------|
| 1 | **关闭终端，重新打开一个新窗口**再试 |
| 2 | **重启电脑**后再试 |
| 3 | 手动添加 PATH（管理员 PowerShell 运行）：<br>`[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\cmd", "User")`<br>然后重启终端 |

---

## 你需要了解的基本概念

在继续安装 Node.js 之前，请确认你已经了解以下内容（详见 README.md 中的「终端基础操作」部分）：

- [ ] 如何打开终端（PowerShell / 命令提示符）
- [ ] 基本命令：`cd`、`dir`、`d:` 切换磁盘
- [ ] 如何用记事本编辑文件

---

## 4. 安装 Node.js

Claude Code 基于 Node.js 开发，所以需要先安装 Node.js。

### 4.1 步骤一：下载安装包

1. 打开浏览器，访问 **https://nodejs.org/**
2. 点击页面上方醒目的 **LTS** 版本下载按钮（推荐长期支持版）
   - LTS = Long Term Support（长期支持版本），更稳定
3. 下载得到 `.msi` 安装包（Windows 系统）

### 4.2 步骤二：运行安装程序

1. 双击下载的 `.msi` 文件
2. 点击 **Next**（下一步）
3. 勾选接受许可协议，点击 **Next**
4. 保持默认安装路径，点击 **Next**
5. 保持默认的组件选择，点击 **Next**
6. 点击 **Install**（开始安装）
7. 等待安装完成，点击 **Finish**

### 4.2 步骤三：验证 Node.js 安装

打开终端（PowerShell），输入：

```bash
node --version
```

如果看到类似 `v20.x.x` 或 `v18.x.x` 的版本号，说明 Node.js 安装成功！

再验证 npm（包管理器）：

```bash
npm --version
```

应该看到类似 `10.x.x` 的版本号。

> 如果提示"不是内部或外部命令"：
> - 关闭终端，重新打开一个新窗口再试
> - 如果还不行，重启电脑后再试

---

## 5. 安装 Claude Code

Node.js 和 npm 都就绪后，就可以安装 Claude Code 了。

### 5.1 安装命令

在终端中输入：

```bash
npm install -g @anthropic-ai/claude-code
```

#### 命令解释

| 部分 | 含义 |
|------|------|
| `npm` | Node.js 的包管理器 |
| `install` | 安装命令 |
| `-g` | global，表示全局安装（在任何目录都能使用） |
| `@anthropic-ai/claude-code` | Claude Code 的包名 |

### 5.2 安装过程可能出现的提示

安装过程中 npm 可能会询问一些问题：

- **`Do you want to continue? (y)` → 输入 `y` 回车**
- 如果有权限警告，可以忽略（或用管理员身份运行 PowerShell）

### 5.3 安装完成标志

当终端回到正常提示符状态（没有错误信息），说明安装完成了！

---

## 6. 验证安装成功

完成所有安装后，请在终端中**依次运行以下三条验证命令**，确保每个工具都正确安装：

### 6.1 ① 验证 Git

```bash
git --version
```

预期输出：`git version 2.x.x`

### 6.2 ② 验证 Node.js

```bash
node --version
```

预期输出：`v20.x.x` 或 `v18.x.x` 或更高

再验证 npm：

```bash
npm --version
```

预期输出：`10.x.x` 或类似版本号

### 6.3 ③ 验证 Claude Code

```bash
claude --version
```

预期输出：

```
@anthropic-ai/claude-code/1.0.12 ...
```

### 6.4 全部通过检查表

| # | 命令 | 预期结果 | 通过？ |
|---|------|---------|--------|
| 1 | `git --version` | `git version 2.x.x` | ☐ |
| 2 | `node --version` | `v18.x.x` 或更高 | ☐ |
| 3 | `npm --version` | 版本号正常显示 | ☐ |
| 4 | `claude --version` | claude-code 版本号 | ☐ |

> 如果以上 4 条命令全部正常返回版本号，说明环境配置完美！可以开始使用 Claude Code 了！

> 如果任何一条报错：
> - `git` 找不到 → 回到上方「Git 安装失败排查」章节
> - `node` / `npm` 找不到 → 关闭终端重开，或重启电脑
> - `claude` 找不到 → 确认 Node.js 和 npm 正常后重新运行安装命令

---

## 7. 首次启动与登录（可选）

### 7.1 方法一：官方登录（需要 Anthropic 账号）

如果你有 Anthropic 账号或 API Key：

1. 在终端输入：
   ```bash
   claude
   ```
2. 按照提示登录或输入 API Key
3. 登录后即可开始使用

### 7.2 方法二：使用第三方 API（推荐国内用户）

通过 CC Switch 配置其他 API 服务商（如 DeepSeek、MiniMax、Kimi 等），详见 <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">🔑 CC Switch 配置教程 →</a>。

---

## 8. 跳过登录的方法

如果你暂时不想登录，或者想先体验一下界面，可以用这个方法跳过初始设置向导。

### 8.1 操作步骤

#### 8.1.1 找到配置文件的存储位置

Claude Code 的配置文件存放在你的**用户主目录**下：

| 系统 | 路径 |
|------|------|
| Windows | `C:\Users\你的用户名\.claude.json` |
| macOS | `/Users/你的用户名/.claude.json` |
| Linux | `/home/你的用户名/.claude.json` |

以 Windows 为例（假设用户名是 LENOVO），路径就是：
```
C:\Users\LENOVO\.claude.json
```

#### 8.1.2 打开文件夹

**方法 A — 通过文件资源管理器：**

1. 按 `Win + E` 打开文件资源管理器
2. 在地址栏输入 `C:\Users\LENOVO`（换成你自己的用户名）
3. 按 Enter 进入文件夹

**方法 B — 通过终端：**

```bash
# 在 PowerShell 中输入：
explorer C:\Users\LENOVO
```

#### 8.1.3 显示隐藏文件

`.claude.json` 是一个**隐藏文件**（文件名以点开头），你需要先启用"显示隐藏文件"：

1. 在文件资源管理器中，点击顶部菜单栏的 **「查看」**选项卡
2. 找到 **「显示」** 区域
3. 勾选「隐藏的项目」

现在你应该能看到 `.claude.json` 文件了。

#### 8.1.4 用记事本编辑文件

1. **右键点击** `.claude.json`
2. 选择 **「打开方式」** → **「记事本」**
3. （如果没有"打开方式"选项，可以选择"打开方式"→"更多应用"→"记事本"）

你会看到类似这样的内容：

```json
{
  "lastOnboardingVersion": "1.0.0"
}
```

#### 8.1.5 修改文件内容

JSON 格式非常严格，请务必仔细操作！

**修改规则：**

1. 找到最后一行的 `}` 符号
2. 在它**前面的那行末尾**添加一个**英文逗号** `,`
3. 然后**新起一行**，添加以下内容：

```json
"hasCompletedOnboarding": true
```

**修改后的完整内容应该是这样：**

```json
{
  "changelogLastFetched": 177053969××××,
  "hasCompletedOnboarding": true
}
```

#### 8.1.6 保存并关闭

1. 按 `Ctrl + S` 保存（或点击"文件" → "保存"）
2. 关闭记事本

> 常见错误提醒：
> - 不要用中文逗号 `，`，必须是英文逗号 `,`
> - 不要漏掉引号 `"hasCompletedOnboarding"`
> - 不要多加或少加大括号 `{ }`
> - 如果你不确定是否改对，可以复制上面的示例直接覆盖原内容

#### 8.1.7 验证跳过成功

现在再次在终端输入 `claude`，应该会跳过登录向导，直接进入对话界面！

---

## 9. Claude Code Skills 系统

### 9.1 什么是 Skill？

Skill 是 Claude Code 的扩展功能，类似于手机 App。安装后可以通过 `/skills` 命令调用，扩展 Claude Code 的能力。

### 9.2 系统级 Skill vs 文件夹级 Skill

| 类型 | 存放位置 | 适用范围 |
|------|----------|----------|
| **系统级** | `~/.claude/skills/` | 所有项目都可以使用 |
| **文件夹级** | `.claude/skills/` | 仅当前项目可用 |

### 9.3 Skill 存放位置

| 系统 | 路径 |
|------|------|
| Windows | `C:\Users\<用户名>\.claude\skills\` |
| macOS / Linux | `~/.claude/skills/` |

配置文件位置：`C:\Users\<用户名>\.claude\settings.json`

### 9.4 下载和管理 Skill

在 Claude Code 中使用以下命令：

| 命令 | 说明 |
|------|------|
| `/skills list` | 查看已安装的 Skills |
| `/skills add <name>` | 添加指定 Skill |
| `/skills remove <name>` | 移除指定 Skill |
| `/skills update` | 更新所有 Skills |

### 9.5 搜索 Skill 的 Skill

使用 `/skills search <关键词>` 可以搜索可用的 Skills。

例如，搜索学术相关的 Skill：
```
> /skills search academic
```

### 9.6 本工作流推荐的 Skills

| Skill | 用途 | 调用方式 |
|-------|------|---------|
| brainstorming | 论文构思（阶段一） | Claude Code |
| academic-paper-reviewer | 论文评审润色（阶段五） | Claude Code |
| pptx | PPT 制作（阶段七） | Claude Code |
| pdf | PDF 处理（润色时） | Claude Code |
| docx | Word 文档处理（润色时） | Claude Code |

### 9.7 安装推荐的 Skills

```
/skills add brainstorming
/skills add academic-paper-reviewer
/skills add pptx
/skills add pdf
/skills add docx
```

安装后，每个 Skill 的详细使用方法会在工作流对应阶段介绍。

---

## 10. Claude Code 常用指令大全

进入 Claude Code 后（看到 `>` 提示符后），可以使用以下**斜杠指令**：

### 10.1 基础指令

| 指令 | 快捷键 | 说明 |
|------|--------|------|
| `/help` | — | 显示所有可用指令 |
| `/exit` | — | 退出 Claude Code |
| `/quit` | — | 同 `/exit` |

### 10.1.1 上下文管理

| 指令 | 说明 |
|------|------|
| `/clear` | 清空当前对话上下文，重新开始（保留项目上下文） |
| `/compact` | 压缩当前对话，保留关键信息，释放 token 空间 |
| `/clear conversation` | 仅清空对话记录 |

### 10.2 项目操作

| 指令 | 说明 |
|------|------|
| `/init` | 初始化/重新扫描当前项目结构 |
| `/init --no-git` | 初始化但不关联 Git |
| `/memory` | 查看 Claude Code 的记忆文件 |
| `/memory edit` | 编辑记忆文件（告诉 Claude Code 项目特定的规则） |

### 10.3 工具权限

| 指令 | 说明 |
|------|------|
| `/permissions` | 查看当前工具权限设置 |
| `/allow` | 允许某个操作自动执行（不再每次确认） |
| `/deny` | 禁止某个操作 |
| `/reset-permissions` | 重置所有权限设置 |

### 10.4 实用技巧

#### 10.4.1 技巧 1：让 Claude Code 记住项目规范

使用 `/memory edit` 可以编辑项目的"记忆"，比如：

```
本项目是一个本科毕业论文的仿真工程，
使用 Python 3.10，主要依赖 numpy、matplotlib。
代码注释使用中文。
```

这样 Claude Code 在后续对话中就会遵循这些规范。

#### 10.4.2 技巧 2：清空上下文重新开始

当你发现 Claude Code "忘记"了之前的约定，或者上下文太混乱时：

```
/clear
```

这会清空对话历史但保留项目文件信息，相当于"翻篇不翻书"。

#### 10.4.3 技巧 3：直接给任务而不是闲聊

不好的用法：
```
> 你好
> 我想写个程序
> 是关于图像处理的
> 用Python写
```

好的用法：
```
> 请帮我读取 src/main.py 文件，然后在其中实现一个图像灰度化函数，
  要求使用 OpenCV 库，函数名为 grayscale(image_path)，
  输入为图片路径，输出处理后的图片数组。
```

---

## 10.5 基础使用示例

### 示例 1：让 Claude Code 了解你的项目

```bash
# 1. 打开终端，进入你的项目文件夹
cd d:\Users\LENOVO\Desktop\my-thesis-project

# 2. 启动 Claude Code
claude

# 3. 进入后，输入：
> 请帮我分析一下这个项目的结构，告诉我每个文件夹的作用
```

### 示例 2：让 Claude Code 写代码

```
> 请在 src 目录下创建一个名为 simulator.py 的文件，
  实现一个简单的队列模拟器，包含入队、出队、查看长度三个功能。
```

### 示例 3：让 Claude Code 调试代码

```
> 运行 python test.py 后报错了，错误信息是 "NameError: name 'x' is not defined"，
  请帮我看一下原因并修复。
```

### 示例 4：读取需求文档并执行

```
> 请读取 requirements.md 文件，然后按照其中的需求逐步实现功能。
```

---

## 12. 参考资源

以下是学习 Claude Code 的优质资源：

### 12.1 官方资源

- **Claude Code 官方文档：** https://docs.anthropic.com/en/docs/claude-code
- **Anthropic 官网：** https://www.anthropic.com/

### 12.2 中文教程

| 教程 | 链接 | 说明 |
|------|------|------|
| Claude Code 中文指南 | https://claudecode.tangshuang.net/ | 非常详尽的中文入门指南，从安装到高级技巧全覆盖 |
| Claude Code 实战 | https://cholf5.com/claude-code-in-action/index.html | 实战案例导向的教程，适合边学边做 |

### 12.3 社区资源

- **Reddit：** r/ClaudeCode
- **Discord：** Anthropic Discord 服务器
- **GitHub Discussions：** https://github.com/anthropics/claude-code/discussions

---

## 常见问题

### Q: 安装时报错 "EACCES permission denied"

**A:** 这是权限问题。解决方法：
- Windows：以管理员身份运行 PowerShell
- macOS/Linux：在命令前加 `sudo`

### Q: `git` 命令找不到 / 不是内部或外部命令

**A:** 说明 Git 没有正确加入系统 PATH。按顺序尝试：
1. 关闭终端，重新打开新窗口再试 `git --version`
2. 重启电脑后再试
3. 如果仍不行，重新安装 Git 并确保第 7 步选择了正确的 PATH 选项（见上方「步骤二」说明）
4. 手动添加 PATH：
   ```powershell
   [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\cmd", "User")
   ```
   然后重启终端。

### Q: 不装 Git 可以用 Claude Code 吗？

**A:** Windows 上不可以。根据 [Claude Code 官方文档](https://code.claude.com/docs/zh-CN/setup) 明确要求："Windows 上的 Claude Code 需要 Git for Windows 或 WSL"。Claude Code 内部使用 Git Bash 来执行命令，没有 Git 就无法运行。macOS/Linux 用户通常系统自带 Git，一般不需要额外安装。

### Q: Git 和 GitHub 是一回事吗？

**A:** 不是。
- **Git** = 版本控制工具（装在本地电脑上的程序）
- **GitHub** = 代码托管网站（存代码的云端平台）
- 我们这里只需要装 **Git**，**不需要注册 GitHub 账号**

### Q: `claude` 命令找不到

**A:** 可能的原因：
1. Node.js 没有正确安装 → 重新安装 Node.js
2. npm 全局路径没有加入 PATH → 重启终端
3. Claude Code 安装失败 → 重新运行安装命令

---

> 下一步：学习如何使用 CC Switch 配置 API 密钥 → <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">CC Switch 配置教程</a>

---

## 文档导航

> **阅读进度：第 2 篇 / 共 6 篇**

### 阅读进度

| # | 文档 | 状态 |
|---|------|------|
| 1 | <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">README 主文档</a> | 已读完 |
| **2** | **01 Claude Code 配置** | 当前阅读中 |
| 3 | <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">02 CC Switch 配置</a> | 接下来读 |
| 4 | <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">03 Pandoc 使用</a> | 待阅读 |
| 5 | <a href="./04-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">04 WorkBuddy 排版</a> | 待阅读 |
| 6 | <a href="./05-workflow-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">05 完整工作流</a> | 待阅读 |

### 上一篇 / 下一篇

| 上一篇 | 下一篇 |
|:---:|:---:|
| <a href="../README.md" style="display: inline-block; padding: 6px 16px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">1 README 主文档</a> | <a href="./02-cc-switch-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #0969da; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">3  CC Switch 配置</a> |
