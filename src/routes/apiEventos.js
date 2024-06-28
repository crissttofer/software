import { Router } from "express";
import { todoEventos,categoriaEvento } from "../controllers/apiEvento.js";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",categoriaEvento)

export default router