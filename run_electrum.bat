@echo off
REM Electrum WojakCoin - Windows launcher (run from repo root)
REM Requires Python 3.10+ and dependencies installed (see README)

set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Try python3, then python, then py (Windows launcher)
where python3 >nul 2>&1 && python3 run_electrum %* && exit /b
where python >nul 2>&1 && python run_electrum %* && exit /b
py -3 run_electrum %* 2>nul && exit /b

echo Error: Python 3.10+ not found. Install from https://www.python.org/
echo Then run: pip install -r contrib/requirements/requirements.txt ^& pip install ".[gui,crypto]"
pause
