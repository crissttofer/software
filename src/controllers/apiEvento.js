import jwt from "jsonwebtoken"
import env from "dotenv"
import db from "../model/user.js"

env.config()

async function todoEventos(req,res){
  const eventos = await db.evento.findMany({
    select:{
      Id_evento:true,
      Nombre_evento:true,
      Descripcion_evento:true,
      Portada_Evento:true
    }
  })
  res.json(eventos)
}
async function categoriaEvento(req,res){
  const Categoria=req.params.categoria
  const eventos= await db.evento.findMany({
    where:{
      categoria_evento:{
        some:{
          categoria:{
            Nombre_categoria:Categoria
          }
        }
      }
    },
    select:{
      Id_evento:true,
      Nombre_evento:true,
      Descripcion_evento:true,
      Portada_Evento:true
    }
  })
  res.json(eventos)
}
async function eventoEspecifico(req,res){
  const eventoId=parseInt(req.params.id)
  const evento=await db.evento.findUnique({
    where:{
      Id_evento:eventoId
    }
  })
  res.json(evento)
}
async function eventoUsuario(req,res){
  const userToken= await jwt.verify(req.cookies.token,process.env.SECRET_KEY)
  const eventos = await db.evento.findMany({
    where:{
      usuario_eventopublicado:{
        some:{
          usuarios:{
            Id_usuario:parseInt(userToken.iduser)
          }
        }
      }
    },
    select:{
      Id_evento:true,
      Nombre_evento:true,
      Descripcion_evento:true,
      Portada_Evento:true
    }
  })
  res.json(eventos)
}
export {
  todoEventos,
  categoriaEvento,
  eventoEspecifico,
  eventoUsuario
}