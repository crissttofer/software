import express from "express";
import mysql from "mysql2";
import morgan from "morgan";

const app=express();
const PORT=4000;

app.set('port',PORT)
app.use(morgan('dev'))

app.get('/',(req,res)=>{
  res.send('hola')
})
app.listen(PORT,()=>{
  console.log(`Listening on http://localhost:${PORT}`)
})