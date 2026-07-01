@echo off
chcp 65001 >nul
cls
echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║                                                       ║
echo ║     🔧 RESOLVER CONFLITO COM GITHUB                   ║
echo ║                                                       ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo.

echo ⚠️  SITUAÇÃO DETECTADA:
echo    Seu repositório local e remoto têm históricos diferentes
echo.
echo 💡 SOLUÇÕES DISPONÍVEIS:
echo.
echo    [1] SUBSTITUIR TUDO (Apaga histórico remoto e envia o local)
echo    [2] MESCLAR (Tenta combinar o local com o remoto)
echo    [3] CANCELAR REBASE e tentar novamente
echo.
set /p OPCAO="Escolha a opção (1, 2 ou 3): "
echo.

if "%OPCAO%"=="1" goto SUBSTITUIR
if "%OPCAO%"=="2" goto MESCLAR
if "%OPCAO%"=="3" goto CANCELAR
echo Opção inválida!
pause
exit /b 1

:CANCELAR
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo 🔄 Cancelando rebase...
echo.
git rebase --abort
echo.
echo ✅ Rebase cancelado!
echo.
echo 📝 Agora tente novamente com a opção 1 ou 2
echo.
pause
exit /b 0

:SUBSTITUIR
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo ⚠️  ATENÇÃO: Isso vai SUBSTITUIR todo o conteúdo remoto!
echo    O histórico antigo será perdido.
echo.
set /p CONFIRMA="Tem certeza? (S/N): "
if /i not "%CONFIRMA%"=="S" (
    echo Cancelado.
    pause
    exit /b 1
)
echo.

echo 🔄 Cancelando rebase...
git rebase --abort 2>nul
echo.

echo 🚀 Forçando push (substituir remoto)...
echo.
git push -u origin main --force
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Erro ao fazer push forçado!
    echo.
    echo 💡 Tente fazer login novamente:
    echo    git credential reject
    echo    protocol=https
    echo    host=github.com
    echo.
    pause
    exit /b 1
)

echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║                                                       ║
echo ║        ✅ SUCESSO! CÓDIGO ENVIADO! ✅                 ║
echo ║                                                       ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo 🔗 Acesse: https://github.com/Lauriuche/pdv
echo.
pause
exit /b 0

:MESCLAR
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo 🔄 Cancelando rebase...
git rebase --abort 2>nul
echo.

echo 📥 Baixando código do GitHub...
echo.
git pull origin main --allow-unrelated-histories
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Erro ao fazer pull!
    echo    Pode ter conflitos para resolver manualmente.
    echo.
    pause
    exit /b 1
)
echo.

echo 🚀 Enviando código mesclado...
echo.
git push -u origin main
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Erro ao fazer push!
    pause
    exit /b 1
)

echo.
echo ╔═══════════════════════════════════════════════════════╗
echo ║                                                       ║
echo ║        ✅ SUCESSO! CÓDIGO MESCLADO! ✅                ║
echo ║                                                       ║
echo ╚═══════════════════════════════════════════════════════╝
echo.
echo 🔗 Acesse: https://github.com/Lauriuche/pdv
echo.
pause
exit /b 0
