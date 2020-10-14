@echo off

set "OPENVINO_DIR=C:\Program Files (x86)\IntelSWTools\openvino_2020.4.287"
call "%OPENVINO_DIR%\bin\setupvars.bat"

set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python37\python.exe"

"%PYTHON%"