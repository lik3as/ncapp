import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class Item extends Model {}
Item.init({
  
}, {
    sequelize: con,
    tableName: 'Item'
  }
);

