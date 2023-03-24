import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class ItemEntryOfc extends Model {}
ItemEntryOfc.init({

}, {
    sequelize: con,
    tableName: 'itemEntriesOfc'
  }
);
