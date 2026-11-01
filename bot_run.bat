@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Dsh bot (auto-restart)
:loop
echo ==== bot running  %date% %time% ====
".venv\Scripts\python.exe" bot.py
echo.
echo ==== bot exited (code %ERRORLEVEL%)  %date% %time% ====
echo ==== restarting in 5 seconds, press Ctrl+C twice to stop ====
timeout /t 5 /nobreak >nul
goto loop
