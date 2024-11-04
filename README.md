# LAB Neo4j API

Esta es una api hecha para realizar consultas en neo4j, funciona tomando como ejemplo un caso de gestión de inventario de una empresa. Además de neo4j también hace uso de redis para almacenar el cache de las consultas realizdas.

## EndPoints

### GET 'http://localhost:3000/api/producto/lt10'
- **Descripción**: Obtener la lista de productos que tienen menos de 10 unidades en stock.
- **Respuesta**: 
    - Status: 202
    ```json
    {
        "Productos":[
            {
                "Description":"24MP, interchangeable lens, video capable",
                "Category":"Camera",
                "Price":8990,
                "name":"DSLR Camera",
                "ID":"DC-012",
                "Stock":8
            },
            {
                "Description":"FDM 3D printer with build plate",
                "Category":"Printer",
                "Price":4990,
                "name":"3D Printer",
                "ID":"3DP-015",
                "Stock":5
            }
        ]
    }
    ```

### GET 'http://localhost:3000/api/producto-categoria/:category'
- **Descripción**: Encontrar los proveedores que suministran productos de una categoría en específico.
- **Paramétros**: 
    * category: es la categoria de los productos de los cuales se desea econtrar los datos de su proveedor, como parte de la url debe ser escrita en minusculas. 
    * Ejemplos:
        - 1. TV
        - 2. Audio
        - 3. Laptop
        - 4. Accessory
        - 5. Network
        - 6. Camera
        - 7. Gaming
        - 8. Tablet
        - 9. Kindle
        - 10. Printer  
- **Respuesta**: 
    - Status: 202
    - Parametro: accessory
    ```json
        {
            "Proveedores":[
                {
                    "Email":"info@globalelectronics.cn",
                    "Phone":"+86 10 9876 5432",
                    "name":"Global Electronics Ltd.",
                    "Country":"China",
                    "ID":"SUP-002"
                },
                {
                    "Email":"hello@smartsolutions.ca",
                    "Phone":"+1 (416) 555-7890",
                    "name":"Smart Solutions Co.",
                    "Country":"Canada",
                    "ID":"SUP-005"
                }
            ]
        }
    ```

### GET 'http://localhost:3000/api/pedidocompra/:idproveedor'
- **Descripción**: Obtener la lista de pedidos de compra que fueron realizados a un proveedor en específico.
- **Paramétros**: 
    * idproveedor: es el identificador único para cada proveedor, también debe ser escrito solamente en minusculas. El patrón del código es "sup-0" seguido del número de proveedor (sup-001).
    Nota: solo hay 5 proveedores dados de alta en el escenario de pruebas. 
- **Respuesta**: 
    - Status: 202
    - Parametro: sup-001
    ```json
        [
            {
                "Pedido":{
                    "Recibido":"04-04-2024",
                    "Cantidad":15,
                    "Pedido":"27-03-2024",
                    "ID":"PC-003",
                    "Precio":7990
                },
                "Producto":"Laptop 15"
            },
            {
                "Pedido":{
                    "Recibido":"04-04-2024",
                    "Cantidad":15,
                    "Pedido":"27-03-2024",
                    "ID":"PC-002",
                    "Precio":1490
                },
                "Producto":"Bluetooth Headphones"
            },
            {
                "Pedido":{
                    "Recibido":"04-04-2024",
                    "Cantidad":15,
                    "Pedido":"27-03-2024",
                    "ID":"PC-001",
                    "Precio":6990
                },
                "Producto":"Smart TV 55"
            }
        ]
    ```

