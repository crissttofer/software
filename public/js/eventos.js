async function eventos(){
  const eventos = document.querySelector(".navCardInfo");
  const fragment = document.createDocumentFragment()
  const template = document.getElementById("templateCardEvent").content
  const data =await fetch("http://localhost:4000/api/eventos")
  const json=await data.json()
  json.forEach(element => {
    template.querySelector("img").src=element.Portada_Evento
    template.querySelector("h1").textContent=element.Nombre_evento
    template.querySelector("p").textContent=element.Descripcion_evento

    let clon= document.importNode(template,true)
    fragment.appendChild(clon)
  });
  eventos.appendChild(fragment)
}
function categoriaEventos(){
  const eventos = document.querySelector(".navCardInfo")
  const fragment = document.createDocumentFragment()
  const template = document.getElementById("templateCardEvent").content
  document.addEventListener("click",async (e)=>{
    const categoria = e.target.dataset.categoria
    if(categoria){
      const data = await fetch(`http://localhost:4000/api/eventos/${categoria}`)
      const json = await data.json()
      console.log(json)
      json.forEach(element => {
        template.querySelector("img").src=element.Portada_Evento
        template.querySelector("h1").textContent=element.Nombre_evento
        template.querySelector("p").textContent=element.Descripcion_evento
    
        let clon= document.importNode(template,true)
        fragment.appendChild(clon)
      });
      eventos.innerHTML=``
      eventos.appendChild(fragment)
    }
  })
}

export {
  eventos,
  categoriaEventos
}