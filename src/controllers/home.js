function showHome(req,res){
  res.render("home",{estadoSesion:req.sesion})
}

export {
  showHome
}