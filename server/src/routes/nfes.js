import Router from 'express';
const router = new Router();
import ctrl from '../controllers/nfeController.js'

router.post('/nfes', ctrl.createNfe, ctrl.updateNfe);
router.get('/nfes', ctrl.readNfes);
router.get('/nfes/:pk', ctrl.readNfe);

export default router;
