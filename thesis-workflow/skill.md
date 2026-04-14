---
name: thesis-workflow
description: 毕业论文AI辅助工作流助手，按8个阶段引导完成论文撰写与排版
---

# Thesis Workflow Skill

> 毕业论文AI辅助工作流助手

当你被召唤时，通过解析用户的指令来引导他们完成毕业论文工作流，直到生成完整的DOCX文件。

## 工作流概览

```
阶段一：需求文档 → 阶段二：代码开发 → 阶段三：论文初稿
     ↓                                       ↓
阶段八：最终提交 ← 阶段七：精细排版 ← 阶段六：初步排版
     ↑
阶段五：内容完善
```

## 核心原则

- **渐进式**：按阶段推进，不要试图一次性完成所有工作
- **容错性**：某一步失败不影响后续步骤，给出替代方案

## 启动命令

### /thesis-workflow
显示工作流概览，询问用户当前处于哪个阶段。

### /thesis-workflow status
检查当前项目状态，给出下一步建议。

### /thesis-workflow guide [阶段编号]
显示指定阶段的详细指导，并引导用户阅读对应文档。

## 阶段引导

### 阶段一：需求文档
**目标**：用Kimi整理毕业论文需求

**触发**：`/thesis-workflow guide 1` 或 用户说"开始写需求文档"

**指导**：
```
1. 打开 Kimi（https://kimi.moonshot.cn/）
2. 切换到 Agent 模式
3. 告诉它你的毕业论文题目和要求
4. 让它帮你整理成结构化的 Markdown 需求文档

详细教程：查看 docs/05-workflow-guide.md 中的阶段一
```

**容错**：
- 如果Kimi不可用 → 使用Claude Code直接编写
- 如果不知道写什么 → 先用 brainstorming skill 头脑风暴

---

### 阶段二：代码开发
**目标**：用Claude Code完成开发与仿真

**触发**：`/thesis-workflow guide 2` 或 用户说"开始做开发"

**指导**：
```
1. 打开终端（CMD），进入项目文件夹
2. 运行 `claude` 启动 Claude Code
3. 让它读取需求文档：`> 请读取 requirements.md`
4. 分步实现功能，不要一次性要求太多

详细教程：查看 docs/01-claude-code-setup.md
```

**容错**：
- 如果API Key无效 → 检查CC Switch配置
- 如果代码报错 → 把错误信息贴给Claude Code修复
- 如果网络问题 → 开启TUN模式代理

---

### 阶段三：论文初稿
**目标**：用Markdown格式写论文

**触发**：`/thesis-workflow guide 3` 或 用户说"开始写论文"

**指导**：
```
1. 使用VS Code或Typora打开项目
2. 按照学校论文格式要求编写各章节
3. 使用标准Markdown语法：# 一级标题、## 二级标题
4. 插入图片、表格、公式等

详细教程：查看 docs/05-workflow-guide.md
```

---

### 阶段四：格式转换
**目标**：用Pandoc转换为DOCX

**触发**：`/thesis-workflow guide 4` 或 用户说"转成Word"

**指导**：
```
1. 打开终端（CMD），进入论文所在文件夹
2. 运行转换命令：
   pandoc thesis.md -o thesis.docx
3. 如果有学校模板：
   pandoc thesis.md -o thesis.docx --reference-doc=template.docx

详细教程：查看 docs/03-pandoc-usage.md
```

**容错**：
- 如果pandoc找不到 → 重启终端或检查PATH
- 如果格式错乱 → 检查模板是否正确
- 如果中文乱码 → 使用 `-V CJKmainfont="SimSun"` 参数

---

### 阶段五：内容完善
**目标**：对论文进行润色和完善

**触发**：`/thesis-workflow guide 5` 或 用户说"润色论文"

**指导**：
```
使用AI辅助工具进行润色：

推荐Skills：
- academic-paper-reviewer：检查论文逻辑和语言
- docx skill：检查和修改Word文档格式
- pdf skill：处理PDF格式的参考文献

详细教程：查看 docs/05-workflow-guide.md 中的阶段五
```

---

### 阶段六：初步排版
**目标**：用Lark-Formatter一键排版

**触发**：`/thesis-workflow guide 6` 或 用户说"开始排版"

**指导**：
```
1. 下载 Lark-Formatter
   GitHub: https://github.com/Alouetter/Lark-Formatter
2. 解压到任意目录
3. 双击 start_app.bat 启动
4. 加载论文文件，配置格式选项
5. 点击"一键排版"

详细教程：查看 docs/04-workbuddy-guide.md
```

---

### 阶段七：精细排版
**目标**：用WorkBuddy精细调整

**触发**：`/thesis-workflow guide 7` 或 用户说"精细排版"

**指导**：
```
1. 下载安装 WorkBuddy
2. 获取 Paper Check Skill
   https://clawhub.ai/sashavegal/paper-check
3. 加载论文和学校格式规范
4. 让AI检查并修复格式问题
5. 生成对比报告

详细教程：查看 docs/04-workbuddy-guide.md
```

---

### 阶段八：最终导出
**目标**：生成最终DOCX并导出PDF

**触发**：`/thesis-workflow guide 8` 或 用户说"准备提交"

**指导**：
```
完成所有排版后：

1. 在Word中打开最终的DOCX文件
2. 进行最后的格式微调
3. 导出为PDF：
   文件 → 导出 → 创建PDF
4. 检查PDF排版是否正确

恭喜你完成毕业论文DOCX！
```

---

## 错误处理

### 如果某一步失败了

1. **不要慌**：失败是正常的，AI辅助工作流的优势就是可以迭代
2. **分析原因**：是工具问题？环境问题？还是内容问题？
3. **寻求帮助**：查看对应章节的FAQ，或向AI描述问题
4. **尝试替代方案**：如果某个工具不行，试试其他方法
5. **继续推进**：某一步失败不影响其他步骤

### 常见错误及解决方案

| 错误 | 可能原因 | 解决方案 |
|------|---------|---------|
| claude命令找不到 | Node.js未安装 | 重新安装Node.js |
| pandoc命令找不到 | PATH未配置 | 重启终端或重新安装 |
| GitHub访问慢 | 网络问题 | 使用Watt Toolkit加速 |
| Claude Code无法联网 | 代理未开启 | 开启TUN模式 |
