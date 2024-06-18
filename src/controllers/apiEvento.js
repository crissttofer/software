import db from "../model/user.js"

async function todoEventos(req,res){
  const eventos = await db.evento.findMany({
    select:{
      id:true,
      titulo:true,
      descripcion:true,
      portada:true
    }
  })
  res.json(eventos)
}
async function categoriaEvento(req,res){
  const nombreCategoria=req.params.categoria
  const eventos= await db.evento.findMany({
    where:{
      categoria_evento:{
        some:{
          categoria:{
            nombre:nombreCategoria
          }
        }
      }
    },
    select:{
      id:true,
      titulo:true,
      descripcion:true,
      portada:true
    }
  })
  res.json(eventos)
}

export {
  todoEventos,
  categoriaEvento
}