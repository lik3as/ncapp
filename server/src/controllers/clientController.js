import Client from '../models/client.js'

export default {
  async readClient(req, res, next){
    if(typeof req.params.name == undefined)
      next();
    else{
      const client = await Client.findAll({
        where: {
          nome: req.params.name
        }
      });
      return res.json(client); 
    }
  },

  async readClients(req, res){
    const clients = await Client.findAll();

    return res.json(clients);
  },
  
  async createClient(req, res, next){
    if(req.header.update == "true")
      next();

    else {
    const client_json = req.body;  
    const client = await Client.create(client_json);

    return res.json(client);
    }
  },

  async updateClient(req, res){
    const client_json = {
      nome : req.body.nome,
      telefone : req.body.telefone,
      cep: req.body.cep,
      uf : req.body.uf,
      cidade : req.body.cidade,
      email : req.body.email
    };

    return await Client.update(client_json, {
      where: {
        pkCli: req.body.pkCli
      }
    })
  },

}
