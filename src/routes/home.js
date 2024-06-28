import { Router } from "express";

import {showHome} from "../controllers/home.js" 
import { verifySesion } from "../controllers/middleware.js";
const router=Router()

router.get("/home",verifySesion,showHome)

export default router