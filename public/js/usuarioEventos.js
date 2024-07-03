async function defaultEventosUsuario(){
  try{
    const eventos = document.getElementById("infoCardUser")
    const fragment= document.createDocumentFragment()
    const template=document.getElementById("TinfoCardUser").content
    const data=await fetch("http://localhost:4000/api/usuario/eventosPublicados")
    const json=await data.json()
    json.forEach(element => {
      template.querySelector("img").src=element.Portada_Evento
      template.querySelector("h1").textContent=element.Nombre_evento
      template.querySelector("p").textContent=element.Descripcion_evento
      template.querySelector("a").href=`/evento?v=${element.Id_evento}`
      
      let clon= document.importNode(template,true)
      fragment.appendChild(clon)
    });
    eventos.innerHTML=``
    eventos.appendChild(fragment)
  }catch{

  }
}
async function eventosUsuario(){
  try{
    const eventos = document.getElementById("infoCardUser")
    const fragment= document.createDocumentFragment()
    const template=document.getElementById("TinfoCardUser").content
    document.addEventListener("click",async (e)=>{
      const categoria = e.target.dataset.categoriauser
      if(categoria){
        const data = await fetch(`http://localhost:4000/api/usuario/${categoria}`)
        const json = await data.json()
        json.forEach(element=>{
          template.querySelector("img").src=element.Portada_Evento
          template.querySelector("h1").textContent=element.Nombre_evento
          template.querySelector("p").textContent=element.Descripcion_evento
          template.querySelector("a").href=`/evento?v=${element.Id_evento}`
      
          let clon= document.importNode(template,true)
          fragment.appendChild(clon)
        })
        eventos.innerHTML=``
        eventos.appendChild(fragment)
      }
    })
  }catch{

  }
}

export {
  defaultEventosUsuario,
  eventosUsuario
}