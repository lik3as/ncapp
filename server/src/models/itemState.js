import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemState extends Model {}
ItemState.init({
  pkItemState:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  state: {
    type: DataTypes.STRING
  }
}, {
    sequelize: con,
    tableName: 'itemStates'
  }
);

export default ItemState;
