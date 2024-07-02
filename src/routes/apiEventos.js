import { Router } from "express";
import { todoEventos,categoriaEvento,eventoEspecifico, eventoUsuario, participarEvento } from "../controllers/apiEvento.js";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",categoriaEvento)
router.get("/api/evento/:id",eventoEspecifico)
router.get("/api/usuario/eventosPublicados",eventoUsuario)
router.post("/api/participar/:id",participarEvento)

export default router