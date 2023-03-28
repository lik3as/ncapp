import {ClientType} from '../models/associations/modelExports.js';

export default {
  async getTypes(req, res){
    const types = await ClientType.findAll();
    return  res.json(types);
  }
}
