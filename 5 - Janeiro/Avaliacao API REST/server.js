const express = require('express');
const bodyParser = require('body-parser');
const db = require("./db_connection");

const app = express();

db.connect();

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.get('/pessoas', async (request, response) => {
    try {
        const sql = "SELECT * FROM pessoa;";
        const result = await db.query(sql);
        return response.status(200).send(result);
    } catch (error) {
        return response.status(500).send(error);
    }
});

app.get('/pessoas/:id', async (request, response) => {
    try {
        const sql = "SELECT * FROM pessoa WHERE id = ?;";
        const result = await db.query(sql, [request.params.id]);

        if (result && result.length > 0) {
            return response.status(200).send(result[0]);
        } else {
            return response.status(404).send({ message: "Id não existe" });
        }
    } catch (error) {
        return response.status(500).send(error);
    }
});

app.post('/pessoas', async (request, response) => {
    try {
        const insertSql = "INSERT INTO pessoa (nome, telefone, email, estadocivil) VALUES (?,?,?,?);";

 

        const result = await db.query(insertSql, [
            request.body.nome,
            request.body.telefone,
            request.body.email,
            request.body.estadoCivil ? 1 : 0
        ]);

        if (!nome || !telefone || !email || estadoCivil === undefined || estadoCivil === null) {
            return response.status(400).send({ message: "Campo Inválido" });
        }

        if (result && result.insertId) {
            const objInserido = {
                id: result.insertId,
                nome: request.body.nome,
                telefone: request.body.telefone,
                email: request.body.email,
                estadoCivil: request.body.estadoCivil,
            };
            return response.status(201).send(objInserido);
        }
    } catch (error) {
        return response.status(500).send({ message: "Campo Inválido" });
    }
});

app.put('/pessoas/:id', async (request, response) => {
    try {
        const id = request.params.id;
        const checkExistenceSql = "SELECT * FROM pessoa WHERE id = ?;";
        const checkResult = await db.query(checkExistenceSql, [id]);

        if (!checkResult || checkResult.length === 0) {
            return response.status(404).send({ message: "ID não encontrado" });
        }


        const updateSql = "UPDATE pessoa SET nome = ?, telefone = ?, email = ?, estadocivil = ? WHERE id = ?;";
        const { nome, telefone, email, estadoCivil } = request.body;

        if (!nome || !telefone || !email || estadoCivil === undefined || estadoCivil === null) {
            return response.status(400).send({ message: "Campos obrigatórios ausentes ou inválidos" });
        }

        const result = await db.query(updateSql, [nome, telefone, email, estadoCivil, id]);

        if (result && result.affectedRows > 0) {
            const updatedObject = {
                id,
                nome,
                telefone,
                email,
                estadoCivil
            };
            return response.status(200).send(updatedObject);
        } else {
            return response.status(500).send({ message: "Falha ao realizar atualização" });
        }
    } catch (error) {
        return response.status(500).send({ message: "Falha ao realizar atualização" });
    }
});


app.listen(3333, () => {
    console.log("Server ok");
}).on('error', function (err) {
    console.log(`Falhou: ${err}`);
});
