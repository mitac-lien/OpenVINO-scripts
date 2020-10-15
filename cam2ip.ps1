$camera = Get-PnpDevice -FriendlyName "Logitech HD Webcam C310" -Status "OK"
$bus_num_prop = $camera | Get-PnpDeviceProperty -KeyName "DEVPKEY_Device_Address"
$cam_id = $bus_num_prop.data
Write-Output "cam_id: $cam_id"

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