import Router from 'express';
import db from '../db/connection.js'
const router = Router();

const auth_query = "SELECT * FROM Users WHERE Users.nameUser = ? " +
  "AND Users.pswUser = ?;";

router.get('/users', (req, res) => {
});

router.post('/users', (req, res) => {
  const user_login = {
    "name": req.body.nameUser,
    "psw": req.body.pswUser
  };
  

  db.query(auth_query, [user_login.name, user_login.psw],
    (error, rows, fields) => {
      if (error) throw error;
      res.json(rows[0]);
      console.log(rows[0]);
  });

});

export default router;
