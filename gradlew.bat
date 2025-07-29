@echo off
rem Simple Gradle wrapper for Windows
set VERSION=8.3
set DIR=%~dp0
set WRAPPER_JAR=%DIR%gradle\wrapper\gradle-wrapper.jar
set DISTRIBUTION_URL=https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip

if not exist "%WRAPPER_JAR%" (
  echo Downloading Gradle %VERSION%...
  powershell -Command "Invoke-WebRequest %DISTRIBUTION_URL% -OutFile %DIR%gradle\wrapper\gradle-%VERSION%-bin.zip"
  powershell -Command "Expand-Archive -Path %DIR%gradle\wrapper\gradle-%VERSION%-bin.zip -DestinationPath %DIR%gradle\wrapper"
  move %DIR%gradle\wrapper\gradle-%VERSION%\lib\gradle-launcher-%VERSION%.jar %WRAPPER_JAR%
  rmdir /S /Q %DIR%gradle\wrapper\gradle-%VERSION%
  del %DIR%gradle\wrapper\gradle-%VERSION%-bin.zip
)

java -jar "%WRAPPER_JAR%" %*