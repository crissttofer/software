import { Router } from "express";
import { todoEventos,categoriaEvento,eventoEspecifico, eventoUsuario, participarEvento, eventosSuscritos } from "../controllers/apiEvento.js";

const router=Router()

router.get("/api/eventos",todoEventos)
router.get("/api/eventos/:categoria",categoriaEvento)
router.get("/api/evento/:id",eventoEspecifico)
router.get("/api/usuario/eventosPublicados",eventoUsuario)
router.post("/api/participar/:id",participarEvento)
router.get("/api/usuario/eventosSuscritos",eventosSuscritos)

export default router