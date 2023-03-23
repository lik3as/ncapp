import Router from 'express';
import ctrl from '../controllers/clientController.js';
const router = new Router();

router.get('/clients/:name', ctrl.readClient, ctrl.readClients);
router.post('/clients', ctrl.createClient, ctrl.updateClient);

export default router;
