const express = require('express');
const app = express();
const neo4j = require("neo4j-driver");
const bodyParser = require('body-parser');
const PORT = 3000;

const proveedorRutas = require('./paths/rutasproveedor');
const productoRutas = require('./paths/rutasproducto');

//middlewares
app.use(bodyParser.urlencoded({extended: true }));
app.use(bodyParser.json());
app.use('/api', proveedorRutas, productoRutas);
app.listen(PORT, () => { console.log('Server en http://localhost:' + PORT) });