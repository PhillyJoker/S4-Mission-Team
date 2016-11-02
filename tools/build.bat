@echo off

call clear.bat

cd "%pr%"
for /d %%d in (*.*) do if /I not %%d==tools "%pr%\tools\PBOConsole" -pack "%pr%\%%d" "%pr%\%%d.pbo"
