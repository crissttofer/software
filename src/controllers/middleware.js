import jwt from "jsonwebtoken"
import dotenv from "dotenv"

dotenv.config()

function verifyToken(req,res,next){
  const token=req.cookies.token;

  if(token === "undefined"){
    // res.redirect("/login")
  }

  jwt.verify(token,process.env.SECRET_KEY,(err,data)=>{
    if(err){
      res.json({message:"Error al verificar el token",err})
    }
    req.token=data
  })
}
function verifySesion(req,res,next){
  const token=req.cookies.token

  if(typeof token==="undefined"){
    req.sesion=false
    next()
  }else{
    req.sesion=true
    next()
  }
}

export {
  verifyToken,
  verifySesion
}