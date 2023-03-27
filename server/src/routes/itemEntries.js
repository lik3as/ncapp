import Router from 'express';
import ctrl from '../controllers/itemEntryController.js';
const router = new Router();

router.post('/entries', ctrl.createEntry, ctrl.updateEntry);
router.get('/entries', ctrl.readEntries);
router.get('/entries/:pk', ctrl.readEntry);

export default router;
