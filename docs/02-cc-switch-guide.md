# 02 - CC Switch 配置密钥详细指南

> 📌 **适用人群：** 需要管理多个 AI 编程工具 API 配置的用户  
> ⏱️ **预计耗时：** 15-20 分钟

> 🔙 **返回** <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 12px;">📑 README 主文档 </a> | 如需概览和快速开始，点击链接

---

## 目录

1. [CC Switch 是什么？](#cc-switch-是什么)
2. [下载与安装](#下载与安装)
3. [添加 Provider（API 服务商）](#添加-providerapi-服务商)
4. [配置 API 密钥](#配置-api-密钥)
5. [切换 API 配置](#切换-api-配置)
6. [管理 MCP 服务器](#管理-mcp-服务器)
7. [管理 Skills](#管理-skills)
8. [常见问题](#常见问题)

---

## CC Switch 是什么？

**CC Switch** 是一款跨平台的桌面端 **All-in-One 配置管理助手**，专门用于统一管理多个 AI 编程工具的配置。

### 核心价值

在没有 CC Switch 之前，如果你想：
- 用 Claude Code 写代码 → 需要手动配 API Key
- 用 Codex 做另一个项目 → 又要换一次 Key
- 用 Gemini CLI 试试 → 再配一遍...

**有了 CC Switch：**
- 所有工具的配置集中在一个界面
- 一键切换不同的 API 配置
- 系统托盘常驻，随时切换
- 支持 MCP 服务器和 Skills 管理

### 支持管理的工具（5 个）
**这里我们仅适用Claude Code**

| # | 工具 | 开发商 | 说明 |
|---|------|--------|------|
| 1 | **Claude Code** | Anthropic | AI 编程 Agent |
| 2 | **Codex** | OpenAI | CLI 编程工具 |
| 3 | **Gemini CLI** | Google | Google 的 AI 编程终端 |
| 4 | **OpenCode** | 社区开源 | 开源 AI 编程终端 |
| 5 | **OpenClaw** | 社区开源 | AI 编程助手 |

---

## 下载与安装

### GitHub Releases 下载

1. 打开浏览器，访问 CC Switch 的 GitHub 仓库：

   👉 **https://github.com/farion1231/cc-switch**

2. 点击页面右侧的 **Releases** 区域（或点击 "Code" 下拉菜单 → 选择 "Releases"）

3. 找到最新版本的 Release，根据你的系统选择对应的安装包：

   | 系统 | 下载文件 |
   |------|----------|
   | Windows | `.exe` 安装包 或 `.zip` 压缩包 |
   | macOS | `.dmg` 安装包 |

4. 下载完成后运行安装程序

### 系统兼容性

| 操作系统 | 最低版本要求 |
|----------|-------------|
| Windows | Windows 10 及以上 |
| macOS | macOS 12 (Monterey) 及以上 |
| Ubuntu | 22.04 LTS 及以上 |
| Debian | 11 (Bullseye) 及以上 |
| Fedora | 34 及以上 |

---

## 添加 Provider（API 服务商）

Provider 就是 API 服务的提供商，比如 Anthropic、OpenAI、月之暗面（ Kimi ）、DeepSeek 等。

### 步骤一：点击"添加 Provider"

在主界面的 Providers 区域，点击 **「+ 添加新 Provider」** 或 **「Add Provider」** 按钮。

### 步骤二：选择 Provider 类型

CC Switch 通常会提供以下预设选项（具体以实际界面为准）：

| Provider | 适用场景 |
|-----------|---------|
| **Anthropic** | Claude Code 官方 API |
| **OpenAI** | Codex / GPT 系列 |
| **Google** | Gemini 系列 |
| **DeepSeek** | 国产大模型，性价比高 |
| **MiniMax** | 推荐 Coding Plan |
| **Kimi (Moonshot)** | 国内常用，推荐会员 coding 额度 |
| **Custom / 自定义** | 其他兼容 OpenAI API 格式的服务 |

### 步骤三：填写配置信息

选择 Provider 后，需要填写以下关键信息：

#### 必填项

| 字段 | 说明 | 示例 |
|------|------|------|
| **名称** | 给这个配置起个名字 | "我的 DeepSeek" |
| **API Key / 密钥** | 你的 API 密钥 | `sk-xxxxxxxxxxxx` |
| **API Base URL** | API 接口地址（部分需要） | `https://api.deepseek.com` |

#### 可选项

| 字段 | 说明 |
|------|------|
| **Model / 模型** | 选择使用的模型版本 |
| **备注** | 给自己看的说明文字 |

---

## 配置 API 密钥

这是最关键的一步！你需要从各个 API 服务商那里获取密钥。

### 获取 API 密钥的方法

#### 1. MiniMax Coding Plan（推荐）

> MiniMax 提供性价比很高的 coding 额度方案。

1. 访问 MiniMax 开放平台：https://platform.minimaxi.com/
2. 注册 / 登录账号
3. 进入「API 密钥」或「API Keys」页面
4. 点击「创建密钥」
5. 复制生成的 API Key（格式类似 `eyJ...` 或 `sk-...`）
6. **⚠️ 立即保存好密钥！关闭页面后可能无法再次查看完整密钥**

#### 2. Kimi 会员 coding 额度（国内用户推荐）

> Kimi（月之暗面）提供便捷的 coding 额度。

方案1：（推荐）
1. 访问 Kimi 官网 www.kimi.com 或下载客户端
2. 注册 / 登录账号
3. 开通 Kimi 会员（获取 coding 额度和 Kimi Agent 额度）
4. 进入 https://www.kimi.com/code 进入控制台页面创建密钥
5. 复制 API Key

方案2：访问 Kimi 开放平台：https://platform.moonshot.cn/ 进行充值和获取 API Key


#### 3. DeepSeek（高性价比备选）

1. 访问 https://platform.deepseek.com/
2. 注册并登录
3. 进入 API Keys 页面
4. 创建新的 API Key

#### 4. Anthropic 官方（原版体验）

1. 访问 https://console.anthropic.com/
2. 注册账号（需要海外手机号或邮箱）
3. 进入 API Keys 页面
4. 创建 Key 并复制

### 在 CC Switch 中填入密钥

1. 回到 CC Switch 的 Claude 界面
2. 在对应 Provider 的 **API Key 输入框** 中粘贴你的密钥
3. 点击 **「添加」** 

### 测试连接是否成功

供应商添加成功后，CC Switch 会显示一个 **「测试模型」** 按钮：

1. 点击测试按钮
2. 如果显示 ✅ 连接成功 → 配置完成！
3. 如果显示 ❌ 失败 → 检查密钥是否正确、网络是否通畅

---

## 切换 API 配置

配置多个 Provider 后，你可以随时快速切换：

### 方法一：主界面切换

1. 打开 CC Switch 主窗口
2. 在 Providers 列表中，**单击**你想用的 Provider
3. 选中的 Provider 会高亮显示（或有选中标记）
4. 配置立即生效！

### 方法二：系统托盘快速切换（更方便）

1. 查看 Windows 任务栏右下角的**系统托盘区域**（时钟旁边）
2. 找到 CC Switch 图标
3. **右键点击**图标
4. 弹出快捷菜单，列出所有已配置的 Provider
5. 单击你想切换到的 Provider
6. 完成！

> 💡 这就是 CC Switch 的核心优势——不用打开任何配置文件、不用重启任何工具，一键切换！

---

## 管理 MCP 服务器

MCP（Model Context Protocol）是一种让 AI 工具能够调用外部服务和数据的协议。

### 什么是 MCP 服务器？

简单来说，MCP 服务器就像给 Claude Code 等 AI 工具装上了"插件"，让它能够：

- 🔍 搜索网络获取实时信息
- 📁 直接操作数据库
- 🛠️ 调用其他开发工具
- 📊 读取特定格式的数据文件

### 如何在 CC Switch 中管理 MCP 服务器

1. 在 CC Switch 主界面找到 **MCP Servers** 区域
2. 点击 **「添加」** 或 **「+」**
3. 填写 MCP 服务器的配置信息：
   - **名称：** 给这个服务起名（如 "web-search"）
   - **命令：** 启动命令（如 `npx`）
   - **参数：** 命令参数（如 `@modelcontextprotocol/server-brave-search`）
   - **环境变量：** 如需要的 API Key 等
4. 点击 **「保存」**
5. 对应的工具（如 Claude Code）下次启动时会自动加载这些 MCP 服务器

### 常用 MCP 服务器推荐

| MCP 服务器 | 功能 | 适用于 |
|------------|------|--------|
| `filesystem` | 文件系统操作 | 所有场景 |
| `brave-search` | 网络搜索 | 需要查资料时 |
| `github` | GitHub 操作 | 使用 GitHub 时 |
| `postgres` | 数据库操作 | 有数据库的项目 |

> 📖 MCP 是进阶功能，初学者可以先跳过这一步，等熟悉基础操作后再探索。

---

## 管理 Skills

Skills 是 AI 工具的"技能扩展"，类似于 MCP 但更偏向于预定义的工作流程。

### 在 CC Switch 中管理 Skills

1. 在主界面找到 **Skills** 区域
2. 可以查看当前已安装的 Skills 列表
3. 点击 **「添加 Skill」** 来导入新的 Skill
4. 或者启用/禁用已有的 Skills

### Skills 与 MCP 的区别

| 特征 | Skills | MCP Servers |
|------|--------|-------------|
| 性质 | 预定义的任务模板 | 外部服务接口 |
| 复杂度 | 相对简单 | 可复杂可简单 |
| 类比 | 手机 App | 手机外接设备 |
| 典型用途 | "帮我排版论文"、"检查代码风格" | "搜索数据库"、"读取文件" |

---

## 常见问题

### Q: CC Switch 是免费的吗？

**A:** 是的，CC Switch 是开源免费软件。但你使用的 API 服务（如 Anthropic、DeepSeek）本身是收费的——你付的是 API 调用费，不是 CC Switch 的费用。

### Q: API Key 安全吗？存在本地还是云端？

**A:** CC Switch 将配置存储在你的**本地电脑上**，不会上传到第三方服务器。但请注意保护好自己的电脑，不要把 API Key 分享给别人。

### Q: 为什么添加了 Provider 但 Claude Code 还是连不上？

**请按顺序排查：**

1. ✅ 确认 API Key 正确（没有多余空格）
2. ✅ 确认 Base URL 正确
3. ✅ 在 CC Switch 中选中了正确的 Provider
4. ✅ 重启 Claude Code（旧配置可能还在内存中）
5. ✅ 检查网络是否能访问该 API 服务

### Q: 可以同时配多个 Provider 吗？

**A:** 当然可以！这就是 CC Switch 的核心功能。你可以同时配置 Anthropic、Kimi、DeepSeek 等，然后随时一键切换。

### Q: 配置文件在哪里？想备份一下

**A:** CC Switch 的配置通常存储在用户的 AppData 目录下（Windows），具体路径可以在 CC Switch 设置中查看，或者导出配置进行备份。

---

> 📌 **相关链接：**
> - **CC Switch GitHub 仓库：** https://github.com/farion1231/cc-switch
> - **反馈 Issue：** 在 GitHub 仓库的 Issues 页面提交

---

## 📖 文档导航

> 📍 **当前位置：第 3 篇 / 共 6 篇**（含 README）

### 🔗 快速跳转

| ⬅️ **上一篇** | 🔵 **当前位置** | **下一篇 ➡️** |
|:---:|:---:|:---:|
| <a href="./01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📄 上一篇</a><br><small>Git + Node.js + Claude Code 安装</small> | **📗 02-cc-switch-guide.md**<br><small>CC Switch 配置 API 密钥与 Provider 管理</small> | <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #0969da; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📙 下一篇 →</a><br><small>Pandoc 文档转换详解</small> |

### 📑 全部文档索引

| # | 文档 | 状态 |
|---|------|------|
| 0 | <a href="../README.md#全部文档索引" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📄 README 主文档 →</a> | ✅ 已读完 |
| 1 | <a href="./01-claude-code-setup.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📘 开始阅读 →</a> | ✅ 已读完 |
| **2** | **📗 02-cc-switch-guide.md** | ✅ **当前阅读中** |
| 3 | <a href="./03-pandoc-usage.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📙 开始阅读 →</a> | ⬅️ 接下来读 |
| 4 | <a href="./04-workflow-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📕 开始阅读 →</a> | ☐ 待阅读 |
| 5 | <a href="./05-workbuddy-guide.md" style="display: inline-block; padding: 6px 16px; background-color: #2ea44f; color: white; text-decoration: none; border-radius: 4px; font-weight: bold;">📔 开始阅读 →</a> | ☐ 待阅读 |
