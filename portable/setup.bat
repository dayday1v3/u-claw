@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1
title U-Claw Portable Setup

echo.
echo   ========================================
echo     U-Claw Portable Setup
echo     下载 Node.js + 安装 OpenClaw
echo   ========================================
echo.

set "SCRIPT_DIR=%~dp0"
set "APP_DIR=%SCRIPT_DIR%app"
set "CORE_DIR=%APP_DIR%\core"
set "RUNTIME_DIR=%APP_DIR%\runtime"
set "NODE_DIR=%RUNTIME_DIR%\node-win-x64"
set "NODE_BIN=%NODE_DIR%\node.exe"
set "NPM_BIN=%NODE_DIR%\npm.cmd"
set "MIRROR=https://registry.npmmirror.com"
set "NODE_MIRROR=https://npmmirror.com/mirrors/node"
set "NODE_VER=v22.22.1"

REM ---- Step 1: Node.js ----
echo   [1/3] 检查 Node.js...

if exist "%NODE_BIN%" (
    for /f "tokens=*" %%v in ('"%NODE_BIN%" --version') do echo   Node.js (win-x64) 已存在: %%v
    goto :install_openclaw
)

echo   从国内镜像下载 Node.js %NODE_VER%...
set "NODE_ZIP=node-%NODE_VER%-win-x64.zip"
set "NODE_URL=%NODE_MIRROR%/%NODE_VER%/%NODE_ZIP%"
echo   %NODE_URL%
echo.

curl -# -L "%NODE_URL%" -o "%TEMP%\%NODE_ZIP%"
if !errorlevel! neq 0 (
    echo.
    echo   [ERROR] 下载失败，请检查网络连接
    pause
    exit /b 1
)

echo   解压中...
mkdir "%NODE_DIR%" 2>nul
powershell -command "Expand-Archive -Path '%TEMP%\%NODE_ZIP%' -DestinationPath '%TEMP%\node-extract' -Force"
xcopy /s /e /q /y "%TEMP%\node-%NODE_VER%-win-x64\*" "%NODE_DIR%\" >nul
rmdir /s /q "%TEMP%\node-extract" 2>nul
del "%TEMP%\%NODE_ZIP%" 2>nul

if not exist "%NODE_BIN%" (
    echo   [ERROR] Node.js 解压失败
    pause
    exit /b 1
)
for /f "tokens=*" %%v in ('"%NODE_BIN%" --version') do echo   Node.js %%v 安装完成

:install_openclaw
echo.
echo   [2/3] 安装 OpenClaw...

if exist "%CORE_DIR%\node_modules\openclaw" (
    echo   OpenClaw 已安装，跳过
    goto :install_skills
)

mkdir "%CORE_DIR%" 2>nul
if not exist "%CORE_DIR%\package.json" (
    echo {"name":"u-claw-core","version":"1.0.0","private":true,"dependencies":{"openclaw":"latest"}} > "%CORE_DIR%\package.json"
)

cd /d "%CORE_DIR%"
call "%NPM_BIN%" install --registry=%MIRROR%
if !errorlevel! neq 0 (
    echo   [ERROR] OpenClaw 安装失败
    pause
    exit /b 1
)
echo   OpenClaw 安装完成

:install_skills
echo.
echo   [3/3] 安装中国优化技能...

set "SKILLS_CN=%SCRIPT_DIR%skills-cn"
set "SKILLS_TARGET=%CORE_DIR%\node_modules\openclaw\skills"
set "SKILL_COUNT=0"

if exist "%SKILLS_CN%" if exist "%SKILLS_TARGET%" (
    for /d %%d in ("%SKILLS_CN%\*") do (
        if not exist "%SKILLS_TARGET%\%%~nxd" (
            xcopy /s /e /q /y "%%d" "%SKILLS_TARGET%\%%~nxd\" >nul 2>nul
            set /a SKILL_COUNT+=1
        )
    )
    echo   中国技能安装完成 ^(+!SKILL_COUNT! 个^)
) else (
    echo   跳过技能安装
)

REM ---- Done ----
echo.
echo   ========================================
echo     搭建完成！
echo   ========================================
echo.
echo   启动方式:
echo     双击 Windows-Start.bat
echo.
echo   目录结构:
echo     app\core\      - OpenClaw + 依赖
echo     app\runtime\   - Node.js %NODE_VER%
echo     data\          - 运行后自动生成
echo.
pause
