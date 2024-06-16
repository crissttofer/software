import { Router } from "express";
import { validateLogin,showLogin } from "../controllers/login.js";
import { validateToken } from "../controllers/midleware.js";

const router=Router()

router.post("/login",validateLogin)
router.get("/login",validateToken,showLogin)

export default router