# 💳 Terminal PDV - Sistema de Ponto de Venda

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/seu-usuario/pdv)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-v18+-brightgreen)](https://nodejs.org)

Sistema completo de PDV (Ponto de Venda) com integração PIX via MercadoPago.

🔗 **[Demo Online](https://seu-usuario.github.io/pdv)** | 📖 **[Documentação](./SOLUCAO-CORS.md)**

---

## 📸 Preview

![Terminal PDV](https://via.placeholder.com/800x450/232935/22c55e?text=Terminal+PDV)



## 🚀 Como Usar

### Opção 1: Usar Diretamente (Sem API)
1. Abra o arquivo `index.html` no navegador
2. Configure sua chave PIX nas configurações
3. Use o PIX Nativo (Plano B) para gerar cobranças

**Vantagens:**
- ✅ Funciona imediatamente
- ✅ Não precisa instalar nada
- ✅ Funciona offline

**Desvantagens:**
- ❌ Confirmação manual de pagamentos
- ❌ Sem verificação automática

---

### Opção 2: Com API MercadoPago (Recomendado)

#### Passo 1: Configurar o Proxy
Para evitar erro CORS, você precisa usar um servidor proxy.

**No Windows:**
1. Dê duplo clique no arquivo `INICIAR-PROXY.bat`
2. O servidor será iniciado automaticamente

**No Mac/Linux ou manualmente:**
```bash
npm install
npm start
```

O servidor ficará rodando em `http://localhost:3000`

#### Passo 2: Obter Token do MercadoPago
1. Acesse: https://www.mercadopago.com.br/developers
2. Crie uma aplicação
3. Copie seu Access Token (de teste ou produção)

#### Passo 3: Configurar o PDV
1. Abra `index.html` no navegador
2. Clique no ícone de engrenagem (⚙️)
3. Digite o PIN: `0000` (padrão)
4. Cole seu token na seção "API MercadoPago"
5. Salve as configurações

#### Passo 4: Testar
1. Digite um valor
2. Clique em "COBRAR"
3. Escolha "PIX (Automático)"
4. O QR Code será gerado automaticamente
5. O sistema verificará o pagamento automaticamente a cada 5 segundos

---

## 🔧 Erro CORS?

Se você ver erro de CORS no console do navegador, siga as instruções em:
📄 **[SOLUCAO-CORS.md](./SOLUCAO-CORS.md)** - Guia completo de soluções

---

## 📁 Estrutura de Arquivos

```
pdv/
├── index.html              ← Interface principal do PDV
├── proxy-server.js         ← Servidor proxy para resolver CORS
├── package.json            ← Dependências do Node.js
├── INICIAR-PROXY.bat       ← Atalho para iniciar proxy (Windows)
├── README.md               ← Este arquivo
└── SOLUCAO-CORS.md         ← Guia de soluções para CORS
```

---

## ⚙️ Funcionalidades

### Formas de Pagamento
- ✅ **PIX Automático** - Via API MercadoPago (confirma sozinho)
- ✅ **PIX Nativo** - Via chave PIX (Plano B, confirmação manual)
- ✅ **Cartão de Crédito** - Com taxa configurável
- ✅ **Cartão de Débito** - Com taxa configurável
- ✅ **Dinheiro** - Com cálculo de troco

### Recursos
- 📊 Histórico de vendas
- 📈 Relatórios e estatísticas
- 🖨️ Comprovantes imprimíveis
- 📱 Envio por WhatsApp
- 🎨 Temas personalizáveis
- 🔒 PIN de administrador
- 📡 Modo Online/Offline
- 🌙 Protetor de tela

---

## 🌐 Deploy e Hospedagem

### GitHub Pages (Frontend apenas)

1. **Faça fork ou clone do repositório**
2. **Ative GitHub Pages:**
   - Vá em: Settings → Pages
   - Source: Deploy from branch
   - Branch: `main` → `/root`
   - Salve e aguarde

O PDV ficará disponível em: `https://seu-usuario.github.io/pdv`

⚠️ **Limitação:** GitHub Pages hospeda apenas arquivos estáticos. Para usar a API PIX automática, você precisa hospedar o servidor proxy separadamente.

---

### Deploy do Servidor Proxy

#### Opção 1: Heroku (Grátis)

```bash
# Instalar Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli

# Login
heroku login

# Criar app
heroku create seu-pdv-proxy

# Adicionar variáveis de ambiente
heroku config:set NODE_ENV=production

# Deploy
git push heroku main

# Verificar
heroku open
```

Depois, atualize no HTML:
```javascript
proxyUrl: "https://seu-pdv-proxy.herokuapp.com"
```

#### Opção 2: Vercel (Grátis)

```bash
# Instalar Vercel CLI
npm install -g vercel

# Deploy
vercel

# Production
vercel --prod
```

#### Opção 3: Railway (Grátis)

1. Acesse: https://railway.app
2. Conecte seu repositório GitHub
3. Railway detectará automaticamente o Node.js
4. Configure as variáveis de ambiente
5. Deploy automático!

#### Opção 4: Render (Grátis)

1. Acesse: https://render.com
2. New → Web Service
3. Conecte seu repositório
4. Build Command: `npm install`
5. Start Command: `npm start`
6. Deploy!

---

## 📦 Instalação Local

### Pré-requisitos

- [Node.js](https://nodejs.org) v18+ 
- NPM ou Yarn
- Git (opcional)

### Passo a Passo

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/pdv.git
cd pdv

# 2. Instale as dependências
npm install

# 3. (Opcional) Configure variáveis de ambiente
cp .env.example .env
# Edite o .env com suas credenciais

# 4. Inicie o servidor proxy
npm start

# 5. Abra o index.html no navegador
# Ou use um servidor local:
npx serve .
```

---



Acesse as configurações clicando no ícone de engrenagem (⚙️) e inserindo o PIN.

### Seções Disponíveis:
1. **Nome do Terminal** - Personaliza o nome exibido
2. **API MercadoPago** - Configura integração com PIX automático
3. **Chave PIX (Plano B)** - Para PIX estático sem API
4. **Taxas e Tarifas** - Define percentuais de taxa
5. **WhatsApp** - Para envio de comprovantes
6. **Aparência** - Cores e temas
7. **Segurança** - Alterar PIN

---

## 🔐 Segurança

### PIN Padrão
- **Padrão:** `0000`
- **Como alterar:** Configurações → Segurança → Alterar PIN

### Token da API
⚠️ **IMPORTANTE:** Nunca compartilhe seu token do MercadoPago!

---

## ❓ Problemas Comuns

### "Erro CORS ao gerar PIX"
📄 Leia: [SOLUCAO-CORS.md](./SOLUCAO-CORS.md)

### "API falhou e não tem Chave PIX"
1. Abra as configurações
2. Configure sua chave PIX na seção "Chave PIX (Plano B)"
3. Ou configure o token da API do MercadoPago

### "Token inválido"
1. Verifique se copiou o token completo
2. Verifique se está usando o token correto (teste ou produção)
3. Teste a conexão clicando em "Testar Ligação"

### QR Code não aparece
1. Verifique se o servidor proxy está rodando
2. Abra o console (F12) e veja os erros
3. Tente usar o PIX Nativo (Plano B)

---

## 📞 Suporte

### Logs de Erro
Pressione `F12` no navegador para abrir o console e ver erros detalhados.

### Resetar Configurações
1. Abra o console (F12)
2. Digite: `localStorage.clear()`
3. Pressione Enter
4. Recarregue a página

---

## 📝 Changelog

### Versão Atual (v7)
- ✅ Corrigido erro CORS com modo `cors` explícito
- ✅ Melhor detecção e tratamento de erros CORS
- ✅ Mensagem visual quando CORS bloqueia a requisição
- ✅ Fallback automático para PIX Nativo em caso de CORS
- ✅ Servidor proxy incluído para resolver CORS definitivamente
- ✅ Scripts de inicialização automatizados (Windows)
- ✅ Documentação completa de soluções CORS

---

## 📄 Licença

Livre para uso pessoal e comercial.

---

## 🌟 Recursos Futuros

- [ ] Integração com impressora térmica
- [ ] App mobile nativo
- [ ] Multi-caixa (vários terminais)
- [ ] Integração com estoque
- [ ] Dashboard web administrativo

---

**Desenvolvido com ❤️ para facilitar vendas**
