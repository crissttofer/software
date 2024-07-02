import { Router } from "express";
import { todoEventos,categoriaEvento,eventoEspecifico, eventoUsuario } from "../controllers/apiEvento.js";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",categoriaEvento)
router.get("/api/evento/:id",eventoEspecifico)
router.get("/api/usuario/eventosPublicados",eventoUsuario)

export default router