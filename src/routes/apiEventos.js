import { Router } from "express";
import { todoEventos,categoriaEvento,eventoEspecifico } from "../controllers/apiEvento.js";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",categoriaEvento)
router.get("/api/evento/:id",eventoEspecifico)

export default router