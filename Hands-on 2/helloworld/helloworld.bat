@echo off
REM Imprimir "Hello World"
echo Hello World

REM Listar el contenido del directorio actual
echo.
echo Contenido del directorio actual:
dir
echo.

REM Crear un subdirectorio llamado Test
mkdir Test
echo Subdirectorio 'Test' creado.

REM Cambiarse al subdirectorio Test
cd Test
echo Cambiado al subdirectorio 'Test'.

REM Listar el contenido del subdirectorio Test
echo.
echo Contenido del subdirectorio 'Test':
dir
