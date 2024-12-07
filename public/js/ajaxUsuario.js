import {defaultEventosUsuario, eventosUsuario, infUsuario,usuarioEventos,suscrito} from '/js/usuarioEventos.js'

document.addEventListener("DOMContentLoaded",(e)=>{
  defaultEventosUsuario()
  eventosUsuario()
  infUsuario()
  usuarioEventos()
  suscrito()
})