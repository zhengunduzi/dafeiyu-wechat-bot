[README-github.md](https://github.com/user-attachments/files/34230612/README-github.md)
# 大肥鱼 · 让 AI 住进微信

> ⚠️ **免责声明：本项目使用 Windows UI 自动化驱动个人微信，违反微信用户协议，有封号风险。请务必使用不心疼的小号，封号自负。**

一个能接梗、会发表情包、看得懂图片的微信 AI 小号。个人折腾项目，能跑，不保证优雅。

## 它能做什么

- 群里被 @ 会接话，私聊看到消息就回
- 有表情包库，按情绪自己挑着发
- 看得懂图片和表情包（含图上的文字）
- 记得住人，有禁词过滤

做不到：发语音、改资料、发朋友圈——那些要逆向协议，个人号上属于高危操作，不建议。

## 环境要求

- Windows 10/11
- 微信 4.x 电脑版（小号登录，窗口别关别最小化）
- Python 3.10+
- 任何 OpenAI 兼容的 `/chat/completions` 接口；看图需要支持 `image_url` 的多模态模型

## 快速开始

```bat
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

1. 把 `config.example.json` 复制成 `config.json`，填自己的 `api_url`、`api_key`、`model`、`chats`
2. 表情包丢进 `stickers/`，文件名就是标签（如 `嫌弃脸.png`）
3. **右键 `bot_run.bat` → 以管理员身份运行**（必须管理员，否则看不到微信窗口）

看到 `[run] listening, Ctrl+C to stop.` 就活了。

## 详细教程

见 [GUIDE-dafeiyu-wechat.md](GUIDE-dafeiyu-wechat.md)，里面有一节 13 条的「踩坑清单」，比代码更能说明这套东西的边界在哪。

## 几个容易踩的点

- 图片是 HEVC 编码，**必须**有 ffmpeg（`requirements.txt` 里的 `imageio-ffmpeg` 已自带），否则只能解出黑白剪影
- 发图接口回报「数据库未确认」通常是假失败，代码用回声确认，别盲目重发
- 自己发的消息会以好友身份回传，所以有时间窗和回声表
- 视觉接口 502 很常见，带图请求会退避重试

## 许可证

MIT。自用随意，后果自负。
