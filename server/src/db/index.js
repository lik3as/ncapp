import Sequelize from 'sequelize';
import config from '../config/database.js';
import User from '../models/user.js'

const sequelize = new Sequelize(config);

try{
  await sequelize.authenticate();
  console.log("DB Connected with Success");
} catch(err){
  console.log(err);
}

sequelize.sync({force: true});


export default sequelize;
