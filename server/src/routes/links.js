import Router from 'express';
import db from '../db/connection.js';
const router = Router();

const get_boxDrone = "SELECT Products.* FROM Products, BoxDrone WHERE " +
  " Products.serialProd = ("+
  " SELECT Products.pkProd FROM Products " +
  " WHERE Products.serialProd = ? )" +
  " AND Products.pkProd = BoxDrone.fkBox;";
 

router.get('/linked/:type/:serial', (req, res) => {
  console.log(`link of type => ${req.type}`);
  switch(req.type){
    case ('Drone') : {
      db.query(get_boxDrone, [req.serial], (err, rows, fields) => {
        if (err) throw err;
        res.json(rows);
      });
      break;
    }
  }
});

router.post('/linked/:type', (req, res) => {
  if (req.type == 'BoxDrone'){
    parentName = 'pkBox',
    childName = 'pkBox'
  }

  const ins_query = `INSERT INTO ${req.type}(${req.parentName}, ${req.childName}) 
    VALUES (?, ?);`;

  db.query(ins_query , [req.body.pkParent, req.body.pkChild], (err, result) => {
    if (err) throw err;
    console.log(result);
  });
});

export default router;
