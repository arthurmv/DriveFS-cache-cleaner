@ECHO OFF
TITLE DriveFS Cleaner

SET "DriveFS=GoogleDriveFS.exe"
SET "UserCode=YW1lbGdvemFAdWFiYy5lZHUubXg"
SET "App=%ProgramFiles%\Google\Drive File Stream\31.0.16.0\GoogleDriveFS.exe"

ECHO.
ECHO DriveFS must to be closed.
ECHO --------------------------
:QUESTION
SET /P C=Would you like to continue[Y/N]?
IF /I "%C%" EQU "Y" GOTO START
IF /I "%C%" EQU "N" GOTO EOF
CLS
ECHO.
ECHO ----------------------------
ECHO Please answer [Y]es or [N]o!
ECHO ----------------------------
ECHO.
GOTO QUESTION
:START
CLS
TASKKILL /IM %DriveFS% /F
RD /S /Q "%LocalAppData%\Google\DriveFS\%UserCode%\content_cache"
RD /S /Q "%LocalAppData%\Google\DriveFS\%UserCode%\thumbnails_cache"
CLS
ECHO.
ECHO    Done ! ! !
ECHO.
PAUSE
START "" "%App%"
:EXIT
GOTO EOF
