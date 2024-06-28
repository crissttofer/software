function showEvent(req,res){
  res.render("evento",{estadoSesion:req.sesion})
}
function showCategoriEvent(req,res){
  
}

export {
  showEvent
}