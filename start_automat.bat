@echo off
setlocal
set "ROOT=%~dp0"
set "PY=%ROOT%.venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python"
set "PYW=%ROOT%.venv\Scripts\pythonw.exe"
if not exist "%PYW%" set "PYW=pythonw"
set "PYTHONPATH=%ROOT%src;%PYTHONPATH%"

if /I "%~1"=="gui" goto :gui
if /I "%~1"=="bot" goto :bot
if /I "%~1"=="daemon" goto :daemon
if /I "%~1"=="init-db" goto :initdb
if /I "%~1"=="export" goto :export

echo Starting all Automat components...
cd /d %ROOT%
%PY% -m automat init-db
start "Automat Bot" "%PYW%" -m automat bot
start "Automat Daemon" "%PYW%" -m automat daemon
start "Automat GUI" "%PYW%" -m automat gui
exit /b 0

:initdb
cd /d %ROOT%
%PY% -m automat init-db
exit /b %ERRORLEVEL%

:gui
cd /d %ROOT%
%PYW% -m automat gui
exit /b %ERRORLEVEL%

:bot
cd /d %ROOT%
%PYW% -m automat bot
exit /b %ERRORLEVEL%

:daemon
cd /d %ROOT%
%PYW% -m automat daemon
exit /b %ERRORLEVEL%

:export
cd /d %ROOT%
%PY% -m automat export
exit /b %ERRORLEVEL%
