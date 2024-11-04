//Query 00: Script del escenario de datos.

//Proveedor
merge(sup001:Proveedor {ID: "SUP-001", name: "Tech Innovations Inc.", Country: "USA", Phone: "+1 (555) 123-4567", Email: "contact@techinnovations.com"})
merge(sup002:Proveedor {ID: "SUP-002", name: "Global Electronics Ltd.", Country: "China", Phone: "+86 10 9876 5432", Email: "info@globalelectronics.cn"})
merge(sup003:Proveedor {ID: "SUP-003", name: "Future Gadgets GmbH", Country: "Germany", Phone: "+49 30 12345678", Email: "sales@futuregadgets.de"})
merge(sup004:Proveedor {ID: "SUP-004", name: "NextGen Devices Pte.", Country: "Singapore", Phone: "+65 6123 4567", Email: "support@nextgendevices.sg"})
merge(sup005:Proveedor {ID: "SUP-005", name: "Smart Solutions Co.", Country: "Canada", Phone: "+1 (416) 555-7890", Email: "hello@smartsolutions.ca"})

//Producto
merge(tv001:Producto {name: "Smart TV 55", Description: "4K Ultra HD Smart TV with HDR support", Category: "TV", ID: "TV-001", Price: 6990.0, Stock: 25.0})
merge(hp002:Producto {name: "Bluetooth Headphones", Description: "Noise-canceling wireless headphones", Category: "Audio", ID: "HP-002", Price: 1490.0, Stock: 40.0})
merge(lt003:Producto {name: "Laptop 15", Description: "Intel i5, 8GB RAM, 256GB SSD", Category: "Laptop", ID: "LT-003", Price: 7990.0, Stock: 15.0})
merge(pb004:Producto {name: "Portable Charger", Description: "20,000mAh power bank with quick charge", Category: "Accessory", ID: "PB-004", Price: 390.0, Stock: 100.0})
merge(sw005:Producto {name: "Smartwatch", Description: "Fitness tracking, heart rate monitor", Category: "Accessory", ID: "SW-005", Price: 1990.0, Stock: 60.0})
merge(wr006:Producto {name: "Wireless Router", Description: "Dual-band Wi-Fi 6 router", Category: "Network", ID: "WR-006", Price: 1290.0, Stock: 30.0})
merge(ac007:Producto {name: "Action Camera", Description: "4K video, waterproof, with Wi-Fi", Category: "Camera", ID: "AC-007", Price: 2490.0, Stock: 20.0})
merge(gc008:Producto {name: "Gaming Console", Description: "Next-gen gaming console with 1TB storage", Category: "Gaming", ID: "GC-008", Price: 12990.0, Stock: 10.0})
merge(tb009:Producto {name: "Tablet 10", Description: "Android tablet, 64GB storage, 4GB RAM", Category: "Tablet", ID: "TB-009", Price: 2990.0, Stock: 35.0})
merge(er010:Producto {name: "E-Reader", Description: "8GB storage, glare-free display", ID: "ER-010", Category: "Kindle", Price: 1290.0, Stock: 50.0})
merge(bs011:Producto {name: "Bluetooth Speaker", Description: "Waterproof portable speaker with 12-hour battery", Category: "Audio", ID: "BS-011", Price: 990.0, Stock: 75.0})
merge(dc012:Producto {name: "DSLR Camera", Description: "24MP, interchangeable lens, video capable", Category: "Camera", ID: "DC-012", Price: 8990.0, Stock: 8.0})
merge(ha013:Producto {name: "Home Assistant Device", Description: "Voice-controlled smart home hub", Category: "Accessory", ID: "HA-013", Price: 890.0, Stock: 55.0})
merge(lt014:Producto {name: "Laptop Acer", Description: "Intel i5, 8GB RAM, 512GB SSD", Category: "Laptop", ID: "LT-014", Price: 7990.0, Stock: 15.0})
merge(imp3d015:Producto {name: "3D Printer", Description: "FDM 3D printer with build plate", Category: "Printer", ID: "3DP-015", Price: 4990.0, Stock: 5.0})

