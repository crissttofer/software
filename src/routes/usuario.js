import { Router } from "express";

import {verifySesion} from "../controllers/middleware.js"
import {showUser,getUserData} from "../controllers/usuario.js" 

const router = Router()

router.get("/usuario",verifySesion,showUser)
router.post("/usuario",getUserData)

export default router