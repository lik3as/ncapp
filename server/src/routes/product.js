import Router from 'express'
import db from '../db/connection.js'
const router = Router();

const query_product = "SELECT * FROM Products WHERE " +
  "Products.serialProd = ?;"

router.post('/product', (req, res) => {
  db.query(query_product, [req.body.serialProd], (error, rows, field) => {
    res.json(rows[0]);
    console.log(rows[0]);
  });
});

export default router;
