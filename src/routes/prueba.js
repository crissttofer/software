import express from 'express';
import {view} from '../controllers/viewPrueba.js'


const router=express.Router();

router.get('/prueba/:id',view);

export default router;