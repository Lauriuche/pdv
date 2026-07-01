#!/bin/bash

echo ""
echo "========================================"
echo "  📦 CONFIGURAÇÃO INICIAL DO GITHUB"
echo "========================================"
echo ""

# Verifica se Git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git não está instalado!"
    echo ""
    echo "📥 Instale o Git:"
    echo "   Mac: brew install git"
    echo "   Linux: sudo apt-get install git"
    echo ""
    exit 1
fi

echo "✅ Git encontrado: $(git --version)"
echo ""

# Pergunta informações
read -p "Digite seu nome de usuário do GitHub: " USER_NAME
read -p "Digite o nome do repositório (ex: pdv): " REPO_NAME

echo ""
echo "========================================"
echo "  🔧 Configurando Git..."
echo "========================================"
echo ""

# Inicializa Git se necessário
if [ ! -d ".git" ]; then
    echo "📝 Inicializando repositório Git..."
    git init
    echo ""
fi

# Adiciona todos os arquivos
echo "📂 Adicionando arquivos..."
git add .
echo ""

# Faz o primeiro commit
echo "💾 Fazendo commit inicial..."
git commit -m "🚀 Terminal PDV - Versão 1.0"
echo ""

# Renomeia branch para main
echo "🔄 Configurando branch main..."
git branch -M main
echo ""

# Adiciona remote
echo "🌐 Conectando ao GitHub..."
git remote add origin "https://github.com/$USER_NAME/$REPO_NAME.git"
echo ""

echo "========================================"
echo "  ✅ CONFIGURAÇÃO CONCLUÍDA!"
echo "========================================"
echo ""
echo "📝 PRÓXIMOS PASSOS:"
echo ""
echo "1. Crie um repositório no GitHub:"
echo "   https://github.com/new"
echo "   Nome: $REPO_NAME"
echo ""
echo "2. Execute este comando para enviar:"
echo "   git push -u origin main"
echo ""
echo "3. Ative GitHub Pages:"
echo "   Settings >> Pages >> Source: main branch"
echo ""
echo "4. Acesse em:"
echo "   https://$USER_NAME.github.io/$REPO_NAME"
echo ""
echo "========================================"
echo ""
