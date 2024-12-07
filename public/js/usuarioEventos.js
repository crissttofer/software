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

async function infUsuario(){
  const username= document.getElementById("username");
  const user= await fetch("http://localhost:4000/usuario",{
    method:"POST",});
  const json= await user.json();
  console.log(json)
  username.textContent=json.Alias;
}

async function usuarioEventos(){
  try{
    document.addEventListener("click",async (e)=>{
      if(e.target.dataset.evento==="misEventos"){
        const eventos = document.getElementById("video-items");
        const fragment = document.createDocumentFragment();
        const template = document.getElementById("tem-tarjetas").content;
        const data=await fetch("http://localhost:4000/api/usuario/eventosPublicados")
        const json=await data.json()
        json.forEach((element) => {
          template.querySelector("img").src = element.Portada_Evento;
          template.querySelector("h3").textContent = element.Nombre_evento;
          template.querySelector("h5").textContent = element.Ubicacion_evento;
          // template.querySelector("p").textContent=element.Descripcion_evento
          template.querySelector("a").href = `/evento?v=${element.Id_evento}`;
    
          let clon = document.importNode(template, true);
          fragment.appendChild(clon);
        });
        const separator = document.querySelector(".separator");
        separator.innerHTML = ``;
        eventos.innerHTML=``
        eventos.appendChild(fragment)
      }
    })
  }catch(er){
  }
}

async function suscrito(){
  try{
    document.addEventListener("click",async (e)=>{
      if(e.target.dataset.evento==="suscritos"){
        const eventos = document.getElementById("video-items");
        const fragment = document.createDocumentFragment();
        const template = document.getElementById("tem-tarjetas").content;
        const data=await fetch("http://localhost:4000/api/usuario/eventosSuscritos")
        const json=await data.json()
        json.forEach((element) => {
          template.querySelector("img").src = element.Portada_Evento;
          template.querySelector("h3").textContent = element.Nombre_evento;
          template.querySelector("h5").textContent = element.Ubicacion_evento;
          // template.querySelector("p").textContent=element.Descripcion_evento
          template.querySelector("a").href = `/evento?v=${element.Id_evento}`;
    
          let clon = document.importNode(template, true);
          fragment.appendChild(clon);
        });
        const separator = document.querySelector(".separator");
        separator.innerHTML = ``;
        eventos.innerHTML=``
        eventos.appendChild(fragment)
      }
    })
  }catch(er){
  }
}
export {
  defaultEventosUsuario,
  eventosUsuario,
  infUsuario,
  usuarioEventos,
  suscrito
}