//PC: Proveedor-Pedido de Compra(PC)-Producto
merge(pc001:PC {ID: "PC-001", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 6990.0})
merge(sup001)-[pro001:Provee]->(pc001)
merge(pc001)-[ll001:Llega]->(tv001)
merge(pc002:PC {ID: "PC-002", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 1490.0})
merge(sup001)-[pro002:Provee]->(pc002)
merge(pc002)-[ll002:Llega]->(hp002)
merge(pc003:PC {ID: "PC-003", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 7990.0})
merge(sup001)-[pro003:Provee]->(pc003)
merge(pc003)-[ll003:Llega]->(lt003)
merge(pc004:PC {ID: "PC-004", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 390.0})
merge(sup002)-[pro004:Provee]->(pc004)
merge(pc004)-[ll004:Llega]->(pb004)
merge(pc005:PC {ID: "PC-005", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 1990.0})
merge(sup002)-[pro005:Provee]->(pc005)
merge(pc005)-[ll005:Llega]->(sw005)
merge(pc006:PC {ID: "PC-006", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 1290.0})
merge(sup002)-[pro006:Provee]->(pc006)
merge(pc006)-[ll006:Llega]->(wr006)
merge(pc007:PC {ID: "PC-007", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 2490.0})
merge(sup003)-[pro007:Provee]->(pc007)
merge(pc007)-[ll007:Llega]->(ac007)
merge(pc008:PC {ID: "PC-008", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 12990.0})
merge(sup003)-[pro008:Provee]->(pc008)
merge(pc008)-[ll008:Llega]->(gc008)
merge(pc009:PC {ID: "PC-009", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 2990.0})
merge(sup003)-[pro009:Provee]->(pc009)
merge(pc009)-[ll009:Llega]->(tb009)
merge(pc010:PC {ID: "PC-010", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 1290.0})
merge(sup004)-[pro010:Provee]->(pc010)
merge(pc010)-[ll010:Llega]->(er010)
merge(pc011:PC {ID: "PC-011", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 990.0})
merge(sup004)-[pro011:Provee]->(pc011)
merge(pc011)-[ll011:Llega]->(bs011)
merge(pc012:PC {ID: "PC-012", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 8990.0})
merge(sup004)-[pro012:Provee]->(pc012)
merge(pc012)-[ll012:Llega]->(dc012)
merge(pc013:PC {ID: "PC-013", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 890.0})
merge(sup005)-[pro013:Provee]->(pc013)
merge(pc013)-[ll013:Llega]->(ha013)
merge(pc014:PC {ID: "PC-014", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 7990.0})
merge(sup005)-[pro014:Provee]->(pc014)
merge(pc014)-[ll014:Llega]->(lt014)
merge(pc015:PC {ID: "PC-015", Pedido: "27-03-2024", Recibido: "04-04-2024", Cantidad: 15.0, Precio: 4990.0})
merge(sup005)-[pro015:Provee]->(pc015)
merge(pc015)-[ll015:Llega]->(imp3d015)

//Cliente-Pedido de Venta(PV)-Producto

//Cliente
merge(cli001:Cliente {ID: "CLI-001", Name: "Ezquivel Alfonso", Address: "123 Elm St",	City: "Guadalajara", Phone: "+1 (555) 234-5678", Email: "john.doe@example.com"})
merge(cli002:Cliente {ID: "CLI-002", Name: "Frias Rodolfo", Address: "456 Oak Ave", City: "Boneyard", Phone: "+1 (555) 345-6789", Email: "sarah.smith@example.com"})
merge(cli003:Cliente {ID: "CLI-003", Name: "Dimarco Jordi", Address: "789 Pine Rd", City: "The Divide", Phone: "+1 (555) 456-7890", Email: "michael.j@example.com"})
merge(cli004:Cliente {ID: "CLI-004", Name: "Solomon Edward", Address: "101 Maple Blvd", City: "Shady Sands", Phone: "+1 (555) 567-8901", Email: "emily.davis@example.com"})
merge(cli005:Cliente {ID: "CLI-005", Name: "Graham Joshua", Address: "202 Birch Ln", City: "Zion", Phone: "+1 (555) 678-9012", Email: "david.wilson@example.com"})
merge(cli006:Cliente {ID: "CLI-006", Name: "Villalobos Diego", Address: "303 Cedar St", City: "Hidden Valley", Phone: "+1 (555) 789-0123", Email: "alice.brown@example.com"})
merge(cli007:Cliente {ID: "CLI-007", Name: "Carrasquedo Alessandro", Address: "404 Spruce Dr", City: "La Laguna", Phone: "+1 (555) 890-1234",	Email: "mark.taylor@example.com"})
merge(cli008:Cliente {ID: "CLI-008", Name: "White Walter", Address: "505 Cherry Ln", City: "Diamond City", Phone: "+1 (555) 901-2345", Email: "jennifer.white@example.com"})
merge(cli009:Cliente {ID: "CLI-009", Name: "Cabral Aaron", Address: "606 Walnut St", City: "Dave Republic", Phone: "+1 (555) 012-3456", Email: "brian.lee@example.com"})
merge(cli010:Cliente {ID: "CLI-010", Name: "Elijah", Address: "707 Ash Ct", City: "Apocalyptic City", Phone: "+1 (555) 123-4567", Email: "jessica.miller@example.com"})

