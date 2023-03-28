import {ItemEntryOfc} from '../models/associations/modelExports.js';;

export default {
  async createEntryOfc(req, res, next){
    if(req.get('update') == "true") 
      next();
    else{
      const entry_ofc = await ItemEntryOfc.create(req.body);
      return res.json(entry_ofc);
    }
  },

  async updateEntryOfc(req, res){
    const entry_ofc_json = {
      fkItem: req.body.fkItem,
      fkType: req.body.fkType,
      fkCliType: req.body.fkCliType,
      data: req.body.data,
      desc: req.body.desc
    }
    const entry_ofc = await ItemEntryOfc.update(entry_ofc_json, {
      where: {
        pkEntryOfc: req.body.pkEntryOfc
      }
    });
    return res.json(entry_ofc);
  },

  async readEntryOfc(req, res){
    if(typeof req.params.pk == undefined)
      next('route');
    else{
      const entry_ofc = await ItemEntryOfc.findByPk(req.body.pk);
      return res.json(entry_ofc);
    }
  },

  async readEntriesOfc(req, res){
    const entries_ofc = await ItemEntryOfc.findAll();
    return res.json(entries_ofc);
  }
};
