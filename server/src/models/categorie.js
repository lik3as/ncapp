import {Model, DataTypes} from 'sequelize'
import con from '../db/index.js'

class Categorie extends Model {}
Categorie.init({
  pkCat: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  categoria: {
    type: DataTypes.STRING
  }
}, {
    sequelize: con,
    tableName: 'categories'
  }
);

export default Categorie;
