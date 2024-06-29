import db from "../model/user.js"

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

export {
  todoEventos,
  categoriaEvento
}