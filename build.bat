@echo off
chcp 65001 >nul
echo ==========================================
echo  跨境智训数据采集器 - Windows打包脚本
echo ==========================================
echo.

:: 检查Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Python，请先安装Python 3.10+
    echo 下载地址: https://www.python.org/downloads/
    echo 安装时请勾选 "Add Python to PATH"
    pause
    exit /b 1
)

echo [1/4] Python已检测到
python --version

echo [2/4] 安装依赖...
pip install -r requirements.txt
if errorlevel 1 (
    echo [错误] 依赖安装失败
    pause
    exit /b 1
)

echo [3/4] 安装PyInstaller...
pip install pyinstaller
if errorlevel 1 (
    echo [错误] PyInstaller安装失败
    pause
    exit /b 1
)

echo [4/4] 打包EXE...
pyinstaller --onefile --windowed --name "跨境智训数据采集器" main.py
if errorlevel 1 (
    echo [错误] 打包失败
    pause
    exit /b 1
)

echo.
echo ==========================================
echo  打包成功！
echo  可执行文件位于: dist\跨境智训数据采集器.exe
echo ==========================================
pause
