# 🚀 Guia Completo de Deploy

Este documento explica como fazer deploy do Terminal PDV em diferentes plataformas.

---

## 📌 Antes de Começar

O projeto tem **duas partes**:
1. **Frontend (index.html)** - Interface do PDV (pode ser hospedado em qualquer lugar)
2. **Backend (proxy-server.js)** - Servidor proxy Node.js (resolve CORS)

Você pode:
- ✅ Hospedar apenas o frontend (sem API automática, usa PIX Nativo)
- ✅ Hospedar frontend + backend (com API automática completa)

---

## 🌐 GitHub Pages (Apenas Frontend)

### Passo a Passo:

1. **Faça push do código para o GitHub:**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/seu-usuario/pdv.git
git push -u origin main
```

2. **Ative GitHub Pages:**
   - Vá em: `Settings` → `Pages`
   - Source: `Deploy from branch`
   - Branch: `main` → `/root`
   - Clique em `Save`

3. **Acesse seu PDV:**
   - URL: `https://seu-usuario.github.io/pdv`

### ⚠️ Limitações:
- Sem API automática do MercadoPago (erro CORS)
- Use PIX Nativo (com chave PIX) nas configurações
- Ou hospede o backend separadamente (veja abaixo)

---

## 🚂 Railway (Backend Grátis - Recomendado)

### Por que Railway?
- ✅ Grátis até 5$ de crédito/mês
- ✅ Deploy automático via GitHub
- ✅ HTTPS incluído
- ✅ Fácil configuração

### Passo a Passo:

1. **Crie conta:** https://railway.app
2. **Clique em:** `New Project` → `Deploy from GitHub repo`
3. **Conecte seu repositório:** Autorize e selecione `pdv`
4. **Configure:**
   - Railway detecta automaticamente Node.js
   - Start Command: `npm start`
   - Build Command: `npm install`
5. **Adicione variáveis de ambiente:**
   - `PORT` = `3000`
   - `NODE_ENV` = `production`
6. **Deploy!** Railway gerará uma URL tipo: `pdv-proxy.up.railway.app`

### Atualize o HTML:

No `index.html`, altere:
```javascript
proxyUrl: "https://pdv-proxy.up.railway.app"
```

---

## 🔷 Vercel (Frontend + Backend)

### Vantagens:
- ✅ 100% grátis
- ✅ Deploy instantâneo
- ✅ HTTPS automático
- ✅ CDN global

### Passo a Passo:

1. **Instale Vercel CLI:**
```bash
npm install -g vercel
```

2. **Faça login:**
```bash
vercel login
```

3. **Deploy:**
```bash
vercel
```

4. **Production:**
```bash
vercel --prod
```

Vercel retornará uma URL tipo: `pdv.vercel.app`

### ⚠️ Observação:
O arquivo `vercel.json` já está configurado!

---

## 🟣 Heroku (Backend)

### Passo a Passo:

1. **Instale Heroku CLI:** https://devcenter.heroku.com/articles/heroku-cli

2. **Login:**
```bash
heroku login
```

3. **Crie o app:**
```bash
heroku create seu-pdv-proxy
```

4. **Configure variáveis:**
```bash
heroku config:set NODE_ENV=production
```

5. **Deploy:**
```bash
git push heroku main
```

6. **Abra:**
```bash
heroku open
```

URL: `https://seu-pdv-proxy.herokuapp.com`

---

## 🟢 Render (Backend)

### Passo a Passo:

1. **Acesse:** https://render.com
2. **Clique em:** `New` → `Web Service`
3. **Conecte:** Seu repositório GitHub
4. **Configure:**
   - Name: `pdv-proxy`
   - Build Command: `npm install`
   - Start Command: `npm start`
   - Instance Type: `Free`
5. **Variáveis de ambiente:**
   - `PORT` (Render define automaticamente)
   - `NODE_ENV` = `production`
6. **Deploy!**

