# 🔧 SOLUÇÃO PARA ERRO DE CORS NO PIX

## 🚨 O que é o erro CORS?

CORS (Cross-Origin Resource Sharing) é uma política de segurança dos navegadores que **bloqueia requisições JavaScript** feitas diretamente do frontend para APIs de outros domínios.

Quando você tenta chamar a API do MercadoPago diretamente do HTML (navegador), o navegador bloqueia por segurança, resultando em erro:

```
Access to fetch at 'https://api.mercadopago.com/v1/payments' from origin 'file://' has been blocked by CORS policy
```

---

## ✅ SOLUÇÃO 1: Usar Servidor Proxy (RECOMENDADO)

### Por que usar um proxy?
- ✅ Resolve o erro CORS definitivamente
- ✅ Mantém o token da API seguro (não exposto no frontend)
- ✅ Permite controle e logs das requisições
- ✅ Funciona em produção

### Como implementar:

#### Passo 1: Instalar Node.js
1. Baixe e instale: https://nodejs.org (versão LTS)
2. Verifique se instalou corretamente abrindo o terminal:
   ```bash
   node --version
   npm --version
   ```

#### Passo 2: Instalar dependências
No terminal, navegue até a pasta do projeto e execute:
```bash
cd c:\Users\lauri\Downloads\pdv
npm install express cors node-fetch
```

#### Passo 3: Iniciar o servidor proxy
```bash
node proxy-server.js
```

Você verá:
```
🚀 Servidor Proxy iniciado com sucesso!
📡 Rodando em: http://localhost:3000
```

#### Passo 4: Atualizar o HTML

No arquivo `index.html`, altere as URLs das chamadas fetch:

**ANTES:**
```javascript
const response = await fetch("https://api.mercadopago.com/v1/payments", {
```

**DEPOIS:**
```javascript
const response = await fetch("http://localhost:3000/api/payments", {
```

**ANTES:**
```javascript
const res = await fetch(`https://api.mercadopago.com/v1/payments/${paymentId}`, {
```

**DEPOIS:**
```javascript
const res = await fetch(`http://localhost:3000/api/payments/${paymentId}`, {
```

**ANTES:**
```javascript
const res = await fetch("https://api.mercadopago.com/v1/payment_methods", {
```

**DEPOIS:**
```javascript
const res = await fetch("http://localhost:3000/api/payment_methods", {
```

---

## ✅ SOLUÇÃO 2: Usar PIX Nativo (Plano B)

Se você não pode usar um servidor proxy, o sistema já tem um **Plano B** que gera PIX estático usando sua chave PIX.

### Como configurar:

1. Abra o PDV e clique em **Configurações** (ícone de engrenagem)
2. Digite o PIN de administrador (padrão: `0000`)
3. Na seção **"Chave PIX (Plano B)"**, insira sua chave PIX:
   - Pode ser: CPF, CNPJ, Email, Telefone ou Chave Aleatória
4. Salve as configurações

**Vantagens:**
- ✅ Não tem erro CORS (não usa API externa)
- ✅ Funciona offline
- ✅ Não precisa servidor

**Desvantagens:**
- ❌ Não confirma pagamento automaticamente
- ❌ Você precisa verificar manualmente se o cliente pagou
- ❌ Cliente precisa digitar o valor manualmente no app do banco

---

## ✅ SOLUÇÃO 3: Extensão CORS no Navegador (SÓ PARA TESTE)

⚠️ **ATENÇÃO:** Esta solução funciona apenas para **testes locais** e **NÃO deve ser usada em produção!**

### Chrome:
1. Instale a extensão: [CORS Unblock](https://chrome.google.com/webstore/detail/cors-unblock)
2. Ative a extensão
3. Recarregue a página do PDV

### Firefox:
1. Instale a extensão: [CORS Everywhere](https://addons.mozilla.org/pt-BR/firefox/addon/cors-everywhere/)
2. Ative a extensão
3. Recarregue a página do PDV

---

## 🎯 RESUMO - Qual solução usar?

| Situação | Solução Recomendada |
|----------|---------------------|
| **Uso profissional/comercial** | ✅ Servidor Proxy (Solução 1) |
| **Sem conhecimento técnico** | ✅ PIX Nativo (Solução 2) |
| **Apenas testes locais** | ⚠️ Extensão CORS (Solução 3) |

---

## 📞 Precisa de ajuda?

Se você seguiu as instruções e ainda está com erro:

1. Verifique se o servidor proxy está rodando
2. Verifique se alterou TODAS as URLs no HTML
3. Limpe o cache do navegador (Ctrl + Shift + Delete)
4. Verifique o console do navegador (F12) para ver o erro exato

---

## 🔐 Segurança

⚠️ **NUNCA** coloque seu token da API do MercadoPago diretamente no código HTML em produção!

O token deve estar apenas:
- ✅ No servidor proxy (backend)
- ✅ Em variáveis de ambiente
- ✅ Em configurações privadas

---

**Última atualização:** 30/06/2026
