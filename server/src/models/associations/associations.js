import {Nfe, Categorie, Client, ClientType,
Item, ItemEntry, ItemEntryOfc, ItemLeave,
ItemState, User} from './modelExports.js';

//---------------------Entry----------------------
ItemEntry.belongsTo(Nfe);
Nfe.hasOne(ItemEntry);

ItemEntry.belongsTo(Item);
Item.hasOne(ItemEntry);

//---------------------Leave----------------------
ItemLeave.belongsTo(Nfe);
Nfe.hasOne(ItemLeave);

ItemLeave.hasOne(Item);
Item.belongsTo(ItemLeave);

ItemLeave.belongsTo(Client);
Client.hasMany(ItemLeave);

//---------------------Item-----------------------
Item.belongsTo(Categorie);
Categorie.hasOne(Item);

Item.belongsTo(State);
State.hasOne(Item);

Item.hasMany(ItemEntryOfc);
ItemEntryOfc.belongsTo(Item);

//--------------------EntryOfc--------------------
ItemEntryOfc.belongsTo(Item);
Item.hasMany(ItemEntryOfc);
