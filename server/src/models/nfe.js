import {Model, DataTypes} from 'sequelize';
import con from '../db/index.js';

class Nfe extends Model {}
Nfe.init({
  pkNfe: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nfe: {
    type: DataTypes.STRING,
  },
  cfop: {
    type: DataTypes.STRING,
  },
  cpf: {
    type: DataTypes.STRING
  },
  cnpj: {
    type: DataTypes.STRING
  },
  desc: {
    type: DataTypes.STRING
  }
}, {
    sequelize: con,
    tableName: 'nfes'
  }
);

export default Nfe;