//Pedido de Venta(PV)
merge(pv001:Venta {ID: "PV-001", Entrega: "01-11-24", Total: 19980.0})
merge(cli001)-[pedido001:Compra]->(pv001)
merge(pv001)-[venta001:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv001)-[venta002:Vendido {Cantidad:1,Precio:12990.0}]->(gc008)
merge(pv002:Venta {ID: "PV-002", Entrega: "01-11-24", Total: 1990.0})
merge(cli001)-[pedido002:Compra]->(pv002)
merge(pv002)-[venta003:Vendido {Cantidad:1,Precio:1990.0}]->(sw005)
merge(pv003:Venta {ID: "PV-003", Entrega: "01-11-24", Total: 1290.0})
merge(cli001)-[pedido003:Compra]->(pv003)
merge(pv003)-[venta004:Vendido {Cantidad:1,Precio:1290.0}]->(wr006)
merge(pv004:Venta {ID: "PV-004", Entrega: "01-11-24", Total: 6990.0})
merge(cli002)-[pedido004:Compra]->(pv004)
merge(pv004)-[venta005:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv005:Venta {ID: "PV-005", Entrega: "01-11-24", Total: 10570.0})
merge(cli002)-[pedido005:Compra]->(pv005)
merge(pv005)-[venta006:Vendido {Cantidad:2,Precio:1290.0}]->(sw005)
merge(pv005)-[venta007:Vendido {Cantidad:1,Precio:7990.0}]->(lt003)
merge(pv006:Venta {ID: "PV-006", Entrega: "01-11-24", Total: 2490.0})
merge(cli002)-[pedido006:Compra]->(pv006)
merge(pv006)-[venta008:Vendido {Cantidad:1,Precio:2490.0}]->(ac007)
merge(pv007:Venta {ID: "PV-007", Entrega: "01-11-24", Total: 2990.0})
merge(cli003)-[pedido007:Compra]->(pv007)
merge(pv007)-[venta009:Vendido {Cantidad:1,Precio:2990.0}]->(tb009)
merge(pv008:Venta {ID: "PV-008", Entrega: "01-11-24", Total: 990.0})
merge(cli003)-[pedido008:Compra]->(pv008)
merge(pv008)-[venta010:Vendido {Cantidad:1,Precio:990.0}]->(bs011)
merge(pv009:Venta {ID: "PV-009", Entrega: "01-11-24", Total: 6990.0})
merge(cli003)-[pedido009:Compra]->(pv009)
merge(pv009)-[venta011:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv010:Venta {ID: "PV-010", Entrega: "01-11-24", Total: 6990.0})
merge(cli004)-[pedido010:Compra]->(pv010)
merge(pv010)-[venta012:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv011:Venta {ID: "PV-011", Entrega: "01-11-24", Total: 990.0})
merge(cli004)-[pedido011:Compra]->(pv011)
merge(pv011)-[venta013:Vendido {Cantidad:1,Precio:990.0}]->(bs011)
merge(pv012:Venta {ID: "PV-012", Entrega: "01-11-24", Total: 1490.0})
merge(cli004)-[pedido012:Compra]->(pv012)
merge(pv012)-[venta014:Vendido {Cantidad:1,Precio:1490.0}]->(hp002)
merge(pv013:Venta {ID: "PV-013", Entrega: "01-11-24", Total: 14980.0})
merge(cli005)-[pedido013:Compra]->(pv013)
merge(pv013)-[venta015:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv013)-[venta016:Vendido {Cantidad:1,Precio:7990.0}]->(lt003)
merge(pv014:Venta {ID: "PV-014", Entrega: "01-11-24", Total: 1290.0})
merge(cli005)-[pedido014:Compra]->(pv014)
merge(pv014)-[venta017:Vendido {Cantidad:1,Precio:1290.0}]->(er010)
merge(pv015:Venta {ID: "PV-015", Entrega: "01-11-24", Total: 390.0})
merge(cli005)-[pedido015:Compra]->(pv015)
merge(pv015)-[venta018:Vendido {Cantidad:1,Precio:390.0}]->(pb004)
merge(pv016:Venta {ID: "PV-016", Entrega: "01-11-24", Total: 8990.0})
merge(cli006)-[pedido016:Compra]->(pv016)
merge(pv016)-[venta019:Vendido {Cantidad:1,Precio:8990.0}]->(dc012)
merge(pv017:Venta {ID: "PV-017", Entrega: "01-11-24", Total: 890.0})
merge(cli006)-[pedido017:Compra]->(pv017)
merge(pv017)-[venta020:Vendido {Cantidad:1,Precio:890.0}]->(ha013)
merge(pv018:Venta {ID: "PV-018", Entrega: "01-11-24", Total: 12980.0})
merge(cli006)-[pedido018:Compra]->(pv018)
merge(pv018)-[venta021:Vendido {Cantidad:1,Precio:7990.0}]->(lt014)
merge(pv018)-[venta022:Vendido {Cantidad:1,Precio:4990.0}]->(imp3d015)
merge(pv019:Venta {ID: "PV-019", Entrega: "01-11-24", Total: 6990.0})
merge(cli007)-[pedido019:Compra]->(pv019)
merge(pv019)-[venta023:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv020:Venta {ID: "PV-020", Entrega: "01-11-24", Total: 990.0})
merge(cli007)-[pedido020:Compra]->(pv020)
merge(pv020)-[venta024:Vendido {Cantidad:1,Precio:990.0}]->(bs011)
merge(pv021:Venta {ID: "PV-021", Entrega: "01-11-24", Total: 12990.0})
merge(cli007)-[pedido021:Compra]->(pv021)
merge(pv021)-[venta025:Vendido {Cantidad:1,Precio:12990.0}]->(gc008)
merge(pv022:Venta {ID: "PV-022", Entrega: "01-11-24", Total: 12990.0})
merge(cli008)-[pedido022:Compra]->(pv022)
merge(pv022)-[venta026:Vendido {Cantidad:1,Precio:12990.0}]->(gc008)
merge(pv023:Venta {ID: "PV-023", Entrega: "01-11-24", Total: 6990.0})
merge(cli008)-[pedido023:Compra]->(pv023)
merge(pv023)-[venta027:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv024:Venta {ID: "PV-024", Entrega: "01-11-24", Total: 990.0})
merge(cli008)-[pedido024:Compra]->(pv024)
merge(pv024)-[venta028:Vendido {Cantidad:1,Precio:990.0}]->(bs011)
merge(pv025:Venta {ID: "PV-025", Entrega: "01-11-24", Total: 12990.0})
merge(cli009)-[pedido025:Compra]->(pv025)
merge(pv025)-[venta029:Vendido {Cantidad:1,Precio:12990.0}]->(gc008)
merge(pv026:Venta {ID: "PV-026", Entrega: "01-11-24", Total: 6990.0})
merge(cli009)-[pedido026:Compra]->(pv026)
merge(pv026)-[venta030:Vendido {Cantidad:1,Precio:6990.0}]->(tv001)
merge(pv027:Venta {ID: "PV-027", Entrega: "01-11-24", Total: 990.0})
merge(cli009)-[pedido027:Compra]->(pv027)
merge(pv027)-[venta031:Vendido {Cantidad:1,Precio:990.0}]->(bs011)
merge(pv028:Venta {ID: "PV-028", Entrega: "01-11-24", Total: 10480.0})
merge(cli010)-[pedido028:Compra]->(pv028)
merge(pv028)-[venta032:Vendido {Cantidad:1,Precio:7990.0}]->(lt003)
merge(pv028)-[venta033:Vendido {Cantidad:1,Precio:2490.0}]->(ac007)
merge(pv029:Venta {ID: "PV-029", Entrega: "01-11-24", Total: 1490.0})
merge(cli010)-[pedido029:Compra]->(pv029)
merge(pv029)-[venta034:Vendido {Cantidad:1,Precio:1490.0}]->(hp002)
merge(pv030:Venta {ID: "PV-030", Entrega: "01-11-24", Total: 1990.0})
merge(cli010)-[pedido030:Compra]->(pv030)
merge(pv030)-[venta035:Vendido {Cantidad:1,Precio:1990.0}]->(sw005)

