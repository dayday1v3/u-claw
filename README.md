# 🦞 U-Claw 虾盘

**Portable AI Agent — 插上就能用的 AI 助手**

**Portable AI Agent — Double-click to run, no installation needed**

> 像当年的雨林木风，把 AI 助手简化到"双击运行"。
> Like the legendary YuLinMuFeng installer discs, but for AI.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Why U-Claw? / 为什么需要 U-Claw？

[OpenClaw](https://github.com/openclaw/openclaw) is the most powerful open-source AI assistant framework. But in China, installing it is a nightmare: GitHub blocked, npm timeout, Node.js download slow.

[OpenClaw](https://github.com/openclaw/openclaw) 是最强的开源 AI 助手框架，但在中国安装它是个噩梦。

**U-Claw bundles everything.** Node.js + OpenClaw + all dependencies + QQ plugin, pre-built and ready to run.

**U-Claw 全部打包好。** Node.js + OpenClaw + 所有依赖 + QQ 插件，双击即用。

## Quick Start / 快速开始

### Option 1: Download Release / 从 Releases 下载（推荐）

1. Download [U-Claw-v1.1.tar.gz](https://github.com/dongsheng123132/u-claw/releases)
2. Extract anywhere (USB drive, Desktop, Documents)
3. Mac: double-click `Mac-Start.command` / Windows: double-click `Windows-Start.bat`
4. Browser opens automatically — configure your AI model and API key

下载解压，双击启动，浏览器自动打开配置页面。

### Option 2: USB Install Script / U 盘安装脚本

USB drive has install scripts that auto-extract + launch:
- Mac: `Mac-Install.command`
- Windows: `Windows-Install.bat`

### Option 3: Copy / 复制别人的

Just copy the `U-Claw/` folder. That's it.

直接复制 `U-Claw/` 文件夹就行。

## Directory Structure / 目录结构

```
U-Claw/                           (~2.3GB)
├── Mac-Start.command             ← Mac: double-click to start
├── Windows-Start.bat             ← Windows: double-click to start
├── Mac-Menu.command              ← Mac: config & maintenance menu
├── Windows-Menu.bat              ← Windows: config & maintenance menu
├── U-Claw.html                   ← Navigation page / 导航页面
├── app/
│   ├── core/                     ← OpenClaw + deps + QQ plugin
│   └── runtime/
│       ├── node-mac-arm64/       ← Mac Apple Silicon
│       └── node-win-x64/         ← Windows 64-bit
├── data/                         ← User data (config, memory, backups)
└── system/
    └── migrate.js                ← Config migration
```

## Menu / 菜单功能

8 options, covering config and maintenance:

```
[1] Setup wizard (model, API key) / 配置向导
[2] Open web dashboard / 打开网页控制台
[3] QQ Bot (pre-installed) / QQ 机器人（已预装）
[4] Other platforms (Feishu/Telegram/WeChat) / 其他平台
[5] Diagnostics / 诊断修复
[6] Backup / 备份配置
[7] Restore / 恢复备份
[8] System info / 系统信息
```

## AI Models / 支持的 AI 模型

### Chinese Models (no VPN) / 国产模型（无需翻墙）

| Model 模型 | Best for 推荐场景 |
|------------|-------------------|
| DeepSeek | Coding, best value / 编程首选 |
| Kimi K2.5 | Long docs, 256K context / 长文档 |
| Qwen 通义千问 | Large free tier / 免费额度大 |
| GLM 智谱 | Academic / 学术 |
| MiniMax | Voice, multimodal / 语音 |
| Doubao 豆包 | Volcano Engine / 火山引擎 |

### International Models / 国际模型

Claude (Anthropic) · GPT (OpenAI) · Gemini (Google)

## Chat Platforms / 聊天平台

| Platform 平台 | Status 状态 | Notes 说明 |
|---------------|------------|------------|
| QQ | ✅ **Pre-installed 已预装** | Just enter AppID + Secret |
| Feishu 飞书 | ✅ Built-in 内置 | Enterprise / 企业首选 |
| Telegram | ✅ Built-in 内置 | International / 海外推荐 |
| WhatsApp | ✅ Built-in 内置 | Baileys protocol |
| Discord | ✅ Built-in 内置 | — |
| Slack | ✅ Built-in 内置 | — |
| WeChat 微信 | ✅ Community plugin | iPad protocol |

### QQ Setup (1 min) / QQ 接入（1 分钟）

QQ plugin is pre-installed! Just:
1. Visit q.qq.com, create a bot, get AppID and AppSecret
2. Run `Mac-Menu.command`, choose [3] QQ Bot
3. Enter AppID and AppSecret, done

## System Requirements / 系统要求

- **macOS**: Apple Silicon (M1-M4), macOS 12+
- **Windows**: 10/11, 64-bit
- **RAM**: 2GB+ (4GB+ recommended)
- **Storage**: 3GB+

## Upgrade / 升级

Replace `app/` with new version. `data/` stays (config and memory preserved).

下载新版替换 `app/`，`data/` 不动。

## USB Drive Structure / U 盘结构

```
UCLAW (USB Drive)
├── Mac-Install.command       ← First run (extract + launch)
├── Windows-Install.bat
├── U-Claw.tar.gz             ← Compressed package (743MB)
├── README.txt                ← Instructions
└── Toolkit/                  ← Engineer DIY kit
    ├── node-v22-mac-arm64.pkg
    ├── node-v22-win-x64.msi
    ├── openclaw-source.tar.gz
    └── npm-cache.tar.gz
```

## FAQ

**Q: Need VPN? / 需要翻墙吗？**
No for installation. Runtime needs internet for AI APIs — Chinese models work without VPN.
安装不需要。运行需要联网调 API，国产模型无需翻墙。

**Q: Can I share it? / 能分发吗？**
Yes, MIT license, copy freely.
可以，MIT 协议，随便复制。

**Q: Windows needs WSL?**
No. Bundled Windows Node.js runs natively.
不需要，自带 Windows 版 Node.js。

**Q: Mac says "unverified developer"?**
Right-click the script → Open.
右键点击脚本 → 打开。

## License

[MIT](LICENSE)

## Contact / 联系

- WeChat 微信: hecare888
- GitHub: [@dongsheng123132](https://github.com/dongsheng123132)
- Website 官网: [u-claw.org](https://u-claw.org)

---

**Made with 🦞 by [dongsheng](https://github.com/dongsheng123132)**
