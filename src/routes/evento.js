import { Router } from "express";

import { verifySesion } from "../controllers/middleware.js";
import { showEvent } from "../controllers/evento.js"

const router = Router()

router.get("/evento",verifySesion,showEvent)

export default router