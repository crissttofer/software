
const items = ['Item 1', 'Item 2', 'Item 3', 'Item 4','Item 5','Item 6'];

function view(req,res){
  const title = 
  req.params.id === 'home' ? 'Home' :
  req.params.id === 'login' ? 'Login':
  req.params.id === 'evento' ? 'Evento':
  req.params.id === 'publicaciones' ? 'Publicaciones':
  req.params.id === 'registro' ? 'Registro':
   'Error';

  res.render(req.params.id, {
    title: title,
    item: items
  });
}

export {
  view
}