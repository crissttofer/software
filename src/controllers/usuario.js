import db from '../model/user.js';
import jwt from 'jsonwebtoken';
import 'dotenv/config';
function showUser(req,res){
  console.log(req.sesion)
  if(req.sesion){
    res.render("usuario",{estadoSesion:req.sesion})
  }else{
    res.redirect("/home")
  }
}

async function getUserData(req, res) {
  const userId = jwt.verify(req.cookies.token, process.env.SECRET_KEY).iduser;
  if (!userId) {
    res.status(401).json({ error: 'No hay sesión activa' });
    return;
  }

  try {
    const user = await db.usuarios.findUnique({ 
      where: { Id_usuario: userId } ,
      select: {
        Alias: true,
	      Nombre_usuario: true,
	      Apellido_usuario: true,
	      Codigo_estudiante: true,
	      Email: true,
	      Telefono: true,
      }
    }); // obtenemos la información del usuario de la base de datos
    if (!user) {
      res.status(404).json({ error: 'Usuario no encontrado' });
      return;
    }

    res.json(user); // respondemos con la información del usuario en formato JSON
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener la información del usuario' });
  }
}

export {
  showUser,
  getUserData
}