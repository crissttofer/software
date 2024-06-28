function showUser(req,res){
  console.log(req.sesion)
  if(req.sesion){
    res.render("usuario",{estadoSesion:req.sesion})
  }else{
    res.redirect("/home")
  }
}

export {
  showUser
}