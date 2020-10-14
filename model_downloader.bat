@echo off

set "OPENVINO_DIR=C:\Program Files (x86)\IntelSWTools\openvino_2020.4.287"

set "MODEL_DIR=%OPENVINO_DIR%\models"
set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python37\python.exe"
set "DOWNLOADER=%OPENVINO_DIR%\deployment_tools\open_model_zoo\tools\downloader\downloader.py"

"%PYTHON%" "%DOWNLOADER%" -j8 --all --output_dir "%MODEL_DIR%"