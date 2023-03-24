import Router from 'express';
import ctrl from '../controllers/userController.js';
const router = Router();

router.get('/users/:nameUser', ctrl.readUser);
router.post('/users', ctrl.createUser);

export default router;
