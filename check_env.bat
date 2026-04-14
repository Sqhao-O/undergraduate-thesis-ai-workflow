@echo off
chcp 65001 >nul

echo ========================================
echo   Thesis AI Workflow - Environment Check
echo ========================================
echo.

call :check_git
call :check_node
call :check_npm
call :check_claude
call :check_pandoc

echo.
echo ========================================
echo   Check Complete
echo ========================================
echo.
pause
exit /b

:check_git
echo [1/5] Checking Git ...
where git >nul 2>&1
if %errorlevel%==0 (
    for /f "delims=" %%v in ('git --version 2^>nul') do (
        if not defined _git_ver set "_git_ver=%%v"
    )
    echo   [OK] !_git_ver!
) else (
    echo   [FAIL] Git is not installed
)
goto :eof

:check_node
echo [2/5] Checking Node.js ...
where node >nul 2>&1
if %errorlevel%==0 (
    for /f "delims=" %%v in ('node --version 2^>nul') do (
        if not defined _node_ver set "_node_ver=%%v"
    )
    echo   [OK] !_node_ver!
) else (
    echo   [FAIL] Node.js is not installed
)
goto :eof

:check_npm
echo [3/5] Checking npm ...
where npm >nul 2>&1
if %errorlevel%==0 (
    for /f "delims=" %%v in ('npm --version 2^>nul') do (
        if not defined _npm_ver set "_npm_ver=%%v"
    )
    echo   [OK] npm !_npm_ver!
) else (
    echo   [FAIL] npm is not installed
)
goto :eof

:check_claude
echo [4/5] Checking Claude Code ...
where claude >nul 2>&1
if %errorlevel%==0 (
    echo   [OK] Claude Code is installed
) else (
    echo   [FAIL] Claude Code is not installed
    echo   Tip: Run 'npm install -g @anthropic-ai/claude-code'
)
goto :eof

:check_pandoc
echo [5/5] Checking Pandoc ...
where pandoc >nul 2>&1
if %errorlevel%==0 (
    echo   [OK] Pandoc is installed
) else (
    echo   [FAIL] Pandoc is not installed
)
goto :eof