URL: `https://pdv-proxy.onrender.com`

### ⚠️ Nota:
Render Free dorme após 15 min de inatividade. Primeira requisição pode demorar.

---

## 🟠 Netlify (Frontend)

### Passo a Passo:

1. **Acesse:** https://netlify.com
2. **Arraste e solte:** A pasta `pdv` no Netlify Drop
3. **Ou conecte:** Via GitHub para deploy automático

URL: `https://seu-pdv.netlify.app`

### ⚠️ Limitação:
Netlify não suporta backend Node.js no plano Free. Use para frontend apenas.

---

## 🐳 Docker (Auto-hospedagem)

### Dockerfile (já incluído):

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Deploy:

```bash
# Build
docker build -t pdv-proxy .

# Run
docker run -p 3000:3000 -e NODE_ENV=production pdv-proxy
```

---

## 📊 Comparação de Plataformas

| Plataforma | Preço | Frontend | Backend | HTTPS | Deploy Auto | Melhor Para |
|------------|-------|----------|---------|-------|-------------|-------------|
| **GitHub Pages** | Grátis | ✅ | ❌ | ✅ | ✅ | Frontend apenas |
| **Railway** | Grátis* | ✅ | ✅ | ✅ | ✅ | **Recomendado** |
| **Vercel** | Grátis | ✅ | ✅ | ✅ | ✅ | Full-stack |
| **Heroku** | Pago | ❌ | ✅ | ✅ | ✅ | Backend |
| **Render** | Grátis | ✅ | ✅ | ✅ | ✅ | Backend (lento) |
| **Netlify** | Grátis | ✅ | ❌ | ✅ | ✅ | Frontend |

*Railway: $5 de crédito grátis/mês

---

## 🎯 Configuração Recomendada

### Para Produção:

1. **Frontend:** GitHub Pages ou Netlify
2. **Backend:** Railway ou Render
3. **Alternativa Full-Stack:** Vercel

### Exemplo:

```
Frontend: https://seu-usuario.github.io/pdv
Backend:  https://pdv-proxy.up.railway.app
```

No `index.html`:
```javascript
proxyUrl: "https://pdv-proxy.up.railway.app"
```

---

## 🔒 Segurança

### Variáveis de Ambiente:

Nunca faça commit de tokens! Use variáveis de ambiente:

**Render/Railway/Heroku:**
```
MP_ACCESS_TOKEN_PROD=seu-token-aqui
NODE_ENV=production
```

**Vercel:**
```bash
vercel env add MP_ACCESS_TOKEN_PROD
```

---

## ✅ Checklist Final

Antes de fazer deploy:

- [ ] `.gitignore` configurado (não commitar `node_modules`)
- [ ] Tokens em variáveis de ambiente (não no código)
- [ ] README.md atualizado com suas URLs
- [ ] Testado localmente com `npm start`
- [ ] CORS configurado corretamente no proxy
- [ ] HTTPS habilitado na plataforma
- [ ] Frontend apontando para URL do backend correto

---

## 🆘 Problemas Comuns

### "Application Error" no Heroku
- Verifique: `heroku logs --tail`
- Certifique-se de ter `Procfile` correto

### Backend dormindo (Render Free)
- Primeira requisição demora ~30s
- Use plano pago ou pinger externo

### CORS Error mesmo com proxy
- Verifique se `proxyUrl` está correto no HTML
- Teste endpoint: `https://seu-proxy.com/api/payment_methods`

### 404 no GitHub Pages
- Certifique-se de usar branch `main` e pasta `/root`
- Aguarde ~5 minutos após ativar

---

## 📞 Precisa de Ajuda?

- 📖 [Documentação Completa](./README.md)
- 🐛 [Reportar Bug](https://github.com/seu-usuario/pdv/issues)
- 💬 [Discussões](https://github.com/seu-usuario/pdv/discussions)

---

**Boa sorte com seu deploy! 🚀**