//Cliente-Devolucion-PV

//Devoluciones
merge(cli001)-[dev001:Devolucion {ID: "Dev-001", Fecha: "30-11-2024", Motivo: "Tiene pixeles muertos", Reembolso: "No"}]->(pv001)
merge(cli002)-[dev002:Devolucion {ID: "Dev-002", Fecha: "30-11-2024", Motivo: "Tiene pixeles muertos", Reembolso: "Sí"}]->(pv004)
merge(cli005)-[dev003:Devolucion {ID: "Dev-003", Fecha: "30-11-2024", Motivo: "Tiene pixeles muertos", Reembolso: "Sí"}]->(pv014)
merge(cli008)-[dev004:Devolucion {ID: "Dev-004", Fecha: "30-11-2024", Motivo: "Tiene pixeles muertos", Reembolso: "No"}]->(pv023)

//Query 1: Obtener la lista de productos que tienen menos de 10 unidades en stock.
match(p:Producto)
where p.Stock<10.0
return p

//Query 2: Encontrar los proveedores que suministran productos de una categoría en específico.
match(s:Proveedor)-[sup:Provee]->(pc:PC)-[ll:Llega]->(p:Producto)
where p.Category="Network"
return s,p,sup,pc,ll

//Query 3: Obtener la lista de pedidos de compra que fueron realizados a un proveedor en específico.
match(s:Proveedor)-[sup:Provee]->(pc:PC)-[ll:Llega]->(p:Producto)
where toLower(s.ID)="sup-001"
return s,sup,pc,ll,p

