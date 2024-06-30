import multer from "multer"
import jwt from "jsonwebtoken"
import env from "dotenv"
import { __dirname } from "../utils.js";
import path from "node:path"
import fs from "node:fs"
import db from "../model/user.js"

env.config()

const storage=multer.diskStorage({
  destination:function (req,file,cb){
    const dir=path.join(__dirname,"../public/img/evento")
    if (!fs.existsSync(dir)){
      fs.mkdirSync(dir, { recursive: true });
    }
    cb(null,dir)
  },
  filename:function (req,file,cb){
    cb(null,`${Date.now()}${path.extname(file.originalname)}`)
  }
})
const upload=multer({storage:storage})
function showEvent(req,res){
  res.render("evento",{estadoSesion:req.sesion})
}
function showCategoriEvent(req,res){
  
}
async function registerEvent(req,res){
  const eventData=req.body
  const userCookie=req.cookies.token
  const tokenDecoded=await jwt.verify(userCookie,process.env.SECRET_KEY)
  const eventoDb=await db.evento.create({
    data:{
      Nombre_evento:eventData.nombreEvento,
      Fecha_evento:new Date(eventData.fechaEvento).toISOString(),
      Ubicacion_evento:eventData.ubicacion,
      Descripcion_evento:eventData.descripcion,
      Flayer_evento:urlImg(req.files['flayer'][0]),
      Portada_Evento:urlImg(req.files['portada'][0]),
      Modalidad_evento:eventData.modalidad
    }
  })
  await db.usuario_eventopublicado.create({
    data:{
      Id_evento:eventoDb.Id_evento,
      Id_usuario:tokenDecoded.id
    }
  })
  res.send("evento publicado")
}
function urlImg(filePath){
  const normailsedPath=path.normalize(filePath.path)
  const pathSep=normailsedPath.split(path.sep)
  const imgIndex = pathSep.indexOf('img');
  const imgPath = "/"+pathSep.slice(imgIndex).join('/')
  return imgPath
}
export {
  showEvent,
  registerEvent,
  upload
}