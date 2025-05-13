@echo off
REM === Prompt for Unreal Engine Directory ===
set /p ENGINE_DIR=Enter the full path to your Unreal Engine directory (e.g., C:\Program Files\Epic Games\UE_5.5):

REM === Prompt for Project File Path ===
set /p PROJECT_PATH=Enter the full path to your .uproject file (e.g., D:\MyProject\MyProject.uproject):

REM === Construct path to UnrealBuildTool.exe ===
SET UBT_PATH=%ENGINE_DIR%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe

REM === Validate UnrealBuildTool.exe ===
IF NOT EXIST "%UBT_PATH%" (
    echo Error: Cannot find UnrealBuildTool.exe at %UBT_PATH%
    pause
    exit /b 1
)

REM === Validate .uproject file ===
IF NOT EXIST "%PROJECT_PATH%" (
    echo Error: Cannot find .uproject file at %PROJECT_PATH%
    pause
    exit /b 1
)

REM === Run the command ===
echo Generating project files using UnrealBuildTool...
"%UBT_PATH%" -project="%PROJECT_PATH%" -game -engine -vscode

pause

