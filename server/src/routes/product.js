import Router from 'express'
import db from '../db/connection.js'
const router = Router();

const query_product = "SELECT * FROM Products WHERE " +
  "Products.serialProd = ?;"
const ins_product = "INSERT INTO Products (serialProd, nameProd, " +
  "typeProd, stateProd, avaliable) " +
  "VALUES " +
  "(?, ?, ?, ?, ?);"
const query_boxDrone = "SELECT Products.* FROM Products, BoxDrone WHERE " +
  "Products.serialProd = ("+
  " SELECT Products.pkProd FROM Products " +
  " WHERE Products.serialProd = ? )" +
  " AND Products.pkProd = BoxDrone.fkBox;"

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
    req.body.avaliable
  ], (err, result) => {
      if (err) throw err;
      console.log(result);
    })
});

router.get('/linked/:type/:serial', (req, res) => {
  console.log(`link of type => ${req.type}`);
  switch(req.type){
    case ('Drone') : {
      db.query(query_boxDrone, [req.serial], (err, rows, fields) => {
        if (err) throw err;
        res.json(rows);
      });
    }
  }

});

export default router;
