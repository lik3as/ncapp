import Router from 'express';
import ctrl from '../controllers/userController.js';
const router = Router();

router.get('/users/:username/:userpsw', ctrl.createUser);

export default router;
