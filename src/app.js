import express from "express";
import mysql from "mysql2";

const app=express();
const PORT=4000;

app.set('port',PORT)

app.get('/',(req,res)=>{
  res.send('Yherson cabro')
})
app.listen(PORT,()=>{
  console.log(`Listening on http://localhost:${PORT}`)
})