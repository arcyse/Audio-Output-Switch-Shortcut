# Get the currently active audio device name
$currentName = (Get-AudioDevice -Playback | Select-Object Name).Name

# Device IDs (use realistic-looking examples)
$genericHeadphoneID = '{0.0.0.00000000}.{cd50ba51-6ff4-4ff5-845f-b425e676acd7}'     # Example ID for Headphones
$genericSpeakerID = '{0.0.0.00000000}.{e022618d-f01a-4cb8-9e30-3c2ebef2872a}'       # Example ID for Speakers

# Set the ID to switch to based on the current device
if ($currentName -eq 'Headphones (Realtek(R) Audio)') {     # Replace with your actual headphone name
    $targetID = $genericSpeakerID
    $targetName = 'Speakers (Realtek(R) Audio)'             # Replace with your actual speaker name
} else {
    $targetID = $genericHeadphoneID
    $targetName = 'Headphones (Realtek(R) Audio)'           # Replace with your actual headphone name
}

# Try to set the target device
try {
    Set-AudioDevice -ID $targetID
    Write-Host "Toggled to $targetName"
} catch {
    Write-Host $_
}