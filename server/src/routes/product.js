import Router from 'express'
import db from '../db/connection.js'
const router = Router();

const query_product = "SELECT * FROM Products WHERE " +
  "Products.serialProd = ?;";
const ins_product = "INSERT INTO Products (serialProd, nameProd, " +
  "typeProd, stateProd, available) " +
  "VALUES " +
  "(?, ?, ?, ?, ?);";

router.get('/products/:serial', (req, res) => {
  db.query(query_product, [req.params.serial], (err, rows, field) => {
    if (err) throw err;
    res.json(rows[0]);
    console.log(rows[0]);
  });
});

router.post('/products', (req, res) => {
  console.log("products post access");
  db.query(ins_product, [
    req.body.serialProd,
    req.body.nameProd,
    req.body.typeProd,
    req.body.stateProd,
    req.body.available
  ], (err, result) => {
      if (err) throw err;
      console.log(result);
    })
});


export default router;
