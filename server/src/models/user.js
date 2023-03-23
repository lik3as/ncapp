import {Sequelize, DataTypes, Model} from 'sequelize';
import con from '../db/index.js'

class User extends Model{}
User.init({
  pkUser: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nameUser: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: true,
  },
  pswUser: {
    type: DataTypes.STRING,
    allowNull: true,
  }
}, {
    sequelize: con,
    modelName: 'users'
  }
);
export default User;
