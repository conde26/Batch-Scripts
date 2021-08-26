@echo off
REM Autor: Jose Conde 
REM Script para cambiar hostname 

REM Titulo y color 
Title "Cambiar Hostaname"
color 0A

REM Cambiando el nombre del equipo 
echo | set /p="[!] El nombre de tu equipo es: " & hostname
echo.
echo | set /p="[*] Indica el nombre Antiguo de tu equipo: " & set /p nombre_viejo=
echo.
echo | set /p="[*] Indica un Nuevo nombre para tu equipo: " & set /p nombre_nuevo=
echo.
WMIC computersystem where caption='%nombre_viejo%' rename %nombre_nuevo% >NUL

:pregunta
cls
color 0A
echo | set /p="[?] Desea reinicar el equipo para aplicar los cambios (s/n): " & set /p respuesta=

REM Verificando apagado (s/n)
if %respuesta% ==s (goto :si) 
if %respuesta% ==n (goto :no)
if not %respuesta% ==s (goto :error)
if not %respuesta% ==n (goto :error)

:si
cls && color B
echo [!] Vamos a reinicar el equipo en 5 segundos!
timeout /t 5 && shutdown -r -t 0

:no
cls && color B
echo [!] Hasta pronto! && timeout /t 3
exit

:error
cls
color B
echo [*] Esa opcion no es valida, intentelo de nuevo! & timeout /t 2 >NUL
goto :pregunta