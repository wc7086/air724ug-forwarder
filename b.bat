


@echo off
setlocal enabledelayedexpansion

:: 在此处修改搜索字符串和截断字符串
set "search_str=要搜索的字符串"
set "stop_str=停止搜索的字符串"

:: 检查是否拖放了文件
if "%~1"=="" (
    echo 请将文件拖放到此脚本上
    pause
    exit /b
)

:: 检查grep是否可用
where grep >nul 2>&1 || (
    echo 未找到grep，请先安装Git for Windows或Unix工具
    echo 并确保grep在PATH环境变量中
    pause
    exit /b
)

:: 执行搜索并检查是否遇到截断字符串
echo 正在搜索 "%search_str%"...
echo ==============================
for /f "delims=" %%A in ('findstr /i "%search_str%" "%~1"') do (
    echo %%A
    echo %%A | findstr /i "%stop_str%" >nul
    if not errorlevel 1 (
        echo 找到停止字符串，停止搜索
        exit /b
    )
)

:: 保持窗口打开
echo ==============================
pause



@echo off
setlocal enabledelayedexpansion

:: 在此处修改搜索字符串
set "search_str=要搜索的字符串"

:: 检查是否拖放了文件
if "%~1"=="" (
    echo 请将文件拖放到此脚本上
    pause
    exit /b
)

:: 检查grep是否可用
where grep >nul 2>&1 || (
    echo 未找到grep，请先安装Git for Windows或Unix工具
    echo 并确保grep在PATH环境变量中
    pause
    exit /b
)

:: 执行搜索
echo 正在搜索 "%search_str%"...
echo ==============================
grep -i --color "%search_str%" "%~1"

:: 保持窗口打开
echo ==============================
pause