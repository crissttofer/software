import { Router } from "express";

import { verifySesion } from "../controllers/middleware.js";
import { showEvent,registerEvent,upload,showRegisterEvent,a } from "../controllers/evento.js"

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
router.get("/register",verifySesion,showRegisterEvent)
// router.post("/registroPrueba",a.single("imagenPrueba"),(req,res)=>{
//   console.log(req.file)
//   res.send("chupapimuñaño")
// })
// router.get("/registroPrueba",showRegistroPrueba)
// function showRegistroPrueba(req,res){
//   res.render("registroPrueba")
// }
export default router