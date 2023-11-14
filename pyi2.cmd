@echo off

set file=

if exist %1.py (
    set file=%1.py
    goto install
)
if exist %1.pyw (
    set file=%1.pyw
    goto install
)
echo File %1.py or %1.pyw does not exist!
exit /b

:install
if exist output rd output /s /q
pyinstaller %file% --onefile
if not exist output md output
if exist dist\%1.exe move dist\%1.exe output
if exist dist rd dist /s /q
if exist build rd build /s /q
if exist *.spec del *.spec
echo Build done!