# 🦞 U-Claw 虾盘

**Portable AI Agent — 插上就能用的 AI 助手**

> 像当年的雨林木风，把 AI 助手简化到"双击运行"。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 为什么需要 U-Claw？

[OpenClaw](https://github.com/openclaw/openclaw) 是最强的开源 AI 助手框架，但在中国安装它是个噩梦：GitHub 访问不了、npm 超时、Node.js 下载慢。

**U-Claw 解决所有问题。** Node.js + OpenClaw + 所有依赖 + QQ 插件，全部打包好。双击即用。

## 快速开始

### 方法 1：从 Releases 下载（推荐）

1. 下载 [U-Claw-v1.1.tar.gz](https://github.com/dongsheng123132/u-claw/releases)
2. 解压到任意位置（U 盘、桌面、文档都行）
3. Mac: 双击 `Mac-Start.command` / Windows: 双击 `Windows-Start.bat`

### 方法 2：用 U 盘安装脚本

U 盘上有安装脚本，双击自动解压 + 启动：
- Mac: `Mac-Install.command`
- Windows: `Windows-Install.bat`

### 方法 3：复制别人的

直接把 `U-Claw/` 文件夹复制一份就行。

## 目录结构

```
U-Claw/                           (~2.3GB)
├── Mac-Start.command             ← Mac 双击启动
├── Windows-Start.bat             ← Windows 双击启动
├── Mac-Menu.command              ← Mac 配置/维护菜单
├── Windows-Menu.bat              ← Windows 配置/维护菜单
├── U-Claw.html                   ← 导航页面
├── app/
│   ├── core/                     ← OpenClaw + 依赖 + QQ 插件
│   └── runtime/
│       ├── node-mac-arm64/       ← Mac Apple Silicon
│       └── node-win-x64/         ← Windows 64-bit
├── data/                         ← 用户数据（配置、记忆、备份）
│   ├── .openclaw/
│   ├── memory/
│   └── backups/
└── system/
    └── migrate.js                ← 配置迁移脚本
```

## 菜单功能

精简到 8 个选项：

```
[1] 配置向导（选模型、API Key）
[2] 打开网页控制台
[3] QQ 机器人（已预装，只需输入 ID）
[4] 其他平台（飞书/Telegram/微信）
[5] 诊断修复
[6] 备份配置
[7] 恢复备份
[8] 系统信息
```

## 支持的 AI 模型

### 国产模型（无需翻墙）

| 模型 | 推荐场景 |
|------|----------|
| DeepSeek | 编程，性价比首选 |
| Kimi K2.5 | 长文档，256K 上下文 |
| 通义千问 Qwen | 免费额度大 |
| 智谱 GLM | 学术 |
| MiniMax | 语音、多模态 |
| 豆包 Doubao | 火山引擎 |

### 国际模型

Claude (Anthropic) · GPT (OpenAI) · Gemini (Google)

## 聊天平台

| 平台 | 状态 | 说明 |
|------|------|------|
| QQ | ✅ **已预装** | 只需输入 AppID + AppSecret |
| 飞书 | ✅ 内置 | 企业首选 |
| Telegram | ✅ 内置 | 海外推荐 |
| 微信 | ✅ 社区插件 | iPad 协议 |
| Discord | ✅ 内置 | — |
| WhatsApp | ✅ 内置 | — |

### QQ 接入（1 分钟）

QQ 插件已预装！只需：
1. 访问 q.qq.com 创建机器人，获取 AppID 和 AppSecret
2. 双击 `Mac-Menu.command`，选 [3] QQ 机器人
3. 输入 AppID 和 AppSecret，完成

## 系统要求

- **macOS**: Apple Silicon (M1-M4), macOS 12+
- **Windows**: 10/11, 64-bit
- **内存**: 2GB+（推荐 4GB+）
- **存储**: 3GB+

## 升级

下载新版 `app/` 目录替换旧的，`data/` 不动（用户配置和记忆保留）。

## U 盘结构

```
UCLAW (U盘)
├── Mac-Install.command       ← 首次双击（解压+启动）
├── Windows-Install.bat
├── U-Claw.tar.gz             ← 压缩包
├── README.txt                ← 使用说明
└── Toolkit/                  ← 工程师 DIY 素材包
    ├── node-v22-mac-arm64.pkg
    ├── node-v22-win-x64.msi
    ├── openclaw-source.tar.gz
    └── npm-cache.tar.gz
```

## 仓库结构

```
u-claw/
├── portable/          ← 脚本源码（打包进 U-Claw）
├── uclaw-scripts/     ← U 盘安装脚本
├── website/           ← 官网
├── docs/              ← 文档
└── README.md
```

## FAQ

**Q: 需要翻墙吗？**
安装不需要。运行需要联网调 AI API，国产模型无需翻墙。

**Q: 能分发吗？**
可以，MIT 协议，随便复制。

**Q: Windows 需要 WSL 吗？**
不需要，自带 Windows 版 Node.js。

## License

[MIT](LICENSE)

## 联系

- 微信: hecare888
- GitHub: [@dongsheng123132](https://github.com/dongsheng123132)
- 官网: [u-claw.org](https://u-claw.org)

---

**Made with 🦞 by [dongsheng](https://github.com/dongsheng123132)**
