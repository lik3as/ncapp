import Router from 'express';
import ctrl from '../controllers/itemLeaveController.js';
const router = new Router();

router.post('/leave', ctrl.createLeave, ctrl.updateLeave);
router.get('leave', ctrl.readLeaves);
router.get('leave/:pk', ctrl.readLeave);

export default router;
