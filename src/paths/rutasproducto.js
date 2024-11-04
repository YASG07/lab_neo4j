//rutasmaterias.js
const express = require('express');
const neo4j = require("neo4j-driver");
var router = express.Router();
const cache = require("./logger");


var driver = neo4j.driver(
   process.env.NEO4J_URI || "neo4j://localhost:7687",
   neo4j.auth.basic('neo4j', 'neo4j')
);

//Q1: Obtener la lista de productos que tienen menos de 10 unidades en stock.
router.route('/producto/lt10')
   .all(cache)
   .get(async (req,res) => {
      const Q1 = `MATCH(p:Producto) WHERE p.Stock<10 RETURN p`
      const session = driver.session()
      await session.run(Q1, {})
         .then(result => {
            producto = result.records.map(record => record.get('p').properties);
            res.data=producto;
            res.status(202).json({ Productos: producto });
         }).catch(error => {
            console.log(error)
         }).then(() => session.close())
      
   })

//Q4: Encontrar los productos que han sido comprados por más de 5 clientes diferentes.
router.route('/producto/mt5bought')
   .all(cache)
   .get(async (req,res) => {
      const Q4 = `match (c:Cliente)-[:Compra]->(:Venta)-[:Vendido]->(p:Producto)
         with p, count(distinct c) AS numClientes
         where numClientes >= 5.0
         return p, numClientes`
      const session = driver.session()
      await session.run(Q4, {})
         .then(result => {
            producto = result.records.map(record => ({
               Producto: record.get('p').properties,
               "Veces Comprado": record.get('numClientes')
            }));
            res.data=producto
            res.status(202).json({ Productos:producto })
         }).catch(error => {
            console.log(error)
         }).then(() => session.close())
   });

//Q7: Listar los pedidos de venta que tienen un valor total mayor a $10,000.
router.route('/ventas/mt10k')
   .all(cache)
   .get(async (req,res) => {
      const Q7 = `match(v:Venta)
         where v.Total>10000.0
         return v`
      const session = driver.session()
      await session.run(Q7, {})
         .then(result => {
            venta = result.records.map(record => record.get('v').properties);
            res.data=venta
            res.status(202).json({ Ventas: venta })
         }).catch(error => {
            console.log(error)
         }).then(() => session.close())
   });

//Q13: Todos los productos de una categoría específica eliminados del inventario.
router.route('/eliminar-productos/:categoria')
   .all(cache)
   .delete(async  (req,res) => {
      const Q13 = `match(p:Producto)
      where toLower(p.Category)=$categoria
      detach delete p`
      const session = driver.session()
      await session.run(Q13,{
         categoria: req.params.categoria
      }).then(() => {
         res.data='Consulte la base de datos para revisar las actualizaciones'
         res.status(202).json({ Message: "Productos de la categoria solicitada eliminados"  })
      })
         .catch(error => {
            console.log(error)
         }).then(() => session.close())
   });

//Q15: Eliminar todos los clientes que han realizado devoluciones.
router.route('/eliminar-clientes%devoluciones')
   .all(cache)
   .delete(async (req,res) => {
      const Q15 = `match (c)-[:Devolucion]->()
      detach delete c`
      const session = driver.session()
      await session.run(Q15, {})
         .then(() => {
            res.data='Consulte la base de datos para revisar las actualizaciones'
            res.status(202).json({ Message: "Clientes que han hecho devoluciones eliminados" })
         })
            .catch(error => {
               console.log(error)
            }).then(() => session.close())
   });

module.exports = router
