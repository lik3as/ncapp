import Router from 'express';
import ctrl from '../controllers/userController.js';
const router = Router();

router.post('/users', ctrl.createUser);
router.get('/users/:nameUser', ctrl.readUser);

export default router;
