import { eventos , categoriaEventos, /*infoEvento,*/ botonParticipar, logout } from "/js/eventos.js";

document.addEventListener("DOMContentLoaded",(e)=>{
  eventos()
  categoriaEventos()
  // infoEvento()
  botonParticipar()
  logout()
})