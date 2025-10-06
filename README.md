# Audio Output Switcher

Simple scripts to toggle between audio output devices on Windows.


**`sound_output_switch.ps1`**: toggles between audio output devices.

**`sound_output_switch_trigger.vbs`**: triggers the script while supressing the PowerShell window launch.

## Prerequisites

- Windows 10 or later.
- PowerShell with AudioDeviceCmdlets module.

## Setup

### Install AudioDeviceCmdlets

1. Open PowerShell as an administrator.


2. Install the AudioDeviceCmdlets module by running the following command:

   ```powershell
   Install-Module -Name AudioDeviceCmdlets -Force -AllowClobber
   ```

### Get Audio Device IDs

1. In PowerShell, get the list of all audio devices:

   ```powershell
   Get-AudioDevice -List
   ```

2. Note down the `ID` values for the audio devices you want to switch between.

### Configure the PowerShell Script

1. Open the `sound_output_switch.ps1` file in a text editor.
2. Replace the placeholder IDs with the actual IDs you noted down:

   ```powershell
   # Device IDs (replace with actual IDs for your audio devices)
   $headphoneID = '{YOUR_HEADPHONE_DEVICE_ID}'  # Example: '{0.0.0.00000000}.{cd50ba51-6ff4-4ff5-845f-b425e676acd7}'
   $speakerID = '{YOUR_SPEAKER_DEVICE_ID}'        # Example: '{0.0.0.00000000}.{e022618d-f01a-4cb8-9e30-3c2ebef2872a}'
   ```

3. Save the changes.

### Configure the VBScript

1. Open the `sound_output_switch_trigger.vbs` file in a text editor.
2. Replace the placeholder path with the actual path to your PowerShell script:

   ```vbscript
   WshShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\path\to\your\sound_output_switch.ps1""", 0, False
   ```

3. Save the changes. The scripts are ready for use.

### Creating a keyboard shortcut

1. Right-click the `.vbs` file and select **Create shortcut** to place a shortcut on your desktop for easy access.

2. Assign a keyboard shortcut by right-clicking the shortcut, selecting **Properties**, and setting a **Shortcut key**.

## Troubleshooting

- Ensure that the AudioDeviceCmdlets module is installed correctly.
- Verify that the device IDs in the PowerShell script are correct.

Some un-cooperative background applications may cause delays of 1-2 seconds in toggling outputs when using the shortcut specifically *(the scripts are quick as expected when ran directly)*. 

Usual culprits include - Settings, Microsoft Store, Caclulator, etc.

```
Windows polls all running programs when a key shortcut is executed with "Is this your shortcut combo ?" so that it switches focus to that window rather than launching a new copy of the program.

This approach runs into a problem when a window somewhere refuses to answer the question. This causes Windows to await a response for 1-2 seconds before moving on to poll the other programs.

You can identify such troublesome programs by trial and error only. The best approach to mitigate this issue is to ensure no such application is auto-started in the background at boot up unless explicitly critical for use and tasks.
```

## License

**[GNU GENERAL PUBLIC LICENSE](LICENSE)** </br>
Version 3, 29 June 2007

Copyright (C) [2025]  [arcyse] </br>
This is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License. See the [LICENSE](LICENSE) file for more details.

> **Warning**: This software is provided "as is", without any warranty of any kind. Use it at your own risk. It is recommended to create backups of your system settings and configurations before using the script, as improper usage may result in unintended changes.
