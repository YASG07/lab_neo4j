//rutasproveedor.js
const express = require('express');
var router = express.Router();
const neo4j = require("neo4j-driver");
const cache = require("./logger");

var driver = neo4j.driver(
   process.env.NEO4J_URI || "neo4j://localhost:7687",
   neo4j.auth.basic('neo4j', 'neo4j')
);

//Q2: Encontrar los proveedores que suministran productos de una categoría en específico.
router.route('/producto-categoria/:category')
   .all(cache)
   .get(async (req, res) => {
      const Q2 = `match(s:Proveedor)-[sup:Provee]->(pc:PC)-[ll:Llega]->(p:Producto)
         where toLower(p.Category)=$category
         return distinct s`
      const session = driver.session()
      await session.run(Q2, {
         category: req.params.category
      }).then(result => {
         proveedor = result.records.map(record => record.get('s').properties)
         res.data=proveedor
         res.status(202).json({ Proveedores: proveedor })
      }).catch(error => {
         console.log(error)
      }).then(() => session.close())
      
   });

//Q3: Obtener la lista de pedidos de compra que fueron realizados a un proveedor en específico
router.route('/pedidocompra/:idproveedor')
   .all(cache)
   .get(async (req, res) => {
      const Q3 = `match(s:Proveedor)-[sup:Provee]->(pc:PC)-[ll:Llega]->(p:Producto)
      where toLower(s.ID)=$idproveedor
      return pc,p.name`
      const session = driver.session()
      await session.run(Q3, {
         idproveedor: req.params.idproveedor
      }).then(result => {
         pedido = result.records.map(record => ({
           Pedido: record.get('pc').properties,
           Producto: record.get('p.name')
         }))
         res.data=pedido
         res.status(202).json(pedido)
      }).catch(error => {
         console.log(error)
      }).then(() => session.close())
      
   });

//Q5: Obtener la lista de todos los proveedores.
router.route('/proveedores')
   .all(cache)
   .get(async (req,res) => {
      const Q5 = `match(s:Proveedor)
      return s`
      const session = driver.session()
      await session.run(Q5, {})
         .then(result => {
            proveedor = result.records.map(record => record.get('s').properties);
            res.data=proveedor
            res.status(202).json({ Proveedores: proveedor })
         }).catch(error => {
            console.log(error)
         }).then(() => session.close())
   });

//Post1: Dar de alta un nuevo proveedor
router.route('/nuevo-proveedor')
   .all(cache)
   .post(async (req,res) => {
      const Query = `merge(s:Proveedor {ID: $id, name: $nombre, Country: $pais, Phone: $telefono, Email: $correo})
      return s`
      const session = driver.session()
      await session.run(Query, {
         id: req.body.id,
         nombre: req.body.nombre,
         pais: req.body.pais,
         telefono: req.body.telefono,
         correo: req.body.correo
      }).then(result => {
         proveedor = result.records.map(record => record.get('s').properties);
         res.data=proveedor
         res.status(201).json({ Proveedor: proveedor })
      }).catch(error => {
         console.log(error)
      }).then(() => session.close())
   });

//Post2: Registrar un nuevo pedido de compra
router.route('/nuevo-pedido%compra')
   .all(cache)
   .post(async (req,res) => {
      const Query = `match (s:Proveedor {ID:$idproveedor}) 
      match (p:Producto {ID:$idproducto})
      merge(pc:PC {ID: $id, Pedido: $pedido, Recibido: $recibido, Cantidad: $cantidad, Precio: $precio})
      merge(s)-[:Provee]->(pc)
      merge(pc)-[:Llega]->(p)
      return p,s,pc`
      const session = driver.session()
      await session.run(Query, {
         idproveedor: req.body.idproveedor,
         idproducto: req.body.idproducto,
         id: req.body.id,
         pedido: req.body.pedido,
         recibido: req.body.recibido,
         cantidad: req.body.cantidad,
         precio: req.body.precio
      }).then(result => {
         proveedor = result.records.map(record => record.get('s').properties);
         producto = result.records.map(record => record.get('p').properties);
         pedido = result.records.map(record => record.get('pc').properties);
         res.data=[proveedor, producto, pedido]
         res.status(201).json({ Proveedor: proveedor, Producto: producto, Pedido: pedido })
      }).catch(error => {
         console.log(error)
      }).then(() => session.close())
   });

//Q8 y Q14: Cambiar todos los productos suministrados por un proveedor a otro proveedor.
router.route('/cambio-proveedor/:idproveedor1')
   .all(cache)
   .put(async (req,res) => {
      const Q8 = `match (s:Proveedor)-[r:Provee]->(pc:PC)
      match (us:Proveedor)
      where toLower(s.ID)=$idproveedor1 and toLower(us.ID)=$idproveedor2
      create(us)-[rr:Provee]->(pc)
      set rr=r
      delete r`
      const session = driver.session()
      await session.run(Q8, {
         idproveedor1: req.params.idproveedor1,
         idproveedor2: req.body.idproveedor2
      }).then(() => {
         res.data='Consulte la base de datos para revisar las actualizaciones'
         res.status(202).json({ Message: "Cambio de proveedores finalizado con éxito" })
      })
         .catch(error => {
            console.log(error)
         }).then(() => session.close())
   });

//Q12: Eliminar todos los proveedores y sus nodos asociados.
router.route('/eliminar-proveedores')
   .all(cache)
   .delete(async (req,res) => {
      const Q12 = `match(s:Proveedor)-[:Provee]->(pc:PC)
      match(p:Proveedor)
      detach delete s,pc,p`
      const session = driver.session()
      await session.run(Q12, {})
         .then(() => {
            res.data='Consulte la base de datos para revisar las actualizaciones'
            res.status(202).json({ Message: "Los proveedores y sus pedidos de compra han sido eliminados"})
         })
            .catch(error => {
               console.log(error)
            }).then(() => session.close())
   });

module.exports = router
