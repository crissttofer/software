import { Router } from "express";
import { validateLogin,showLogin } from "../controllers/login.js";
import { verifyToken } from "../controllers/midleware.js";

const router=Router()

router.post("/login",validateLogin)
router.get("/login",verifyToken,showLogin)

export default router