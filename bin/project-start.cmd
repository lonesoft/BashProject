@ECHO OFF
TITLE %~1
SETLOCAL
    WHERE wsl >nul 2>&1
    IF ERRORLEVEL 1 ECHO wsl command not found && PAUSE && GOTO :exit
    FOR /F "tokens=* USEBACKQ" %%F IN (`wsl wslpath -ua '%~dp0\project'`) DO SET bin=%%F
    wsl . ~/.profile; %bin% start --title %*
    IF ERRORLEVEL 1 PAUSE
:exit
ENDLOCAL
EXIT
