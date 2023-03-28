import ItemLeave from '../models/itemLeave.js'

export default {
  async createLeave(req, res, next){
    if(req.get('update') == true)
      next();
    else{
      const leave = ItemLeave.create(req.body);
      return res.json(leave);
    }
  },

  async updateLeave(req, res){
    const leave_json = {
      fkNfe: req.body.fkNfe,
      fkCli: req.body.fkCli,
      fkItem: req.bodyfkItem,
      data: req.body.data
    }
    const leave = await ItemLeave.update(leave_json, {
      where: {
        pkLeave: req.body.pkLeave
      }
    });
    return res.json(leave);

  },

  async readLeave(req, res, next){
    if(typeof req.params.pk == undefined)
      next();
    else{
      const pk = req.body.pk;
      const leave = await ItemLeave.findByPk(pk);
      return res.json(leave);
    }
  },

  async readLeaves(req, res){
    const leave = await ItemLeave.findAll();
    return res.json(leave);
  }
}
