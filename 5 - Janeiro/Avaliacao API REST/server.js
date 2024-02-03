const express = require('express');
const bodyParser = require('body-parser');
const db = require("./db_connection");
var cors = require('cors');
var app = express();

db.connect();

app.use(cors());

app.use(bodyParser.urlencoded({ extended: false }));

app.use(bodyParser.json());

app.get('/pessoas', async (request, response) => {
    try {
        const sql = "SELECT * FROM pessoa;";
        const result = await db.query(sql);

        const pessoas = result.map(pessoa => ({
            id: pessoa.id,
            nome: pessoa.nome,
            telefone: pessoa.telefone,
            email: pessoa.email,
            estadoCivil: pessoa.estadocivil === 1 ? true : false
        }));

        return response.status(200).send(pessoas);
    } catch (error) {
        return response.status(500).send(error);
    }
});


app.get('/pessoas/:id', async (request, response) => {
    try {
        const sql = "SELECT * FROM pessoa WHERE id = ?;";
        const result = await db.query(sql, [request.params.id]);

        if (result && result.length > 0) {
            const pessoa = {
                id: result[0].id,
                nome: result[0].nome,
                telefone: result[0].telefone,
                email: result[0].email,
                estadoCivil: result[0].estadocivil === 1 ? true : false
            };

            return response.status(200).send(pessoa);
        } else {
            return response.status(404).send({ message: "Id não existe" });
        }
    } catch (error) {
        return response.status(500).send(error);
    }
});


app.post('/pessoas', async (request, response) => {
    try {
        const { nome, telefone, email, estadoCivil } = request.body;

        if (typeof nome !== 'string' || typeof telefone !== 'string' || typeof email !== 'string' || typeof estadoCivil !== 'boolean') {
            response.status(400).send({ message: "Tipos inválidos para os campos" });
            return;
        }

        const insertSql = "INSERT INTO pessoa (nome, telefone, email, estadocivil) VALUES (?,?,?,?);";

        const result = await db.query(insertSql, [nome, telefone, email, estadoCivil]);

        if (result && result.insertId) {
            const objInserido = {
                id: result.insertId,
                nome,
                telefone,
                email,
                estadoCivil,
            };
            
            response.status(201).send(objInserido);
            return;
        }
    } catch (error) {
        response.status(500).send({ message: "Erro interno no servidor" });
        return;
    }
});


app.put('/pessoas/:id', async (request, response) => {
    try {
        const id = request.params.id;
        const { nome, telefone, email, estadoCivil } = request.body;

        if (typeof nome !== 'string' || typeof telefone !== 'string' || typeof email !== 'string' || typeof estadoCivil !== 'boolean') {
            response.status(400).send({ message: "Tipos inválidos para os campos" });
            return;
        }

        const updateSql = "UPDATE pessoa SET nome = ?, telefone = ?, email = ?, estadocivil = ? WHERE id = ?;";
        const result = await db.query(updateSql, [nome, telefone, email, estadoCivil, id]);

        if (result.affectedRows == 0) {
            response.status(404).send({ message: "ID não existe" });
            return;
        }


        if (result && result.affectedRows > 0) {
            const updatedObject = {
                id,
                nome,
                telefone,
                email,
                estadoCivil
            };
            response.status(200).send(updatedObject);
            return;
        }
    } catch (error) {
         response.status(500).send({ message: "Erro interno no servidor" });
         return;
    }
});

app.delete('/pessoas/:id', async (request, response) => {
    try {
        const id = request.params.id;
        const deleteSql = "DELETE FROM pessoa WHERE id = ?;";
        const result = await db.query(deleteSql, [id]);

        if (result && result.affectedRows > 0) {
            response.status(200).send({ message: "OK - Cadastro Excluido" });
            return;
        }

        if (result.affectedRows == 0) {
            response.status(404).send({ message: "ID não encontrado" });
            return;
        }
    } catch (error) {
        response.status(500).send({ message: "Erro interno no servidor" });
        return;
    }
});


app.listen(3333, () => {
    console.log("Server ok");
}).on('error', function (err) {
    console.log(`Falhou: ${err}`);
});
