import { Router } from "express";

import { verifySesion } from "../controllers/middleware.js";
import { showEvent,registerEvent,upload } from "../controllers/evento.js"

const router = Router()

router.get("/evento",verifySesion,showEvent)
router.post("/registrarEvento",upload.fields([
  {
    name:"portada",
    maxCount:1
  },
  {
    name:"flayer",
    maxCount:1
  }
]),registerEvent)

export default router