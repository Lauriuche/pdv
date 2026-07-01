# 💳 Terminal PDV - Sistema de Ponto de Venda

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/seu-usuario/pdv)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-v18+-brightgreen?logo=node.js)](https://nodejs.org)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**Sistema completo de PDV com integração PIX via MercadoPago**

[🚀 Demo Online](#) • [📖 Documentação](./QUICKSTART.md) • [🐛 Reportar Bug](../../issues) • [💡 Sugerir Feature](../../issues)

![Terminal PDV Preview](https://via.placeholder.com/800x450/232935/22c55e?text=Terminal+PDV)

</div>

---

## ✨ Funcionalidades

<table>
<tr>
<td width="50%">

### 💳 Pagamentos
- ✅ **PIX Automático** (MercadoPago)
- ✅ **PIX Nativo** (Chave PIX)
- ✅ **Cartão Crédito/Débito**
- ✅ **Dinheiro com troco**
- ✅ **Confirmação automática**

### 📊 Gestão
- 📈 Histórico completo
- 💾 Exportar CSV
- 🖨️ Comprovantes
- 📱 WhatsApp
- 📊 Estatísticas

</td>
<td width="50%">

### 🎨 Interface
- 📱 100% Responsivo
- 🌙 Temas personalizáveis
- ⌨️ Teclado virtual
- 🔊 Feedback sonoro
- 🖥️ Protetor de tela

### 🔒 Segurança
- 🔐 PIN administrador
- 🔄 Backup nuvem
- 🌐 Funciona offline
- ⚡ Rápido e estável

</td>
</tr>
</table>

---

## 🚀 Quick Start

### ⚡ Opção 1: Instalação Rápida (Windows)

```cmd
1. Baixe o projeto
2. Dê duplo clique em: INICIAR-PROXY.bat
3. Abra index.html no navegador
4. Pronto! 🎉
```

### 🐧 Opção 2: Instalação (Mac/Linux)

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/pdv.git
cd pdv

# Instale dependências
npm install

# Inicie o servidor
npm start

# Abra index.html no navegador
```

### 📖 Guia Completo
👉 **[QUICKSTART.md](./QUICKSTART.md)** - Guia passo a passo detalhado

---

## 🌐 Deploy

### GitHub Pages (Grátis)
```bash
# Configure automaticamente
./SETUP-GITHUB.bat  # Windows
# ou
./setup-github.sh   # Mac/Linux

# Seu PDV estará em:
# https://seu-usuario.github.io/pdv
```

### Outras Plataformas

<table>
<tr>
<th>Plataforma</th>
<th>Frontend</th>
<th>Backend</th>
<th>Preço</th>
<th>Guia</th>
</tr>
<tr>
<td><strong>Railway</strong></td>
<td>✅</td>
<td>✅</td>
<td>Grátis*</td>
<td><a href="./DEPLOY.md#railway">📖</a></td>
</tr>
<tr>
<td><strong>Vercel</strong></td>
<td>✅</td>
<td>✅</td>
<td>Grátis</td>
<td><a href="./DEPLOY.md#vercel">📖</a></td>
</tr>
<tr>
<td><strong>Render</strong></td>
<td>✅</td>
<td>✅</td>
<td>Grátis</td>
<td><a href="./DEPLOY.md#render">📖</a></td>
</tr>
<tr>
<td><strong>Netlify</strong></td>
<td>✅</td>
<td>❌</td>
<td>Grátis</td>
<td><a href="./DEPLOY.md#netlify">📖</a></td>
</tr>
</table>

*Railway: $5 crédito grátis/mês

👉 **[DEPLOY.md](./DEPLOY.md)** - Guia completo de deploy

---

## 📁 Estrutura do Projeto

```
pdv/
├── 📄 index.html              # Interface principal do PDV
├── 🔧 proxy-server.js         # Servidor proxy (resolve CORS)
├── 📦 package.json            # Dependências Node.js
├── 🚀 INICIAR-PROXY.bat       # Iniciar proxy (Windows)
├── 🐧 start-proxy.sh          # Iniciar proxy (Mac/Linux)
├── 📖 README.md               # Esta documentação
├── ⚡ QUICKSTART.md           # Guia rápido de início
├── 🌐 DEPLOY.md               # Guia de deploy
├── 🔧 SOLUCAO-CORS.md         # Resolver problemas CORS
├── 🤝 CONTRIBUTING.md         # Como contribuir
├── 📜 LICENSE                 # Licença MIT
├── 🐳 Dockerfile              # Container Docker
├── ☁️ vercel.json             # Config Vercel
└── 🚂 Procfile                # Config Heroku
```

---

## ⚙️ Configuração

### 1️⃣ Configuração Básica

Abra o PDV → Clique em ⚙️ → PIN: `0000`

### 2️⃣ Opção A: Com API MercadoPago (Recomendado)

1. Obtenha seu token em: https://www.mercadopago.com.br/developers
2. Cole no campo "Access Token"
3. Clique em "Testar Token"
4. Salve! ✅

**Vantagens:** Confirmação automática, verificação em tempo real

### 3️⃣ Opção B: PIX Nativo (Sem API)

1. Insira sua Chave PIX (CPF, Email, etc)
2. Salve! ✅

**Vantagens:** Funciona offline, sem dependências

---

## 🔧 Tecnologias

<div align="center">

| Frontend | Backend | Deploy |
|:--------:|:-------:|:------:|
| ![HTML5](https://img.shields.io/badge/-HTML5-E34F26?logo=html5&logoColor=white) | ![Node.js](https://img.shields.io/badge/-Node.js-339933?logo=node.js&logoColor=white) | ![Vercel](https://img.shields.io/badge/-Vercel-000000?logo=vercel&logoColor=white) |
| ![CSS3](https://img.shields.io/badge/-CSS3-1572B6?logo=css3&logoColor=white) | ![Express](https://img.shields.io/badge/-Express-000000?logo=express&logoColor=white) | ![Railway](https://img.shields.io/badge/-Railway-0B0D0E?logo=railway&logoColor=white) |
| ![JavaScript](https://img.shields.io/badge/-JavaScript-F7DF1E?logo=javascript&logoColor=black) | ![CORS](https://img.shields.io/badge/-CORS-FF6C37?logo=cors&logoColor=white) | ![GitHub Pages](https://img.shields.io/badge/-GitHub%20Pages-222222?logo=github&logoColor=white) |
| ![Tailwind CSS](https://img.shields.io/badge/-Tailwind-38B2AC?logo=tailwind-css&logoColor=white) | | ![Docker](https://img.shields.io/badge/-Docker-2496ED?logo=docker&logoColor=white) |

</div>

---

## 📸 Screenshots

<details>
<summary>🖼️ Ver capturas de tela</summary>

### Tela Principal
![Tela Principal](https://via.placeholder.com/600x400/232935/22c55e?text=Tela+Principal)

### Pagamento PIX
![Pagamento PIX](https://via.placeholder.com/600x400/232935/22c55e?text=PIX)

### Configurações
![Configurações](https://via.placeholder.com/600x400/232935/22c55e?text=Configuracoes)

### Histórico
![Histórico](https://via.placeholder.com/600x400/232935/22c55e?text=Historico)

</details>

---

## 🐛 Problemas Comuns

<details>
<summary>❌ "Erro CORS ao gerar PIX"</summary>

**Solução:**
1. Inicie o servidor proxy: `npm start`
2. Ou configure PIX Nativo com sua chave
3. [Ver guia completo](./SOLUCAO-CORS.md)

</details>

<details>
<summary>❌ "Token inválido"</summary>

**Solução:**
1. Verifique se copiou o token completo
2. Confirme se é token de teste ou produção
3. Teste em: https://www.mercadopago.com.br/developers

</details>

<details>
<summary>❌ "API bloqueada pelo navegador"</summary>

**Solução:**
1. O servidor proxy não está rodando
2. Execute: `node proxy-server.js`
3. Ou use `INICIAR-PROXY.bat`

</details>

👉 **[SOLUCAO-CORS.md](./SOLUCAO-CORS.md)** - Todas as soluções detalhadas

---

## 🤝 Como Contribuir

Contribuições são bem-vindas! 🎉

1. Fork o projeto
2. Crie uma branch: `git checkout -b feature/MinhaFeature`
3. Commit: `git commit -m 'feat: Minha nova feature'`
4. Push: `git push origin feature/MinhaFeature`
5. Abra um Pull Request

👉 **[CONTRIBUTING.md](./CONTRIBUTING.md)** - Guia completo de contribuição

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja [LICENSE](LICENSE) para mais detalhes.

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=seu-usuario/pdv&type=Date)](https://star-history.com/#seu-usuario/pdv&Date)

---

## 💬 Comunidade

- 🐛 [Reportar Bug](../../issues/new?labels=bug)
- 💡 [Sugerir Feature](../../issues/new?labels=enhancement)
- 💬 [Discussões](../../discussions)
- 📧 Email: seu-email@exemplo.com

---

## 🙏 Agradecimentos

- [MercadoPago](https://www.mercadopago.com.br) - API de pagamentos
- [TailwindCSS](https://tailwindcss.com) - Framework CSS
- [Lucide Icons](https://lucide.dev) - Ícones
- [QRCode.js](https://github.com/davidshimjs/qrcodejs) - Gerador de QR Code

---

<div align="center">

**Desenvolvido com ❤️ para facilitar vendas**

⭐ **Se este projeto foi útil, deixe uma estrela!** ⭐

[![GitHub stars](https://img.shields.io/github/stars/seu-usuario/pdv?style=social)](../../stargazers)
[![GitHub forks](https://img.shields.io/github/forks/seu-usuario/pdv?style=social)](../../network/members)

</div>
