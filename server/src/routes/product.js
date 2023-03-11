import Router from 'express'
import db from '../db/connection.js'
const router = Router();

const query_product = "SELECT * FROM Products WHERE " +
  "Products.serialProd = ?;"
const ins_product = "INSERT INTO Products "

router.get('/product/:serial', (req, res) => {
  db.query(query_product, [req.params.serial], (error, rows, field) => {
    res.json(rows[0]);
    console.log(rows[0]);
  });
});

router.post('/product', (req, res) => {
  db.query()
});

export default router;
