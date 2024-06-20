async function eventos(eventoId){
  const eventos = document.getElementById(eventoId);
  const data = fetch("http://localhost:4000/api/eventos")
  const json=await data.json()
}
function categoriaEventos(eventoId){
  const eventos = document.getElementById(eventoId)
  document.addEventListener("click",async (e)=>{
    const categoria = e.target.dataset.categoria
    if(categoria){
      const data = fetch(`http://localhost:4000/api/eventos/${categoria}`)
      const json = await data.json()
    }
  })
}