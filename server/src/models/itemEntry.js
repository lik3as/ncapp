import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemEntry extends Model {}
ItemEntry.init({
  pkItemEntry: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  date: {
    type: DataTypes.DATE
  }
}, {
    sequelize: con,
    tableName: 'itemEntries'
  }
);

export default ItemEntry;
