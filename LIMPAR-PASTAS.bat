@echo off
chcp 65001 >nul
cls
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║                                                       ║
echo ║     🧹 LIMPAR PASTAS DESNECESSÁRIAS                   ║
echo ║                                                       ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo.

echo ⚠️  ATENÇÃO: Este script vai remover:
echo.
echo    ❌ .vscode/  (configurações do editor)
echo    ❌ .vs/      (configurações do Visual Studio)
echo    ❌ .github/  (CI/CD - opcional)
echo.
echo ✅ MANTÉM:
echo    ✅ node_modules/ (necessário para rodar o proxy)
echo    ✅ .git/        (controle de versão)
echo.
set /p CONFIRMA="Deseja remover essas pastas? (S/N): "
if /i not "%CONFIRMA%"=="S" (
    echo.
    echo Cancelado.
    pause
    exit /b 0
)

echo.
echo 🧹 Limpando pastas...
echo.

if exist ".vscode" (
    echo 🗑️  Removendo .vscode/...
    rmdir /s /q .vscode
    echo    ✅ Removido!
)

if exist ".vs" (
    echo 🗑️  Removendo .vs/...
    rmdir /s /q .vs
    echo    ✅ Removido!
)

echo.
set /p REMOVE_GITHUB="Remover .github/ também? (S/N): "
if /i "%REMOVE_GITHUB%"=="S" (
    if exist ".github" (
        echo 🗑️  Removendo .github/...
        rmdir /s /q .github
        echo    ✅ Removido!
    )
)

echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║                                                       ║
echo ║        ✅ LIMPEZA CONCLUÍDA! ✅                       ║
echo ║                                                       ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo 📁 PASTAS RESTANTES:
dir /ad /b
echo.
echo ⚠️  IMPORTANTE: node_modules/ é necessário para rodar o proxy!
echo    Não remova essa pasta.
echo.
pause
