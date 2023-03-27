import Router from 'express';
import ctrl from '../controllers/cliTypeController.js';
const router = new Router();

router.get('/ClientTypes', ctrl.getTypes);

export default router;
