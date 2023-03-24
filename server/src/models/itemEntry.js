import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemEntry extends Model {}
ItemEntry.init({
  pkItemEntry: {
    type: DataTypes.INTEGER,
  },
  fkItem: {
    type: DataTypes.INTEGER
  },
  fkNfe: {
    type: DataTypes.INTEGER
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
