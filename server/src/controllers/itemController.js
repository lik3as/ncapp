import Item from '../models/item.js'

export default {
  async readItem(req, res, next){
    if(typeof req.params.pk == undefined)
      next('route');
    else {
      const item = Item.findByPk(req.params.pk);
      return res.json(item);
    }
  },

  async readItems(req, res){
    const items = Item.findAll();
    return res.json(items);
  },

  async createItem(req, res, next){
    if(req.header.update == "true")
      next();
    else{
      const item_json = req.body;
      const item = Item.create(item_json)
      return res.json(item);
    }
  },
  
  async updateItem(req, res){
    const item_json = {
      fkCat: req.body.fkCat,
      fkState: req.body.fkState,
      serialItem: req.body.serialItem,
      serialCaixa: req.body.serialCaixa,
      desc: req.body.desc
    }

    const item = Item.update({item_json}, {
      where: {
        pkItem: req.body.pkItem
      }
    });

    return res.json(item);
  }
}
