import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import env from "dotenv";
import db from "../model/user.js"
env.config();

async function validateLogin(req, res) {
  const userData = req.body;
  const userDb = await db.usuario.findUnique({
    select: {
      id: true,
      nombre: true,
      email: true,
      password: true,
    },
    where: {
      email: userData.email,
    },
  });
  if (userDb === null) {
    res.render("login",{message:"Datos Invalidos"})
  } else {
    const validado = await bcrypt.compare(userData.password, userDb.password);
    if (!validado) {
      res.render("login",{message:"Datos Invalidos"})
    } else {
      const userLoged = {
        iduser: userDb.id,
        nombre: userDb.nombre,
        email: userDb.email,
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
    res.render("register")
  }else{
    res.redirect("/home")
  }
}
async function verifyUser(req,res,next){
  const userData=req.body
  const userDb=db.findUnique({
    select:{
      email:true
    },
    where:{
      email:userData.email
    }
  })

  if(userDb===null){
    next()
  }
  res.redirect("/register",{message:"El usuario ya existe"})
}
async function registerUser(req,res){
  const userData=req.body
  const passwordHash=await bcrypt.hash(userData.password,10)
  
  await db.usuario.create({
    data:{
      nombre:userData.nombre,
      apellido:userData.apellido,
      email:userData.email,
      password:passwordHash
    }
  })

  res.redirect("/login")
}

export { 
  validateLogin, 
  showLogin,
  verifyUser,
  showRegister,
  registerUser
};
