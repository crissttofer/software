async function infoEvento() {
  try {
    // const url = new URL(window.location.href);
    // const params = new URLSearchParams(url.search);
    // const evento = document.querySelector(".event-detail");
    // const template = document.getElementById("infoEvento").content;
    const data = await fetch(
      `http://localhost:4000/api/evento/${params.get("v")}`
    );
    const json = await data.json();
    console.log("hola");
    console.log(json);
    console.log("hola");
    
    template.querySelector(".event-hero").style.background = `linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url(${json.Portada_Evento})`;
    template.querySelector(".event-title").textContent = json.Nombre_evento;
    template.querySelector(".event-date").textContent = json.Fecha_evento;
    template.querySelector(".event-description").textContent = json.Descripcion_evento;
    template.querySelector(".event-place").textContent = json.Ubicacion_evento;
    template.querySelector("img").src = json.Flayer_evento;
    
    let clon = document.importNode(template, true);
    evento.appendChild(clon);
  } catch {}
}

document.addEventListener("DOMContentLoaded", async (e) => {try {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.search);
  const evento = document.querySelector(".event-detail");
  const template = document.getElementById("infoEvento").content;
  const data = await fetch(
    `http://localhost:4000/api/evento/${params.get("v")}`
  );
  const json = await data.json();
  console.log("hola");
  console.log(json);
  console.log("hola");
  
  template.querySelector(".event-hero").style.background = `linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url(${json.Portada_Evento})`;
  template.querySelector(".event-title").textContent = json.Nombre_evento;
  template.querySelector(".event-date").textContent ="Fecha: "+ json.Fecha_evento.slice(0, 10);
  template.querySelector(".event-description").textContent = json.Descripcion_evento;
  template.querySelector(".event-location").textContent ="Ubicación: "+ json.Ubicacion_evento;
  template.querySelector("img").src = json.Flayer_evento;
  
  let clon = document.importNode(template, true);
  evento.appendChild(clon);
} catch(er) {
  console.error(er)
}
})