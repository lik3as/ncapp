import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ClientType extends Model {};
ClientType.init({
  pkCliType: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  cliType: {
    type: DataTypes.STRING,
  }
}, {
    sequelize: con,
    modelName: 'clientType'
  }
);

export default ClientType;
