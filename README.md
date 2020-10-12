# OpenVINO scripts & Troubleshooting

## Script Usage

1. open cmd prompt (or visual studio prompt)
2. copy script absolute path and paste as following:
   ```cmd
   C:\> "path/to/scripts/xxx.bat"
   ```
3. enter

## Troubleshooting

- `cv.VideoCapture()` can't solve rtsp protocol
> install ffmpeg shared lib by "%OPENVINO_DIR%\opencv\ffmpeg-download.ps1"