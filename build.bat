@ECHO OFF

IF EXIST schaos.o DEL schaos.o
IF EXIST schaos.sym DEL schaos.sym
IF EXIST schaos.sms DEL schaos.sms

ECHO Assembling...
wla_dx_v10.7_Win64\wla-z80 -v -o schaos.o schaos.asm > build_report.txt

IF %ERRORLEVEL% NEQ 0 GOTO assemble_fail
IF NOT EXIST schaos.o GOTO assemble_fail

ECHO Linking...
wla_dx_v10.7_Win64\wlalink -r -s schaos.link schaos.sms
IF %ERRORLEVEL% NEQ 0 GOTO link_fail

ECHO ==========================
ECHO Build Success.
ECHO ==========================

GOTO end

:assemble_fail
ECHO Error while assembling.
GOTO fail
:link_fail
ECHO Error while linking.
:fail

ECHO ==========================
ECHO Build failure.
ECHO ==========================

:end
PAUSE