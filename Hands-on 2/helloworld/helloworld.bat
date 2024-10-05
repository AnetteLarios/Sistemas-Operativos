@echo off
REM Imprimir "Hello World"
echo Hello World

REM Listar el contenido del directorio actual
echo.
echo Contenido del directorio actual:
dir
echo.

REM Crear una carpeta llamado Test
mkdir Test
echo Subdirectorio 'Test' creado.

REM Cambiarse a Test
cd Test
echo Cambiado al subdirectorio 'Test'.

REM Listar el contenido de Test
echo.
echo Contenido del subdirectorio 'Test':
dir
