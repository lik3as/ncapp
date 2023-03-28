import Sequelize from 'sequelize';
import config from '../config/database.js';

const sequelize = new Sequelize(config);

try{
  await sequelize.authenticate();
  console.log("DB Connected with Success");
} catch(err){
  console.log(err);
}

await sequelize.sync({force: false});

export default sequelize;
