import { Router } from "express";
import { validateLogin,showLogin, verifyUser, registerUser, showRegister } from "../controllers/login.js";
import { verifyToken,verifySesion } from "../controllers/middleware.js";

const router=Router()

router.post("/login",validateLogin)
router.get("/login",verifySesion,showLogin)
router.post("/registro",registerUser)
router.get("/registro",verifySesion,showRegister)
export default router