//Query 4: Encontrar los productos que han sido comprados por más de 5 clientes diferentes.
match (c:Cliente)-[:Compra]->(:Venta)-[:Vendido]->(p:Producto)
with p, count(distinct c) AS numClientes
where numClientes >= 5
return p, numClientes

//Query 5: Obtener la lista de todos los proveedores.
match(s:Proveedor)
return s

//Query 6: Encontrar los pedidos de venta que tienen una devolución.
match(c:Cliente)-[d:Devolucion]->(v:Venta)
return v,d,c

//Query 7: Listar los pedidos de venta que tienen un valor total mayor a $10,000.
match(v:Venta)
where v.Total>10000.0
return v

//Query 8: Cambiar todos los productos suministrados por un proveedor a otro proveedor.
match (s:Proveedor)-[r:Provee]->(pc:PC)
match (us:Proveedor)
where toLower(s.ID)="sup-001" and toLower(us.ID)="sup-002"
create(us)-[rr:Provee]->(pc)
set rr=r
delete r

//Query 9: Obtener la lista de proveedores que han recibido pedidos de compra por más de $50,000 en total.
match(s:Proveedor)-[sup:Provee]->(pc:PC)-[ll:Llega]->(p:Producto)
where (pc.Cantidad*pc.Precio)>50000.0
return s,sup,pc,ll,p

//Query 10: Encontrar los productos que se encuentran agotados (sin stock) en el inventario.
match(p:Producto)
where p.Stock=0
return p

//Query 11: Obtener la lista de clientes.
match(c:Cliente)
return c

//Query 12: Eliminar todos los proveedores y sus nodos asociados.
match(s:Proveedor)-[:Provee]->(pc:PC)
match(p:Proveedor)
detach delete s,pc,p

//Query 13: Todos los productos de una categoría específica eliminados del inventario.
match(p:Producto)
where toLower(p.Category)="accessory"
detach delete p

//Query 14: Todos los pedidos de compra de un proveedor en particular son transferidos a otro proveedor por un cambio de contrato.
match (s:Proveedor)-[r:Provee]->(pc:PC)
match (us:Proveedor)
where toLower(s.ID)="sup-001" and toLower(us.ID)="sup-002"
create(us)-[rr:Provee]->(pc)
set rr=r
delete r

//Query 15: Eliminar todos los clientes que han realizado devoluciones.
match (c)-[:Devolucion]->()
detach delete c