@echo off

set "OPENVINO_DIR=C:\Program Files (x86)\IntelSWTools\openvino_2020.4.287"
call "%OPENVINO_DIR%\bin\setupvars.bat"

set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python37\python.exe"

set "INTEL_MODEL_DIR=%OPENVINO_DIR%\models\intel"
set "MODEL_DETECTOR=%INTEL_MODEL_DIR%\face-detection-retail-0005\FP16\face-detection-retail-0005.xml"
set "MODEL_AGE_GENDER=%INTEL_MODEL_DIR%\age-gender-recognition-retail-0013\FP16\age-gender-recognition-retail-0013.xml"
set "PROJECT_DIR=%USERPROFILE%\Desktop\multi_camera_multi_face_tracking"

set "DEBUG=1"
if "%DEBUG%"=="1" ( 
  set "PY_DEBUG=-m ptvsd --host 0.0.0.0 --port 5678"
) else (
  set "PY_DEBUG="
)

cd "%PROJECT_DIR%"
"%PYTHON%" %PY_DEBUG% main.py ^
    -i 0 0 ^
    --m_detector "%MODEL_DETECTOR%" ^
    --m_ag "%MODEL_AGE_GENDER%" ^
    --config configs/person.py
