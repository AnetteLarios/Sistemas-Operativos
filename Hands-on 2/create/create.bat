@echo off
REM Crear archivo dmytext.txt con "Hola Mundo"
echo Hola Mundo > mytext.txt
echo Archivo 'mytext.txt' creado.

REM Imprimir en la terminal el archivo mytext.txt
echo.
echo Contenido de mytext.txt:
type mytext.txt
echo.

REM Crear una carpeta llamado backup
mkdir backup
echo Subdirectorio 'backup' creado.

REM Copiar mytext.txt a backup
copy mytext.txt backup\
echo Archivo 'mytext.txt' copiado a 'backup'.
echo.

REM Listar contenido de backup
echo Contenido del subdirectorio 'backup':
dir backup
echo.

REM Eliminar mytext.txt de backup
del backup\mytext.txt
echo Archivo 'mytext.txt' eliminado del subdirectorio 'backup'.

REM Eliminar backup
rmdir backup
echo Subdirectorio 'backup' eliminado.
