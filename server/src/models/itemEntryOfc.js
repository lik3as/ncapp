import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemEntryOfc extends Model {}
ItemEntryOfc.init({
  pkEntryOfc: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  data: {
    type: DataTypes.DATE
  },
  desc: {
    type: DataTypes.STRING
  }
}, {
    sequelize: con,
    tableName: 'itemEntriesOfc'
  }
);

export default ItemEntryOfc;
