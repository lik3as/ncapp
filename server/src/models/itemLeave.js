import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemLeave extends Model {}
ItemLeave.init({
  pkLeave: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  fkNfe: {
    type: DataTypes.INTEGER,
  },
  fkCli: {
    type: DataTypes.INTEGER
  },
  fkItem: {
    type: DataTypes.INTEGER
  },
  data: {
    type: DataTypes.DATE
  },
}, {
    sequelize: con,
    tableName: 'itemLeave'
  }
);

export default ItemLeave;
