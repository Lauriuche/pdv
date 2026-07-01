#!/bin/bash

echo ""
echo "========================================"
echo "  🚀 INICIANDO SERVIDOR PROXY"
echo "========================================"
echo ""

# Verifica se o Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não está instalado!"
    echo ""
    echo "📥 Por favor, instale o Node.js:"
    echo "   https://nodejs.org"
    echo ""
    exit 1
fi

echo "✅ Node.js encontrado: $(node --version)"
echo ""

# Verifica se as dependências estão instaladas
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependências..."
    echo ""
    npm install
    if [ $? -ne 0 ]; then
        echo ""
        echo "❌ Erro ao instalar dependências!"
        echo ""
        exit 1
    fi
    echo ""
    echo "✅ Dependências instaladas com sucesso!"
    echo ""
fi

echo "🚀 Iniciando servidor proxy..."
echo ""
echo "⚠️  Mantenha este terminal aberto enquanto usar o PDV"
echo "⚠️  Pressione Ctrl+C para parar o servidor"
echo ""
echo "========================================"
echo ""

node proxy-server.js
