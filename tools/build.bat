@echo off

REM project root
set pr=%~dp0..

if not exist "%pr%\builds" md "%pr%\builds"
del /s /q "%pr%\builds\*.*"

cd "%pr%\missions"
for /d %%d in (*.*) do "%pr%\tools\PBOConsole" -pack "%pr%\missions\%%d" "%pr%\builds\%%d.pbo"
