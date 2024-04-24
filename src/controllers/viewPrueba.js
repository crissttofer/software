function view(req,res){
  res.render(req.params.id)
}

export {
  view
}