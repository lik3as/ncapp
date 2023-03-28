import {ItemEntry} from '../models/associations/modelExports.js';

export default {
  async createEntry(req, res, next){
    if(req.get('update') == "true")
      return next();
    else{
      const entry = await ItemEntry.create(req.body);
      return res.json(entry);
    }
  },

  async updateEntry(req, res){
    const entry_json = {
      fkItem: req.body.fkItem,
      fkNfe: req.body.fkNfe,
      date: req.body.date
    }
    const entry = await ItemEntry.update(entry_json, {
      where: {
        pkItemEntry: req.body.pkItemEntry
      }
    });
    return res.json(entry);
  },
  
  async readEntry(req, res, next){
    if(req.params.pk == undefined)
      return next('route');
    else{
      const pk = req.params.pk;
      const entry = await ItemEntry.findByPk(pk);
      return res.json(entry);
    }
  },

  async readEntries(req, res){
    const entries = ItemEntry.findAll();
    return res.json(entries);
  }
};
