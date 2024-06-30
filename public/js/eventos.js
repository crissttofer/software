async function eventos(){
  const eventos = document.querySelector(".navCardInfo");
  const fragment = document.createDocumentFragment()
  const template = document.getElementById("templateCardEvent").content
  const data =await fetch("http://localhost:4000/api/eventos")
  const json=await data.json()
  json.forEach(element => {
    template.querySelector("img").setAttribute("src",element.Portada_evento)
    template.querySelector("h1").textContent=element.Nombre_evento
    template.querySelector("p").textContent=element.Descripcion_evento

    let clon= document.importNode(template,true)
    fragment.appendChild(clon)
  });
  eventos.appendChild(fragment)
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

export {
  eventos,
  categoriaEventos
}