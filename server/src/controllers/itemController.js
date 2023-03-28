import {Item} from '../models/associations/modelExports.js';

export default {
  async readItem(req, res, next){
    if(typeof req.params.pk == undefined)
      next('route');
    else {
      const item = await Item.findByPk(req.params.pk);
      return res.json(item);
    }
  },

  async readItems(req, res){
    const items = await Item.findAll();
    return res.json(items);
  },

  async createItem(req, res, next){
    console.log('REQ HEADER' + req.get('update'));
    if(req.get('update') == "true")
      return next();
    else{
      const item_json = req.body;
      const item = await Item.create(item_json)
      return res.json(item);
    }
  },
  
  async updateItem(req, res){
    console.log('UPDATE ITEM');
    const item_json = {
      fkCat: req.body.fkCat,
      fkState: req.body.fkState,
      serialItem: req.body.serialItem,
      serialCaixa: req.body.serialCaixa,
      desc: req.body.desc
    }

    const item = await Item.update(item_json, {
      where: {
        pkItem: req.body.pkItem
      }
    });

    return res.json(item);
  }
}
