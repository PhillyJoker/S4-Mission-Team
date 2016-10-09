@echo off

REM project root
set pr=%~dp0..

del /s /q "%pr%\*.pbo"
