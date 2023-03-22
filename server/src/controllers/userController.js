import User from '../models/user.js'

export default {
  async createUser(req, res){
    const username = req.params.username;
    const userpsw = req.params.userpsw;
    const user = await User.create({username, userpsw}); 

    return res.json(user);
  },
}
