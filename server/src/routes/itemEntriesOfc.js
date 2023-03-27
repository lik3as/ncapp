import Router from 'express';
import ctrl from '../controllers/itemEntryOfcController.js';
const router = new Router();

router.post('/entriesOfc', ctrl.createEntryOfc, ctrl.updateEntryOfc);
router.get('/entriesOfc', ctrl.readEntriesOfc);
router.get('/entriesOfc/:pk', ctrl.readEntryOfc);

export default router;
