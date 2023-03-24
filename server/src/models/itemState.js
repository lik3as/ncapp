import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemState extends Model {}
ItemState.init({

}, {
    sequelize: con,
    tableName: 'itemStates'
  }
);
