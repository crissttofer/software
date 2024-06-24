
const items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

function view(req,res){
  const title = 
  req.params.id === 'home' ? 'Home' :
  req.params.id === 'login.hbs' ? 'Login' :
   'Error';

  res.render(req.params.id, {
    title: title,
    item: items
  });
}

export {
  view
}