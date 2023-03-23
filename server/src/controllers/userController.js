import User from '../models/user.js'

export default {
  async createUser(req, res){
    const {nameUser, pswUser} = req.body;
    const user = await User.create({nameUser, pswUser}); 

    return res.json(user);
  },
  async readUser(req, res){
    const {nameUser} = req.body;
    const user = await User.findOne({
      where: {
        nameUser
      }
    }); 

    return res.json(user);
  }
}
