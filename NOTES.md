# 大肥鱼微信接入 · 评审包（脱敏）

给外部评审用的最小集合：能看清代码结构和配置，但不含任何隐私。

| 文件 | 说明 |
|---|---|
| bot.py | 主程序（约 58KB），监听 / 攒批 / 调模型 / 发表情 / 看图 |
| persona.txt | 人设 |
| banned.txt | 禁词表 |
| config.example.json | 配置模板，api_key 已抹空，群名和 wxid 都是占位 |
| requirements.txt | 实际装的四条依赖 |
| GUIDE-dafeiyu-wechat.md | 教程，方便对照代码看哪里对不上 |

## 刻意没有的

- 表情包本体，以及表情包的文件名清单（文件名会暴露攒了哪些梗图）
- state.json（聊天记录）、memory.md（长期记忆）、真实 config.json
- .venv、日志、缓存、图片原图

## 看代码先知道的几点

- 驱动是 Windows UI 自动化（wechatauto-replica），不是协议，必须管理员权限
- 图片不是点开的，是从微信本地库按 local_id 解密 .dat，HEVC 靠 imageio-ffmpeg 带的 ffmpeg
- 自己发的消息会以 friend 身份回传，所以有 pic_sent_at / pic_echo 这套时间窗和回声表
- 发图回报的「数据库未确认」是假失败，判定改用回声
