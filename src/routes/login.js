import { Router } from "express";
import { validateLogin,showLogin, verifyUser, registerUser, showRegister, closeSesion } from "../controllers/login.js";
import { verifyToken,verifySesion } from "../controllers/middleware.js";

const router=Router()

router.post("/login",validateLogin)
router.get("/login",verifySesion,showLogin)
router.post("/registro",registerUser)
router.get("/registro",verifySesion,showRegister)
router.post("/logout",closeSesion)
export default router