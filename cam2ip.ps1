# !! Set the camera index manually
#    I don't find any easy solution to get the camera index to `cv.VideoCapture(index)`
$cam_id = 0

$cam2ip_url = 'https://github.com/gen2brain/cam2ip/releases/download/1.6/cam2ip-1.6-64bit-cv2.zip'

$bin_dir="$env:USERPROFILE\bin\cam2ip-1.6-64bit-cv"
if ( -not (Test-Path "$bin_dir") ) {
    $zip_path = "$env:TMP\cam2ip-1.6-64bit-cv2.zip"
    
    if (-not (Test-Path "$zip_path")) {
        Invoke-Webrequest -Uri "$cam2ip_url" -OutFile "$zip_path"
    }
    
    Expand-Archive -LiteralPath "$zip_path" -DestinationPath "$env:USERPROFILE\bin"
    Remove-item "$zip_path"
}

& "$bin_dir\cam2ip.exe" -index "$cam_id" -height 720 -width 1280