import {default as Nfe} from '../nfe.js';
import {default as Categorie} from '../categorie.js';
import {default as Client} from '../client.js';
import {default as ClientType} from '../clientType.js';
import {default as Item} from '../item.js';
import {default as ItemEntry} from '../itemEntry.js';
import {default as ItemEntryOfc} from '../itemEntryOfc.js';
import {default as ItemLeave} from '../itemLeave.js';
import {default as ItemState} from '../itemState.js';
import {default as User} from '../user.js';
import sequelize from '../../db/index.js';

//---------------------Entry----------------------
Nfe.hasOne(ItemEntry, {
  foreignKey: 'fkNfe'
});

Item.hasOne(ItemEntry, {
  foreignKey: 'fkItem'
});

//---------------------Leave----------------------
Nfe.hasOne(ItemLeave, {
  foreignKey: 'fkNfe'
});

Item.hasOne(ItemLeave, {
  foreignKey: 'fkItem'
});

Client.hasMany(ItemLeave, {
  foreignKey: 'fkClient'
});

//---------------------Item-----------------------
Categorie.hasOne(Item, {
  foreignKey: 'fkCat'
});

ItemState.hasOne(Item, {
  foreignKey: 'fkState'
});

//--------------------EntryOfc--------------------

Item.hasMany(ItemEntryOfc, {
  foreignKey: 'fkItem'
});

ClientType.hasOne(ItemEntryOfc, {
  foreignKey: 'fkCliType'
});

sequelize
  .query('SET FOREIGN_KEY_CHECKS = 1', {raw: true})
  .then(function(results) {  
    sequelize.sync({force: false});
  });

export {Item, ItemLeave, ItemEntryOfc, ItemEntry,
ItemState, Nfe, Client, ClientType, Categorie, User};