### GET 'http://localhost:3000/api/producto/mt5bought'
- **Descripción**: Encontrar los productos que han sido comprados por más de 5 clientes diferentes.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Productos":[
                {
                    "Producto":
                    {
                        "Category":"TV",
                        "Description":"4K Ultra HD Smart TV with HDR support",
                        "Price":6990,
                        "name":"Smart TV 55",
                        "ID":"TV-001",
                        "Stock":25
                    },
                    "Veces Comprado":{"low":8,"high":0}
                },
                {
                    "Producto":
                    {
                        "Description":"Waterproof portable speaker with 12-hour battery",
                        "Category":"Audio",
                        "Price":990,
                        "name":"Bluetooth Speaker",
                        "ID":"BS-011",
                        "Stock":75
                    },
                    "Veces Comprado":{"low":5,"high":0}
                }
            ]
        }
    ```

### GET 'http://localhost:3000/api/proveedores'
- **Descripción**: Obtener la lista de todos los proveedores.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Proveedores":[
                {
                    "Email":"contact@techinnovations.com",
                    "Phone":"+1 (555) 123-4567",
                    "name":"Tech Innovations Inc.",
                    "Country":"USA",
                    "ID":"SUP-001"
                },
                {
                    "Email":"info@globalelectronics.cn",
                    "Phone":"+86 10 9876 5432",
                    "name":"Global Electronics Ltd.",
                    "Country":"China",
                    "ID":"SUP-002"
                },
                {
                    "Email":"sales@futuregadgets.de",
                    "Phone":"+49 30 12345678",
                    "name":"Future Gadgets GmbH",
                    "Country":"Germany",
                    "ID":"SUP-003"
                },
                {
                    "Email":"support@nextgendevices.sg",
                    "Phone":"+65 6123 4567",
                    "name":"NextGen Devices Pte.",
                    "Country":"Singapore",
                    "ID":"SUP-004"
                },
                {
                    "Email":"hello@smartsolutions.ca",
                    "Phone":"+1 (416) 555-7890",
                    "name":"Smart Solutions Co.",
                    "Country":"Canada",
                    "ID":"SUP-005"
                }
            ]
        }
    ```

### GET 'http://localhost:3000/api/ventas/mt10k'
- **Descripción**: Listar los pedidos de venta que tienen un valor total mayor a $10,000.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Ventas":[
                {
                    "Entrega":"01-11-24",
                    "Total":19980,
                    "ID":"PV-001"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":10570,
                    "ID":"PV-005"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":14980,
                    "ID":"PV-013"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":12980,
                    "ID":"PV-018"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":12990,
                    "ID":"PV-021"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":12990,
                    "ID":"PV-022"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":12990,
                    "ID":"PV-025"
                },
                {
                    "Entrega":"01-11-24",
                    "Total":10480,
                    "ID":"PV-028"
                }
            ]
        }
    ```

### PUT 'http://localhost:3000/api/cambio-proveedor/:idproveedor1'
- **Descripción**: Cambiar todos los productos suministrados por un proveedor a otro proveedor.
- **Paramétros**: 
    * idproveedor1: es el identificador único para cada proveedor, en este caso pertenece al cual será reemplazado.
- **Cuerpo/Body**:
    * idproveedor2: es el identificador único para cada proveedor, en este caso pertenece al cual se le asignaran los productos del anterior.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Message":"Cambio de proveedores finalizado con éxito"
        }
    ```
En el caso del cache de redis el mensaje es: "Consulte la base de datos para revisar las actualizaciones".

### DELETE 'http://localhost:3000/api/eliminar-proveedores'
- **Descripción**: Eliminar todos los proveedores y sus nodos asociados.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Message":"Los proveedores y sus pedidos de compra han sido eliminados"
        }
    ```
En el caso del cache de redis el mensaje es: "Consulte la base de datos para revisar las actualizaciones".

### DELETE 'http://localhost:3000/api/eliminar-productos/:categoria'
- **Descripción**: Todos los productos de una categoría específica eliminados del inventario.
- **Paramétros**: 
    * categoria: la categoria a la que pertenecen los productos a eliminar, como parte de la url debe ser escrita en minusculas. 
    * Ejemplos:
        - 1. TV
        - 2. Audio
        - 3. Laptop
        - 4. Accessory
        - 5. Network
        - 6. Camera
        - 7. Gaming
        - 8. Tablet
        - 9. Kindle
        - 10. Printer 
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Message":"Productos de la categoria solicitada eliminados"
        }
    ```
En el caso del cache de redis el mensaje es: "Consulte la base de datos para revisar las actualizaciones".

### DELETE 'http://localhost:3000/api/eliminar-clientes%devoluciones'
- **Descripción**: Eliminar todos los clientes que han realizado devoluciones.
- **Respuesta**: 
    - Status: 202
    ```json
        {
            "Message":"Clientes que han hecho devoluciones eliminados"
        }
    ```
