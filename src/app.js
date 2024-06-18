import express, { urlencoded } from "express";
import path from "path";
import mysql from "mysql2";
import morgan from "morgan";
import {engine} from "express-handlebars";
import { __dirname } from "./utils.js";
import helmet from "helmet";
import cors from "cors";
import cookieParser from "cookie-parser";

import routerPrueba from "./routes/prueba.js"
import routerLogin from "./routes/login.js";

import db from "./model/user.js";

const app=express();
const PORT=4000;

app.use(morgan('dev'));
app.use(helmet())
app.use(cors())
app.use(cookieParser())

app.use(express.static(path.join(__dirname,'..','public')))
app.use(express.json());
app.use(urlencoded({
  extended:true,
}));

app.set('port',PORT);

// Handlebars
app.set("views",__dirname+'/views')
app.engine('.hbs',engine({
  extname:'.hbs',
}))
app.set('view engine','hbs')



app.get('/helloword',(req,res)=>{
  console.log()
  res.render("helloworld")
})

app.use('/',routerPrueba)
app.use("/",routerLogin)


app.listen(PORT,()=>{
  console.log(`Listening on http://localhost:${PORT}`)
})