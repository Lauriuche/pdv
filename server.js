javascript
const express = require('express');
const cors = require('cors');
const crypto = require('crypto');

const app = express();

// O CORS é a magia aqui: permite que o seu painel HTML comunique com este servidor sem ser bloqueado
app.use(cors()); 
app.use(express.json());

// Rota 1: Gerar o PIX
app.post('/api/create-pix', async (req, res) => {
    const { amount, token } = req.body;
    try {
        const response = await fetch("https://api.mercadopago.com/v1/payments", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`,
                "X-Idempotency-Key": crypto.randomUUID()
            },
            body: JSON.stringify({
                transaction_amount: amount,
                description: "Venda PDV",
                payment_method_id: "pix",
                payer: {
                    email: "cliente@pdv.com",
                    first_name: "Cliente",
                    last_name: "Loja",
                    identification: { type: "CPF", number: "19119119100" }
                }
            })
        });
        const data = await response.json();
        res.status(response.status).json(data);
    } catch (error) {
        res.status(500).json({ error: "Erro interno no servidor." });
    }
});

// Rota 2: Verificar o estado do Pagamento
app.get('/api/check-pix/:id', async (req, res) => {
    const { id } = req.params;
    const token = req.headers.authorization;
    try {
        const response = await fetch(`https://api.mercadopago.com/v1/payments/${id}`, {
            headers: { 'Authorization': token }
        });
        const data = await response.json();
        res.status(response.status).json(data);
    } catch (error) {
        res.status(500).json({ error: "Erro ao verificar pagamento." });
    }
});

// Rota 3: Testar o Token
app.get('/api/test', async (req, res) => {
    const token = req.headers.authorization;
    try {
        const response = await fetch("https://api.mercadopago.com/v1/payment_methods", {
            headers: { 'Authorization': token }
        });
        const data = await response.json();
        res.status(response.status).json(data);
    } catch (error) {
        res.status(500).json({ error: "Erro ao testar token." });
    }
});

// Iniciar o Servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Backend rodando com sucesso na porta ${PORT}`);
});
