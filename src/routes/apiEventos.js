import { Router } from "express";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",todoEventos)

export default router