const express = require("express");
const app = express();
var cors = require('cors')

const port = 3131;
app.use(cors())
app.use(express.json({limit: '100mb'}));
app.use(express.urlencoded({limit: '100mb', extended: true, parameterLimit: 100000}));

const connection = require('./database.js');

//25 - 10 - 2023
const reformatDate = (date) => {
    const [day, month, year] = date.split("-")
    return `${year}-${month}-${day}`;

}

app.get("/", (req, res) => {
    res.json({ message: "ok" });
});

app.post("/clients", (req, res) => {

    const query = 'INSERT INTO backup_clients VALUES ?';

    const values = req.body
        .map(client => {
            return {
                ...client,
                link: JSON.stringify(client.link),
                edit_link: JSON.stringify(client.edit_link), //'Просмотреть',
                disableEditing: JSON.stringify([]),
                birthday: client.birthday === "0000-00-00" ? null : client.birthday,
                client_transaction_last_date: (client.client_transaction_last_date === "" || client.client_transaction_last_date === "0000-00-00")
                    ? null : client.client_transaction_last_date,
            }
        })
        .map(client => Object.values(client));

    connection.query(query, [values], (error, results, fields) => {
        if (error) {
            res.json({ message: "error" });
            console.error(error);
        } else {
            res.json({ message: "success" });
            console.log('Inserted successfully');
        }
    });

});

app.post("/checks", (req, res) => {
    const query = 'INSERT INTO backup_transactions VALUES ?';

    const values = req.body
        .map(transaction => {
            return {
                ...transaction,
                client_name: JSON.stringify(transaction.client_name),
                action_details: JSON.stringify(transaction.action_details),
                on_click: JSON.stringify(transaction.on_click),
                disableEditing: JSON.stringify(transaction.disableEditing),
                link_date_end: reformatDate(transaction.link_date_end),
                link_date_start: reformatDate(transaction.link_date_start),
                date_close: (!transaction.date_close) ? null : transaction.date_close
            }
        })
        .map(transaction => Object.values(transaction));

    connection.query(query, [values], (error, results, fields) => {
        if (error) {
            res.json({ message: "error" });
            console.error(error);
        } else {
            res.json({ message: "success" });
            console.log('Inserted successfully');
        }
    });

});


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});