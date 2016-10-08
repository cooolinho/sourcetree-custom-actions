@echo off
setlocal enableDelayedExpansion

for /f "delims=" %%i in ('git config --get remote.origin.url') do set sourceUrl=%%i

set "baseUrl=%sourceUrl%"
set "baseUrl=!baseUrl:.git=!"

for /f "delims=" %%U in ("\%baseUrl%\..\..\..") do (
    set "base=%%~pnxU"
    set "base=!base:~1!"
    set "base=!base:\=/!"
    set "base=!base:https:/=https://!"
)

for /f "delims=" %%U in ("\%baseUrl%\..") do (
    set "project=%%~nxU"
)

for /f "delims=" %%U in ("\%baseUrl%") do (
    set "repo=%%~nxU"
)

echo %base%/github.com/%project%/%repo%