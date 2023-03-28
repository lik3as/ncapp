import Router from 'express';
import ctrl from '../controllers/itemController.js';
const router = Router();

router.get('/items/:pk', ctrl.readItem);
router.get('/items', ctrl.readItems);
router.post('/items', ctrl.createItem, ctrl.updateItem);

export default router;

