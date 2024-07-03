async function eventos(){
  try{
    const eventos = document.querySelector(".navCardInfo");
    const fragment = document.createDocumentFragment()
    const template = document.getElementById("templateCardEvent").content
    const data =await fetch("http://localhost:4000/api/eventos")
    const json=await data.json()
    json.forEach(element => {
      template.querySelector("img").src=element.Portada_Evento
      template.querySelector("h1").textContent=element.Nombre_evento
      template.querySelector("p").textContent=element.Descripcion_evento
      template.querySelector("a").href=`/evento?v=${element.Id_evento}`
  
      let clon= document.importNode(template,true)
      fragment.appendChild(clon)
    });
    eventos.appendChild(fragment)
  }catch{
    return
  }
}
function categoriaEventos(){
  try{
    const eventos = document.querySelector(".navCardInfo")
    const fragment = document.createDocumentFragment()
    const template = document.getElementById("templateCardEvent").content
    document.addEventListener("click",async (e)=>{
      const categoria = e.target.dataset.categoria
      if(categoria){
        const data = await fetch(`http://localhost:4000/api/eventos/${categoria}`)
        const json = await data.json()
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
      }
    })
  }catch{
    return
  }
}
async function infoEvento(){
  try{
    const url= new URL(window.location.href)
    const params=new URLSearchParams(url.search)
    const body=document.querySelector(".evento")
    const template = document.getElementById("tEvento").content
    const data =await fetch(`http://localhost:4000/api/evento/${params.get('v')}`)
    const json=await data.json()
    template.querySelector(".encabezado").style.backgroundImage=`url(${json.Portada_Evento})`
    template.querySelector("h1").textContent=json.Nombre_evento
    template.querySelector("h3").textContent=`FECHA: ${json.Fecha_evento.slice(0, 10)}`
    template.getElementById("ubicacion").textContent=`Ubicación: ${json.Ubicacion_evento}`
    template.getElementById("descripcion").textContent=`${json.Descripcion_evento}`
    template.querySelector(".infoImg > img").src=`${json.Flayer_evento}`
    let clon=document.importNode(template,true)
    body.appendChild(clon)
  }catch{
  }
}
async function botonParticipar(){
  try{
    document.addEventListener("click",async (e)=>{
      const btn=document.getElementById("botonParticipar")
      const url = new URL(window.location.href)
      const params=new URLSearchParams(url.search)
      if(e.target===btn){
        const response=await fetch(`http://localhost:4000/api/participar/${params.get("v")}`,{
          method:"POST"
        })
        const json=await response.json()
        console.log(json)
      }
    })
  }catch{

  }
}
function logout(){
  try{
    document.addEventListener("click",async (e)=>{
      const logoutBtn=document.getElementById("logout")
      if(e.target===logoutBtn){
        await fetch("http://localhost:4000/logout",{method:"POST"})
          .catch(error => location.reload())
          return
      }
    })
    return
  }catch{

  }
}
export {
  eventos,
  categoriaEventos,
  infoEvento,
  botonParticipar,
  logout
}