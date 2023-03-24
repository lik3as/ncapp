import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemEntry extends Model {}
ItemEntry.init({

}, {
    sequelize: con,
    tableName: 'itemEntries'
  }
);
