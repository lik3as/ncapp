import {ItemState} from '../models/associations/modelExports.js';

export default {
  async readStates(req, res){
    const states = await ItemState.findAll();
    return res.json(states);
  }
}
