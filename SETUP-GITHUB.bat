@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   📦 CONFIGURAÇÃO INICIAL DO GITHUB
echo ========================================
echo.

REM Verifica se Git está instalado
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git não está instalado!
    echo.
    echo 📥 Por favor, baixe e instale o Git:
    echo    https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo ✅ Git encontrado: 
git --version
echo.

REM Pergunta informações do usuário
set /p USER_NAME="Digite seu nome de usuário do GitHub: "
set /p REPO_NAME="Digite o nome do repositório (ex: pdv): "

echo.
echo ========================================
echo   🔧 Configurando Git...
echo ========================================
echo.

REM Inicializa Git se necessário
if not exist ".git" (
    echo 📝 Inicializando repositório Git...
    git init
    echo.
)

REM Adiciona todos os arquivos
echo 📂 Adicionando arquivos...
git add .
echo.

REM Faz o primeiro commit
echo 💾 Fazendo commit inicial...
git commit -m "🚀 Terminal PDV - Versão 1.0"
echo.

REM Renomeia branch para main
echo 🔄 Configurando branch main...
git branch -M main
echo.

REM Adiciona remote
echo 🌐 Conectando ao GitHub...
git remote add origin https://github.com/%USER_NAME%/%REPO_NAME%.git
echo.

echo ========================================
echo   ✅ CONFIGURAÇÃO CONCLUÍDA!
echo ========================================
echo.
echo 📝 PRÓXIMOS PASSOS:
echo.
echo 1. Crie um repositório no GitHub:
echo    https://github.com/new
echo    Nome: %REPO_NAME%
echo.
echo 2. Execute este comando para enviar:
echo    git push -u origin main
echo.
echo 3. Ative GitHub Pages:
echo    Settings ^>^> Pages ^>^> Source: main branch
echo.
echo 4. Acesse em:
echo    https://%USER_NAME%.github.io/%REPO_NAME%
echo.
echo ========================================
echo.
pause
