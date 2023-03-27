import Nfe from '../models/nfe.js';

export default {
  async createNfe(req, res, next){
    if(req.get('update') == true)
      next();
    else{
      const nfe_json = req.body;
      const nfe = await Nfe.create(nfe_json);
      return res.json(nfe);
    }
  },

  async updateNfe(req, res){
    const nfe_json = {
      nfe: req.body.nfe,
      cfop: req.body.cfop,
      cpf: req.body.cpf,
      cnpj: req.body.cnpj,
      desc: req.body.desc
    }

    const nfe = await Nfe.update(nfe_json, {
      where: {
        pkNfe: req.body.pkNfe,
      }
    });
    return res.json(nfe);
  },
  
  async readNfe(req, res, next){
    if(req.params.pk == undefined)
      next('route')
    else{
      const pk = req.params.pk;
      const nfe = await Nfe.findByPk(pk);
      return res.json(nfe);
    }
  },

  async readNfes(req, res){
    const nfes = await Nfe.findAll();
    return res.json(nfes);
  }
};
