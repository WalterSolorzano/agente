@echo off
setlocal
set "ROOT=%~dp0"
set "PY=%ROOT%.venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python"
set "PYTHONPATH=%ROOT%src;%PYTHONPATH%"

cd /d %ROOT%
%PY% -m pip install -e .
if errorlevel 1 exit /b %ERRORLEVEL%
call "%ROOT%start_automat.bat"