En el caso del cache de redis el mensaje es: "Consulte la base de datos para revisar las actualizaciones".

### POST 'http://localhost:3000/api/nuevo-proveedor'
- **Descripción**: Dar de alta a nuevos proveedores.
- **Cuerpo/Body**:
    * id: código único para cada proveedor formado por la subcadena sup- y su respectivo número. 
    * nombre: razón social de la empresa encargada de suministrar los productos.
    * pais: nación donde se ubica la matriz de la compañia.
    * telefono: número de contacto.
    * correo: correo electrónico de contacto.
    * Ejemplo:
    ```json
    {
        "id":"SUP-006",
        "nombre":"Global Electronics Ltd.",
        "pais":"China",
        "telefono":"+86 10 9876 5432",
        "correo":"info@globalelectronics.cn"
    }
    ```
- **Respuesta**: 
    - Status: 201
    ```json
        [
            {
                "Email":"info@globalelectronics.cn",
                "Phone":"+86 10 9876 5432",
                "name":"Global Electronics Ltd.",
                "Country":"China",
                "ID":"SUP-006"
            }
        ]
    ```

### POST 'http://localhost:3000/api/nuevo-pedido%compra'
- **Descripción**: Realizar un nuevo pedido de compra de un producto a cualquier proveedor.
- **Cuerpo/Body**:
    * idproveedor: código único para cada proveedor formado por la subcadena sup- y su respectivo número.
    * idproducto: código único para cada producto conformado por sus siglas y su respecitov número, en este caso WR-006 significa Wireless Router, el cual es el producto número 6.
    * id: código único para cada pedido de compra formado por la subcadana pc- y su respectivo número.
    * pedido: fecha en la que se realizo el pedido de compra.
    * recibido: fecha en la que se espera lleguen los productos.
    * cantidad: número de unidades solicitadas.
    * precio: costo unitario del producto.
    * Ejemplo:
    ```json
    {
        "idproveedor":"SUP-006",
        "idproducto":"WR-006",
        "id":"PC-016",
        "pedido":"27-03-2024",
        "recibido":"04-04-2024",
        "cantidad":10.0,
        "precio":1290.0
    }
    ```
- **Respuesta**: 
    - Status: 201
    ```json
        {
            "Proveedor":[
                {
                    "Email":"info@globalelectronics.cn",
                    "Phone":"+86 10 9876 5432",
                    "name":"Global Electronics Ltd.",
                    "Country":"China",
                    "ID":"SUP-006"}
            ],
            "Producto":[
                {
                    "Description":"Dual-band Wi-Fi 6 router",
                    "Category":"Network",
                    "Price":1290,
                    "name":"Wireless Router",
                    "ID":"WR-006","Stock":30}
            ],
            "Pedido":[
                {
                    "Recibido":"04-04-2024",
                    "Cantidad":10,
                    "Pedido":"27-03-2024",
                    "ID":"PC-016",
                    "Precio":1290
                }
            ]
        }
    ```

## Como usar la API

1. Tras descargar el código instala las dependencias con:
```bash
    npm install
```

2. Crear un archivo docker-compose.yml con el siguiente código:
```yml
    version: '3.9'
services:
  #node.js app
  app:
    image: yasg07/lab_neo4j
    container_name: neo4j_api
    ports:
      -  "3000:3000"
    environment:
      -  NEO4J_URI=neo4j://neo4jdb:7687
      -  REDIS_HOST=rediscachedb
      -  REDIS_PORT=6379
    depends_on:
      -  neo4jdb
      -  rediscachedb
    volumes:
      -  .:/usr/src/app
      -  /usr/src/app/node_modules
    command: npm start
  #Neo4j
  neo4jdb:
    image: neo4j
    container_name: neo4jdb
    ports:
      -  "7474:7474"
      -  "7687:7687"
    environment:
      -  NEO4J_AUTH=none
  #redis-cache-database
  rediscachedb:
    image: redis/redis-stack
    container_name: rediscachedb
    ports:
      -  "6379:6379"
      -  "8001:8001"
```

3. En el directorio donde se encuentra el docker-compose ejecutar:
```bash
    docker compose up -d
```

4. Levantar el servidor con el comando:
```bash
    npm start
``` 
