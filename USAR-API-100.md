# 🚀 USAR API 100% - GUIA COMPLETO

## ✅ STATUS ATUAL

- ✅ Servidor proxy está RODANDO em: http://localhost:3000
- ✅ Configuração do HTML está correta (`useProxyServer: true`)
- ✅ Dependências instaladas
- ✅ Pronto para usar API 100%!

---

## 🎯 COMO USAR AGORA

### 1️⃣ Abrir o PDV no Navegador

1. Abra o arquivo: `index.html` no seu navegador
2. Ou use um servidor local:
   ```cmd
   npx serve .
   ```

### 2️⃣ Configurar Token do MercadoPago

1. **Obter Token:**
   - Acesse: https://www.mercadopago.com.br/developers
   - Faça login
   - Vá em: "Suas integrações" → "Criar aplicação"
   - Copie o **Access Token** (Produção ou Teste)

2. **Configurar no PDV:**
   - Abra o PDV
   - Clique no ícone ⚙️ (configurações)
   - Digite o PIN: `0000`
   - Vá em "API MercadoPago"
   - Cole seu Access Token
   - Marque "Modo Teste" se for testar
   - Clique em "Testar Token" para verificar
   - Clique em "Salvar Alterações"

### 3️⃣ Testar Pagamento PIX

1. Digite um valor (ex: `5,00`)
2. Clique em **COBRAR**
3. Escolha **PIX (Automático)**
4. O QR Code será gerado automaticamente! ✅
5. Escaneie com seu app bancário
6. O sistema detecta o pagamento automaticamente! 🎉

---

## 🔄 SEMPRE QUE FOR USAR

**IMPORTANTE:** O servidor proxy precisa estar rodando!

### Opção 1 - Deixar Rodando (Recomendado)
O servidor já está rodando agora! Deixe ele aberto.

### Opção 2 - Iniciar Manualmente
Se fechar, dê duplo clique em: `INICIAR-PROXY.bat`

### Opção 3 - Comando Manual
```cmd
cd c:\Users\lauri\Downloads\pdv
node proxy-server.js
```

---

## 🌐 DEPLOY EM PRODUÇÃO

Para usar na internet (não só localhost), você precisa fazer deploy:

### Recomendado: Railway

1. **Acesse:** https://railway.app
2. **Login** com GitHub
3. **New Project** → **Deploy from GitHub repo**
4. **Selecione:** repositório `pdv`
5. **Aguarde** o deploy automático
6. **Copie a URL:** algo como `https://pdv-proxy.up.railway.app`

### Atualizar HTML com URL de Produção

No `index.html`, altere:
```javascript
proxyUrl: "http://localhost:3000"  // Local
```
Para:
```javascript
proxyUrl: "https://pdv-proxy.up.railway.app"  // Produção
```

Faça commit e push:
```cmd
git add index.html
git commit -m "config: atualizar URL do proxy para produção"
git push
```

---

## ✅ VANTAGENS DA API 100%

- ✅ **Confirmação Automática** - Sistema detecta pagamento sozinho
- ✅ **Verificação em Tempo Real** - Checa status a cada 5 segundos
- ✅ **Segurança** - Token não fica exposto no frontend
- ✅ **Profissional** - Integração oficial MercadoPago
- ✅ **Rastreamento** - ID de transação para cada pagamento
- ✅ **Modo Teste** - Testar sem usar dinheiro real

---

## 🆘 RESOLUÇÃO DE PROBLEMAS

### ❌ "Erro CORS ao gerar PIX"

**Causa:** Servidor proxy não está rodando

**Solução:**
```cmd
node proxy-server.js
```
Ou dê duplo clique em `INICIAR-PROXY.bat`

---

### ❌ "Token inválido"

**Causa:** Token incorreto ou expirado

**Solução:**
1. Copie o token COMPLETO do MercadoPago
2. Certifique-se de usar o token correto (Teste ou Produção)
3. Teste clicando em "Testar Token" nas configurações

---

### ❌ "Cannot find module 'dotenv'"

**Causa:** Dependências não instaladas

**Solução:**
```cmd
cd c:\Users\lauri\Downloads\pdv
npm install
```

---

### ❌ "Port 3000 already in use"

**Causa:** Servidor já está rodando em outra janela

**Solução:**
- Feche outros terminais que estejam rodando o servidor
- Ou mude a porta no `proxy-server.js`

---

## 📊 TESTAR SE ESTÁ FUNCIONANDO

### Teste 1: Verificar Servidor
Acesse no navegador: http://localhost:3000

Deve retornar erro 404 (normal, pois não tem rota raiz)

### Teste 2: Testar Endpoint
Abra o console do navegador (F12) e cole:
```javascript
fetch('http://localhost:3000/api/payment_methods', {
  headers: {
    'Authorization': 'Bearer SEU_TOKEN_AQUI'
  }
}).then(r => r.json()).then(console.log)
```

Deve retornar lista de métodos de pagamento.

### Teste 3: Testar PIX no PDV
1. Abra o PDV
2. Digite um valor
3. Clique em COBRAR
4. Escolha PIX (Automático)
5. QR Code deve aparecer sem erro! ✅

---

## 🎯 RESUMO RÁPIDO

```
1. Servidor proxy rodando? ✅ SIM (http://localhost:3000)
2. HTML configurado? ✅ SIM (useProxyServer: true)
3. Token configurado? ⚠️ VOCÊ PRECISA FAZER ISSO
4. Pronto para usar? ✅ SIM!
```

---

## 📞 PRECISA DE AJUDA?

- 📖 [README Completo](./README.md)
- 🌐 [Guia de Deploy](./DEPLOY.md)
- 🔧 [Solução CORS](./SOLUCAO-CORS.md)

---

**🎉 PARABÉNS! Você está usando API 100% com confirmação automática!**
