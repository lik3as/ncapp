import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemLeave extends Model {}
ItemLeave.init({

}, {
    sequelize: con,
    tableName: 'itemLeave'
  }
);
