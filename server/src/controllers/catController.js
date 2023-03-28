import {Categorie} from '../models/associations/modelExports.js';

export default {
  async getCategories(req, res){
    const categories = await Categorie.findAll();
    return res.json(categories);
  }
}
