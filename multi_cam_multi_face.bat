@echo on

set "OPENVINO_DIR=C:\Program Files (x86)\IntelSWTools\openvino_2020.4.287"
call "%OPENVINO_DIR%\bin\setupvars.bat"

set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python37\python.exe"

set "INTEL_MODEL_DIR=%OPENVINO_DIR%\models\intel"
set "PUBLIC_MODEL_DIR=%OPENVINO_DIR%\models\public"
set "MODEL_DETECTOR=%INTEL_MODEL_DIR%\face-detection-retail-0005\FP16\face-detection-retail-0005.xml"
set "MODEL_AGE_GENDER=%INTEL_MODEL_DIR%\age-gender-recognition-retail-0013\FP16\age-gender-recognition-retail-0013.xml"
set "PROJECT_DIR=%USERPROFILE%\Desktop\multi_camera_multi_face_tracking"

set "GAZE_ESTIMATE=1"
if "%GAZE_ESTIMATE%"=="1" (
  set "MODEL_HEAD_POSE=%INTEL_MODEL_DIR%\head-pose-estimation-adas-0001\FP16\head-pose-estimation-adas-0001.xml"
  set "MODEL_LANDMARK=%INTEL_MODEL_DIR%\facial-landmarks-35-adas-0002\FP16\facial-landmarks-35-adas-0002.xml"
  set "MODEL_EYE_STATE=%PUBLIC_MODEL_DIR%\open-closed-eye-0001\open-closed-eye-0001.xml"
  set "MODEL_GAZE=%INTEL_MODEL_DIR%\gaze-estimation-adas-0002\FP16\gaze-estimation-adas-0002.xml"
  set GAZE_MODELS=--m_hp "%MODEL_HEAD_POSE%" --m_lm "%MODEL_LANDMARK%" --m_es "%MODEL_EYE_STATE%" --m_gz "%MODEL_GAZE%"
) else (
  set "GAZE_MODELS="
)

set "DEBUG=1"
if "%DEBUG%"=="1" (
  set "PY_DEBUG=-m ptvsd --host 0.0.0.0 --port 5678 --wait"
  echo "Wait debug server connecting..."
) else (
  set "PY_DEBUG="
)

cd "%PROJECT_DIR%"
"%PYTHON%" %PY_DEBUG% main.py ^
    -i 0 0 ^
    --m_detector "%MODEL_DETECTOR%" ^
    --m_ag "%MODEL_AGE_GENDER%" ^
    %GAZE_MODELS% ^
    --config configs/person.py
