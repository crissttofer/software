import { Router } from "express";

import {verifySesion} from "../controllers/middleware.js"
import {showUser} from "../controllers/usuario.js" 

const router = Router()

router.get("/usuario",verifySesion,showUser)

export default router