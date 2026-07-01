# ⚡ Quick Start - Terminal PDV

Guia rápido para começar a usar em **5 minutos**!

---

## 🎯 Modo 1: Usar Localmente (Desenvolvimento)

### Windows:
```cmd
1. Dê duplo clique em: INICIAR-PROXY.bat
2. Abra index.html no navegador
3. Pronto! 🎉
```

### Mac/Linux:
```bash
chmod +x start-proxy.sh
./start-proxy.sh
# Em outro terminal:
open index.html
```

---

## 🌐 Modo 2: Deploy no GitHub (Produção)

### Passo a Passo:

```bash
# 1. Inicialize Git
git init
git add .
git commit -m "🚀 Terminal PDV - v1.0"

# 2. Crie repositório no GitHub
# Vá em: https://github.com/new
# Nome: pdv

# 3. Conecte e envie
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/pdv.git
git push -u origin main

# 4. Ative GitHub Pages
# Settings → Pages → Source: main branch → Save

# 5. Acesse em:
# https://SEU-USUARIO.github.io/pdv
```

---

## ⚙️ Configuração Inicial

### 1. Abra o PDV
Clique no ícone de engrenagem ⚙️

### 2. Digite o PIN
Padrão: `0000`

### 3. Configure:

**Opção A - Com API (Recomendado):**
- Cole seu token MercadoPago
- Marque "Modo Teste" se for testar
- Clique em "Testar Token"

**Opção B - Sem API (Simples):**
- Insira sua Chave PIX
- Sistema usará PIX Nativo

### 4. Salve!

---

## 🧪 Fazer um Teste

1. Digite um valor (ex: `5,00`)
2. Clique em **COBRAR**
3. Escolha **PIX (Automático)**
4. QR Code aparece ✅
5. Escaneie e pague (ou simule no modo teste)

---

## 🆘 Problemas?

### "API bloqueada pelo navegador"
→ Inicie o servidor proxy primeiro!
```bash
node proxy-server.js
```

### "Erro CORS"
→ Verifique se `useProxyServer: true` no HTML
→ Ou use PIX Nativo (configure chave PIX)

### "Token inválido"
→ Copie o token completo do MercadoPago
→ Teste em: https://www.mercadopago.com.br/developers

---

## 📚 Próximos Passos

- 📖 [README Completo](./README.md)
- 🚀 [Guia de Deploy](./DEPLOY.md)
- 🔧 [Solução CORS](./SOLUCAO-CORS.md)
- 🤝 [Como Contribuir](./CONTRIBUTING.md)

---

**Pronto! Seu PDV está funcionando! 🎉**
