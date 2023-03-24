import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class Nfe extends Model {}
Nfe.init({

}, {
    sequelize: con,
    tableName: 'nfes'
  }
);
