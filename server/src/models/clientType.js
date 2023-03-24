import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ClientType extends Model {};
ClientType.init({
  
}, {
    sequelize: con,
    modelName: 'clientType'
  }
);
