@echo off
:menu
cls
color 05
mode 40,20
echo      ORGANIZANDO INFORMAÇÕES
echo =======================================
echo (1) Exibir (2) Sair
echo =======================================

set /p usuario="Digite uma opção: "

if /i "%usuario%" == "1" goto exibir
if /i "%usuario%" == "2" goto sair

echo Opcao invalida! Tente novamente.
timeout /t 2 >nul
goto menu

:exibir
cls
echo organizando dados e separando em colunas...
timeout /t 2 >nul

:: Verifica se o arquivo existe
if not exist "C:\Users\gabriel\Desktop\informacoes.txt" (
    echo Arquivo "informacoes.txt" não encontrado!
    pause
    goto menu
)

:: Exibe o cabeçalho da tabela
echo. 
echo  Nome         Idade   Funcao    Setor
echo --------------------------------------------

:: Habilita expansão atrasada
setlocal enabledelayedexpansion

:: Lê o arquivo e exibe os dados formatados
for /f "tokens=1-4 delims=, skip=1" %%a in ('type "C:\Users\gabriel\Desktop\informacoes.txt"') do (
    set "nome=%%a               "
    set "idade=%%b     "
    set "funcao=%%c         "
    set "setor=%%d "
    echo !nome:~0,15!!idade:~0,06!!funcao:~0,10!!setor:~0,5!
)

:: Desativa 
endlocal

pause

echo.
echo Você gostaria de exibir novamente?
echo (2) Sim
echo (3) Sair
set /p repetir="Escolha uma opção: "

if /i "%repetir%" == "2" goto exibir
if /i "%repetir%" == "3" goto sair

echo Opcao invalida! Voltando ao menu...
timeout /t 2 >nul
goto menu

:sair
cls
timeout /t 2 >nul
exit
