import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class Item extends Model {}
Item.init({
  pkItem: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  serialItem: {
    type: DataTypes.STRING
  },
  serialCaixa: {
    type: DataTypes.STRING
  },
  desc: {
    type: DataTypes.STRING
  }
}, {
    sequelize: con,
    tableName: 'item'
  }
);

export default Item;

