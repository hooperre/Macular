@echo off
setlocal

rem Extract data.zip to current directory using PowerShell
powershell -Command "Expand-Archive -Path '.\data.zip' -DestinationPath '.' -Force"
if errorlevel 1 (
    echo Extraction failed!
    pause
    exit /b 1
)

rem Confirm the python file exists after extraction
if not exist ".\UpdateAllEmulators.py" (
    echo UpdateAllEmulators.py not found after extraction!
    pause
    exit /b 1
)

rem Delete the zip file after successful extraction
del ".\data.zip"
if errorlevel 1 (
    echo Failed to delete data.zip
    pause
    exit /b 1
)

rem Run the extracted python script
python ".\UpdateAllEmulators.py"
if errorlevel 1 (
    echo Python script returned an error.
    pause
    exit /b 1
)

endlocal
