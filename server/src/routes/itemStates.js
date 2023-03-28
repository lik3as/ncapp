import Router from 'express';
import ctrl from '../controllers/itemStateController.js';
const router = new Router();

router.get('/states', ctrl.readStates);

export default router;
