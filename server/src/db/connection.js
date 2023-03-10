import mysql from 'mysql'

const con = mysql.createConnection({
  host : 'localhost',
  user : 'root',
  password: 'MYSQLROOT3306',
  database: 'NCA'
});

con.connect((error) => {
  if(error) throw error;
  console.log('CONNECTION - OK!');
});

export default con;
