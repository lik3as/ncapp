import Router from 'express';
import ctrl from '../controllers/catController.js';
const router = Router();

router.get('/categories', ctrl.getCategories);

export default router;
