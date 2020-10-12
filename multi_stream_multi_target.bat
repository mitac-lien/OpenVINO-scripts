@echo off

set "OPENVINO_DIR=C:\Program Files (x86)\IntelSWTools\openvino_2020.4.287"
call "%OPENVINO_DIR%\bin\setupvars.bat"

set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python37\python.exe"

set "INTEL_MODEL_DIR=%OPENVINO_DIR%\models\intel"
set "MODEL_DETECTOR=%INTEL_MODEL_DIR%\person-detection-retail-0013\FP16\person-detection-retail-0013.xml"
set "MODEL_REID=%INTEL_MODEL_DIR%\person-reidentification-retail-0270\FP16\person-reidentification-retail-0270.xml"
set "PYDEMO_DIR=%USERPROFILE%\Desktop\open_model_zoo\demos\python_demos"
set "DEMO_DIR=%PYDEMO_DIR%\multi_camera_multi_target_tracking"


cd "%DEMO_DIR%"
"%PYTHON%" multi_camera_multi_target_tracking.py ^
    -i 0 ^
    --m_detector "%MODEL_DETECTOR%" ^
    --config configs/person.py
