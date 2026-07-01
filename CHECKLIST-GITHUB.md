# ✅ Checklist - Subir para GitHub

Use este checklist para garantir que está tudo pronto antes de fazer deploy!

---

## 📋 Antes de Commitar

### 1. Arquivos Essenciais
- [ ] `index.html` - Interface principal
- [ ] `proxy-server.js` - Servidor backend
- [ ] `package.json` - Dependências configuradas
- [ ] `README.md` - Documentação atualizada
- [ ] `.gitignore` - Arquivos ignorados
- [ ] `LICENSE` - Licença MIT incluída

### 2. Segurança
- [ ] ⚠️ **IMPORTANTE:** Remover tokens e chaves sensíveis do código
- [ ] Verificar se `.env` está no `.gitignore`
- [ ] Criar `.env.example` com exemplo de configuração
- [ ] Não commitar `node_modules/`
- [ ] Não commitar arquivos de configuração local

### 3. Configuração
- [ ] `useProxyServer: true` no HTML (se usar proxy)
- [ ] `proxyUrl` apontando para localhost (será alterado no deploy)
- [ ] PIN padrão configurado (`0000`)
- [ ] Temas e cores ajustadas conforme preferência

### 4. Testes Locais
- [ ] Testado com `npm start` - servidor inicia corretamente
- [ ] Testado abertura do `index.html` no navegador
- [ ] PIX Automático funciona (com token de teste)
- [ ] PIX Nativo funciona (com chave PIX)
- [ ] Histórico de vendas salva e carrega
- [ ] Comprovantes geram corretamente
- [ ] Sem erros no console (F12)

---

## 🚀 Subindo para GitHub

### 5. Configuração do Git
- [ ] Git instalado (`git --version`)
- [ ] Configurado usuário: `git config user.name "Seu Nome"`
- [ ] Configurado email: `git config user.email "seu@email.com"`

### 6. Criar Repositório no GitHub
- [ ] Acessar: https://github.com/new
- [ ] Nome do repositório definido (ex: `pdv`)
- [ ] Descrição adicionada
- [ ] Repositório público (ou privado, sua escolha)
- [ ] NÃO marcar "Initialize with README" (já temos um!)

### 7. Fazer Upload

**Opção A - Usar script automático:**
```cmd
SETUP-GITHUB.bat     # Windows
```
```bash
./setup-github.sh    # Mac/Linux
```

**Opção B - Comandos manuais:**
```bash
git init
git add .
git commit -m "🚀 Terminal PDV - Versão 1.0"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/pdv.git
git push -u origin main
```

- [ ] Repositório inicializado
- [ ] Arquivos commitados
- [ ] Push realizado com sucesso
- [ ] Código visível no GitHub

---

## 🌐 Deploy e Configuração

### 8. GitHub Pages (Frontend)
- [ ] Acessar: `Settings` → `Pages`
- [ ] Source: `Deploy from branch`
- [ ] Branch: `main` → `/root`
- [ ] Salvar configuração
- [ ] Aguardar ~5 minutos
- [ ] Testar: `https://seu-usuario.github.io/pdv`

### 9. Deploy do Backend (Escolher uma opção)

**Opção 1 - Railway (Recomendado):**
- [ ] Conta criada em: https://railway.app
- [ ] Conectado repositório GitHub
- [ ] Deploy automático configurado
- [ ] Variáveis de ambiente configuradas
- [ ] URL do proxy anotada: `_________________`

**Opção 2 - Vercel:**
- [ ] Vercel CLI instalado: `npm install -g vercel`
- [ ] Login feito: `vercel login`
- [ ] Deploy executado: `vercel --prod`
- [ ] URL do proxy anotada: `_________________`

**Opção 3 - Render:**
- [ ] Conta criada em: https://render.com
- [ ] Web Service criado
- [ ] Repositório conectado
- [ ] Configurações definidas
- [ ] URL do proxy anotada: `_________________`

### 10. Atualizar Configurações
- [ ] Atualizar `proxyUrl` no HTML com URL do backend
- [ ] Fazer novo commit e push
- [ ] Testar integração frontend + backend
- [ ] Verificar se PIX Automático funciona online

---

## 📝 Documentação Final

### 11. Atualizar README
- [ ] Substituir `seu-usuario` pelo seu usuário GitHub
- [ ] Adicionar link do demo: `https://seu-usuario.github.io/pdv`
- [ ] Adicionar URL do proxy backend
- [ ] Adicionar screenshots (opcional)
- [ ] Testar todos os links

### 12. Criar Releases
- [ ] Ir em: `Releases` → `Create a new release`
- [ ] Tag: `v1.0.0`
- [ ] Título: `Versão 1.0 - Lançamento Inicial`
- [ ] Descrição: Listar funcionalidades principais
- [ ] Publicar release

### 13. Configurações do Repositório
- [ ] Adicionar descrição do repositório
- [ ] Adicionar tópicos/tags: `pdv`, `pix`, `mercadopago`, `nodejs`, `pos`
- [ ] Adicionar link do site
- [ ] Configurar Issues (se quiser receber feedback)
- [ ] Configurar Discussions (opcional)

---

## ✨ Pós-Deploy

### 14. Testes Finais
- [ ] Acessar URL do GitHub Pages
- [ ] Testar todas as funcionalidades
- [ ] Testar em diferentes navegadores:
  - [ ] Chrome
  - [ ] Firefox
  - [ ] Safari
  - [ ] Edge
- [ ] Testar em dispositivos móveis
- [ ] Verificar responsividade

### 15. Monitoramento
- [ ] Verificar logs do backend (se aplicável)
- [ ] Monitorar uso de recursos (Railway/Vercel/Render)
- [ ] Configurar alertas (opcional)
- [ ] Documentar quaisquer erros encontrados

### 16. Divulgação (Opcional)
- [ ] Compartilhar no LinkedIn
- [ ] Compartilhar no Twitter/X
- [ ] Postar em comunidades (Reddit, Discord, etc)
- [ ] Adicionar ao portfólio
- [ ] Atualizar currículo/CV

---

## 🔄 Manutenção Futura

### 17. Boas Práticas
- [ ] Fazer commits frequentes com mensagens claras
- [ ] Criar branches para novas features
- [ ] Testar localmente antes de fazer push
- [ ] Responder Issues abertas por usuários
- [ ] Manter dependências atualizadas: `npm update`
- [ ] Fazer backups regulares

---

## 🆘 Se Algo Der Errado

### Problemas Comuns:

**GitHub Pages não funciona:**
```bash
# Verificar se branch está correta
git branch

# Verificar se push foi bem-sucedido
git log
```

**Proxy não funciona no deploy:**
- Verificar logs da plataforma
- Confirmar variáveis de ambiente
- Testar endpoint: `https://seu-proxy.com/api/payment_methods`

**Frontend não conecta com backend:**
- Verificar CORS no proxy
- Confirmar URL do proxy no HTML
- Limpar cache do navegador (Ctrl + Shift + Delete)

---

## 📞 Precisa de Ajuda?

- 📖 [README Completo](./README.md)
- ⚡ [Quick Start](./QUICKSTART.md)
- 🌐 [Guia de Deploy](./DEPLOY.md)
- 🔧 [Solução CORS](./SOLUCAO-CORS.md)

---

## ✅ Status Final

Quando tudo estiver ✅, seu PDV estará **100% funcional no GitHub!** 🎉

**URLs para anotar:**
- GitHub Repo: `https://github.com/____________/____________`
- Frontend: `https://____________.github.io/____________`
- Backend: `https://____________.____________.com`

---

**Boa sorte com seu deploy! 🚀**
