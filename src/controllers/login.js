import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import env from "dotenv";
import db from "../model/user.js"
env.config();

async function validateLogin(req, res) {
  const userData = req.body;
  const userDb = await db.usuarios.findUnique({
    select: {
      Id_usuario: true,
      Nombre_usuario: true,
      Email: true,
      Password: true,
    },
    where: {
      Email: userData.email,
    },
  });
  if (userDb === null) {
    res.render("login",{message:"Datos Invalidos"})
  } else {
    const validado = await bcrypt.compare(userData.password, userDb.Password);
    if (!validado) {
      res.render("login",{message:"Datos Invalidos"})
    } else {
      const userLoged = {
        iduser: userDb.Id_usuario,
        nombre: userDb.Nombre_usuario,
        email: userDb.Email,
      };
      const optionsToken = {
        expiresIn: "30s",
      };
      jwt.sign(
        userLoged,
        process.env.SECRET_KEY,
        optionsToken,
        (err, token) => {
          if (err) {
            console.log(err);
          } else {
            const optionsCookie = {
              expires: new Date(Date.now() + 30 * 1000),
            };
            res.cookie("token", token, optionsCookie);
            res.redirect("/home")
          }
        }
      );
    }
  }
}
function showLogin(req, res) {
  console.log(req.sesion)
  if(!req.sesion){
    res.render("login")
  }else{
    res.redirect("/home")
  }
}
function showRegister(req,res){
  if(!req.sesion){
    res.render("registro")
  }else{
    res.redirect("/home")
  }
}
async function verifyUser(req,res,next){
  const userData=req.body
  const userDb=await db.usuarios.findUnique({
    select:{
      Email:true
    },
    where:{
      Email:userData.email
    }
  })
  if(userDb===null){
    next()
  }
  res.render("registro",{message:"El usuario ya existe"})
  return
}
async function registerUser(req,res){
  const userData=req.body
  const userDb=await db.usuarios.findUnique({
    select:{
      Email:true
    },
    where:{
      Email:userData.email
    }
  })
  if(userDb===null){
    const passwordHash=await bcrypt.hash(userData.password,10)
  
    await db.usuarios.create({
      data:{
        Nombre_usuario:userData.nombre,
        Apellido_usuario:userData.apellido,
        Email:userData.email,
        Telefono:userData.telefono,
        Password:passwordHash
      }
    })

    res.redirect("/login")
  }else{
    res.redirect("/register")
  }
  
}

export { 
  validateLogin, 
  showLogin,
  verifyUser,
  showRegister,
  registerUser
};
