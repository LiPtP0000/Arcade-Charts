@echo off

REM 定义路径变量
set EXE_PATH=E:\a1-340-b94-win-x86\Arcade-One.exe
set GIT_REPO_PATH=E:\desktop\Arcade 谱面合集

REM 启动 Arcade-One.exe 并等待其退出
echo Launching Arcade-One.exe...
start "" "%EXE_PATH%"
echo Waiting for Arcade-One.exe to exit...

REM 使用 `waitfor` 命令等待 Arcade-One.exe 进程退出
:wait_for_exit
tasklist | find /i "Arcade-One.exe" >nul
if %errorlevel% == 0 (
    timeout /t 1 >nul
    goto wait_for_exit
)

REM 当 Arcade-One.exe 退出后，进行 Git 操作
echo Arcade-One.exe has exited.
echo Performing git commit and push...

REM 切换到 Git 仓库路径
cd /d "%GIT_REPO_PATH%"

REM 执行 Git 命令
git add .
git commit -m "update"
git push

echo Git commit and push completed.

pause
