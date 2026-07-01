/**
 * SERVIDOR PROXY PARA EVITAR ERRO DE CORS
 * 
 * Este servidor Node.js atua como intermediário entre o frontend e a API do MercadoPago,
 * resolvendo problemas de CORS (Cross-Origin Resource Sharing).
 * 
 * INSTALAÇÃO:
 * 1. Instale o Node.js: https://nodejs.org
 * 2. Abra o terminal nesta pasta e execute: npm install express cors
 * 3. Inicie o servidor: node proxy-server.js
 * 4. O servidor ficará rodando em: http://localhost:3000
 * 
 * CONFIGURAÇÃO NO HTML:
 * Altere as URLs das chamadas fetch de:
 *   "https://api.mercadopago.com/v1/payments"
 * Para:
 *   "http://localhost:3000/api/payments"
 */

const express = require('express');
const cors = require('cors');
require('dotenv').config(); // Carrega variáveis de ambiente

const app = express();

// Configuração CORS - permite requisições do seu HTML
app.use(cors({
    origin: '*', // Em produção, especifique os domínios permitidos
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization', 'X-Idempotency-Key']
}));
app.use(express.json());

// Rota para criar pagamento PIX
app.post('/api/payments', async (req, res) => {
    try {
        const token = req.headers.authorization;
        
        if (!token) {
            return res.status(401).json({ error: 'Token de autorização não fornecido' });
        }

        // Faz a requisição para o MercadoPago
        const response = await fetch('https://api.mercadopago.com/v1/payments', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': token,
                'X-Idempotency-Key': req.headers['x-idempotency-key'] || generateIdempotencyKey()
            },
            body: JSON.stringify(req.body)
        });

        const data = await response.json();
        
        if (!response.ok) {
            return res.status(response.status).json(data);
        }

        res.json(data);
    } catch (error) {
        console.error('Erro no proxy:', error);
        res.status(500).json({ 
            error: 'Erro interno do servidor', 
            message: error.message 
        });
    }
});

// Rota para verificar status do pagamento
app.get('/api/payments/:id', async (req, res) => {
    try {
        const token = req.headers.authorization;
        const paymentId = req.params.id;

        if (!token) {
            return res.status(401).json({ error: 'Token de autorização não fornecido' });
        }

        const response = await fetch(`https://api.mercadopago.com/v1/payments/${paymentId}`, {
            method: 'GET',
            headers: {
                'Authorization': token
            }
        });

        const data = await response.json();
        
        if (!response.ok) {
            return res.status(response.status).json(data);
        }

        res.json(data);
    } catch (error) {
        console.error('Erro ao verificar pagamento:', error);
        res.status(500).json({ 
            error: 'Erro interno do servidor', 
            message: error.message 
        });
    }
});

// Rota para testar token (métodos de pagamento)
app.get('/api/payment_methods', async (req, res) => {
    try {
        const token = req.headers.authorization;

        if (!token) {
            return res.status(401).json({ error: 'Token de autorização não fornecido' });
        }

        const response = await fetch('https://api.mercadopago.com/v1/payment_methods', {
            method: 'GET',
            headers: {
                'Authorization': token
            }
        });

        const data = await response.json();
        
        if (!response.ok) {
            return res.status(response.status).json(data);
        }

        res.json(data);
    } catch (error) {
        console.error('Erro ao buscar métodos de pagamento:', error);
        res.status(500).json({ 
            error: 'Erro interno do servidor', 
            message: error.message 
        });
    }
});

// Função auxiliar para gerar chave de idempotência
function generateIdempotencyKey() {
    return 'IDM_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
}

// Inicia o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`\n🚀 Servidor Proxy iniciado com sucesso!`);
    console.log(`📡 Rodando em: http://localhost:${PORT}`);
    console.log(`🌍 Ambiente: ${process.env.NODE_ENV || 'development'}`);
    console.log(`\n✅ CORS configurado - Frontend pode fazer requisições`);
    console.log(`\n📝 Endpoints disponíveis:`);
    console.log(`   POST   http://localhost:${PORT}/api/payments`);
    console.log(`   GET    http://localhost:${PORT}/api/payments/:id`);
    console.log(`   GET    http://localhost:${PORT}/api/payment_methods`);
    console.log(`\n⚠️  Lembre-se de alterar as URLs no HTML para usar este proxy!\n`);
});
