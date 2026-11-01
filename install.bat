@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Dsh bot installer
echo ==== Dsh wechat bot: install ====
echo.
where python >nul 2>nul
if errorlevel 1 (
  echo [X] Python not found in PATH.
  echo     Install Python 3.10+ from python.org and tick "Add python.exe to PATH".
  pause
  exit /b 1
)
if not exist ".venv" (
  echo [1/2] creating virtual env ...
  python -m venv .venv
  if errorlevel 1 ( echo [X] venv failed & pause & exit /b 1 )
) else (
  echo [1/2] .venv already exists, skip
)
echo [2/2] installing dependencies ...
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -q -r requirements.txt
if errorlevel 1 ( echo [X] pip install failed & pause & exit /b 1 )
echo.
echo Done. Next: right-click bot_run.bat and choose "Run as administrator".
echo Before that: log in the WeChat account on this PC, keep the window visible.
pause
