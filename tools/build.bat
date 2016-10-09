@echo off

REM project root
set pr=%~dp0..

del /s /q "%pr%\*.pbo"

cd "%pr%"
for /d %%d in (*.*) do if /I not %%d==tools "%pr%\tools\PBOConsole" -pack "%pr%\%%d" "%pr%\%%d.pbo"
