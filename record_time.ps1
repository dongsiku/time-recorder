Param([switch]$start, [switch]$end)

$DATETIME_NOW = Get-Date
$DATE_NOW = $DATETIME_NOW.ToString("yyyy/MM/dd")
$TIME_NOW = $DATETIME_NOW.ToString("HH:mm")

Write-Output "$DATE_NOW $TIME_NOW"

$TIME_RECORDER_DATA = $DATE_NOW
$TIME_RECORDER_DATA += ","
If ($start) {
    $TIME_RECORDER_DATA += $TIME_NOW
    $TIME_RECORDER_DATA += ","
    $TIME_RECORDER_DATA += ",start-time"
}
ElseIf ($end) {
    $TIME_RECORDER_DATA += ","
    $TIME_RECORDER_DATA += $TIME_NOW
    $TIME_RECORDER_DATA += ",end-time"
}
Else {
    $TIME_RECORDER_DATA += $TIME_NOW
    $TIME_RECORDER_DATA += ","
    $TIME_RECORDER_DATA += $TIME_NOW
    $TIME_RECORDER_DATA += ",NONE"
}

Start-Sleep 3

$TIME_RECORDER_DATA |  Out-File -FilePath time-recorder.csv -Append -Encoding utf8
