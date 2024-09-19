@echo off

:: So I can just run install.bat

powershell.exe -executionpolicy bypass -file windows\install.ps1 -verb runAs
