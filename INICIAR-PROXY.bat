@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   🚀 INICIANDO SERVIDOR PROXY
echo ========================================
echo.

REM Verifica se o Node.js está instalado
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js não está instalado!
    echo.
    echo 📥 Por favor, baixe e instale o Node.js:
    echo    https://nodejs.org
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js encontrado: 
node --version
echo.

REM Verifica se as dependências estão instaladas
if not exist "node_modules" (
    echo 📦 Instalando dependências...
    echo.
    call npm install
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo ❌ Erro ao instalar dependências!
        echo.
        pause
        exit /b 1
    )
    echo.
    echo ✅ Dependências instaladas com sucesso!
    echo.
)

echo 🚀 Iniciando servidor proxy...
echo.
echo ⚠️  Mantenha esta janela aberta enquanto usar o PDV
echo ⚠️  Pressione Ctrl+C para parar o servidor
echo.
echo ========================================
echo.

node proxy-server.js

pause
