@echo off
chcp 65001 >nul 2>&1
title U-Claw 虾盘 - OpenClaw 一键启动

echo.
echo   ╔══════════════════════════════════════╗
echo   ║     U-Claw 虾盘 v1.0                ║
echo   ║     OpenClaw 一键启动 (Windows)      ║
echo   ╚══════════════════════════════════════╝
echo.

set "UCLAW_DIR=%~dp0"
set "OPENCLAW_DIR=%UCLAW_DIR%openclaw"
set "NODE_DIR=%UCLAW_DIR%runtime\node-win-x64"
set "NODE_BIN=%NODE_DIR%\node.exe"
set "NPM_BIN=%NODE_DIR%\npm.cmd"
set "PNPM_BIN=%NODE_DIR%\pnpm.cmd"

goto MAIN

:ENSURE_PNPM
if exist "%PNPM_BIN%" goto :eof
echo   缺少 pnpm，正在补充安装...
call "%NPM_BIN%" install -g pnpm --registry=https://registry.npmmirror.com
if not exist "%PNPM_BIN%" (
    echo   [错误] pnpm 安装失败，无法继续构建
    pause
    exit /b 1
)
goto :eof

:MAIN

if not exist "%NODE_BIN%" (
    echo   [错误] 找不到 Node.js 运行环境
    echo   请确保 runtime\node-win-x64 目录完整
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('"%NODE_BIN%" --version') do set NODE_VER=%%v
echo   Node.js 版本: %NODE_VER%
echo.

set "PATH=%NODE_DIR%;%NODE_DIR%\node_modules\.bin;%PATH%"

if not exist "%OPENCLAW_DIR%\node_modules" (
    echo   首次运行，正在安装依赖...
    echo   （使用淘宝镜像，请稍等）
    echo.
    cd /d "%OPENCLAW_DIR%"
    call "%NPM_BIN%" install --registry=https://registry.npmmirror.com
    echo.
    echo   依赖安装完成!
    echo.
)

if not exist "%OPENCLAW_DIR%\dist" (
    echo   首次运行，正在构建...
    cd /d "%OPENCLAW_DIR%"
    call :ENSURE_PNPM
    call "%PNPM_BIN%" run build
    if not exist "%OPENCLAW_DIR%\dist" (
        echo   [错误] 构建失败，请检查上方错误信息
        pause
        exit /b 1
    )
    echo.
)

echo   正在启动 OpenClaw...
echo.
cd /d "%OPENCLAW_DIR%"
REM 首次运行走 onboard，之后直接启动
if not exist "%USERPROFILE%\.openclaw\openclaw.json" (
    echo   首次配置...
    "%NODE_BIN%" openclaw.mjs onboard --install-daemon
    if errorlevel 1 exit /b 1
)
echo.
echo   启动 OpenClaw 服务...
"%NODE_BIN%" openclaw.mjs || call "%NPM_BIN%" start

echo.
echo   OpenClaw 已退出
pause
