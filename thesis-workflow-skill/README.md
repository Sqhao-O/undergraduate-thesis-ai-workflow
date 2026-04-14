# Thesis Workflow Skill

> 毕业论文AI辅助工作流助手

## 功能介绍

这是一个Claude Code插件/Skill，帮助用户按照正确顺序完成毕业论文AI辅助工作流。

## 主要功能

- **阶段引导**：按阶段引导用户完成工作流
- **容错处理**：某一步失败不影响其他步骤
- **文档联动**：直接跳转对应章节

## 安装步骤

### 方法一：手动安装（推荐）

1. 下载或克隆本仓库
2. 将 `thesis-workflow-skill` 文件夹复制到 Claude Code 的 Skills 目录：
   ```
   C:\Users\<你的用户名>\.claude\skills\
   ```
   或 Mac/Linux:
   ```
   ~/.claude/skills/
   ```
3. 重启 Claude Code
4. 输入 `/thesis-workflow` 即可启动

### 方法二：使用命令行

在 Claude Code 中输入：
```
/skills add /path/to/thesis-workflow-skill
```

## 使用方法

### 启动工作流
```
/thesis-workflow
```
显示工作流概览，询问当前阶段。

### 查看阶段指导
```
/thesis-workflow guide 1    # 查看阶段一指导
/thesis-workflow guide 5    # 查看阶段五指导
/thesis-workflow help       # 显示帮助信息
```

### 检查项目状态
```
/thesis-workflow status
```
分析当前项目状态，给出下一步建议。

## 工作流阶段

| 阶段 | 内容 | AI辅助程度 |
|------|------|-----------|
| 阶段一 | 需求文档编写 | 高（Kimi Agent） |
| 阶段二 | 代码开发与仿真 | 高（Claude Code） |
| 阶段三 | 论文初稿Markdown | 中（AI辅助写作） |
| 阶段四 | 格式转换DOCX | 低（Pandoc自动） |
| 阶段五 | 内容完善 | **无AI（人工为主）** |
| 阶段六 | 初步排版 | 低（Lark-Formatter自动） |
| 阶段七 | 精细排版 | 中（WorkBuddy辅助） |
| 阶段八 | 最终校对 | **无AI（人工）** |

## 核心原则

- **以人为本**：AI只是辅助，人才是核心
- **渐进式推进**：按阶段推进，不要急于求成
- **容错设计**：某一步失败不影响整体

## 注意事项

- 定期备份重要文件
- 遵守学校论文格式要求

## 详细文档

详细使用说明请参考主项目文档：
- [主项目README](../README.md)
- [Claude Code配置](../docs/01-claude-code-setup.md)
- [Pandoc使用](../docs/03-pandoc-usage.md)
- [WorkBuddy排版](../docs/04-workbuddy-guide.md)
- [完整工作流](../docs/05-workflow-guide.md)

## License

MIT License
