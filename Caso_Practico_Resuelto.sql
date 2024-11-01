--Consultas_Tabla "menu_items"

SELECT * FROM menu_items;

--Encontrar el número de artículos en el menú

SELECT COUNT(menu_item_id) FROM menu_items

--El menú contiene 32 artículos 

--Cuál es el artículo menos caro y el más caro en el menú?

SELECT item_name, price
FROM menu_items
WHERE price = (SELECT MAX(price) FROM menu_items);

El artículo más caro es Shrimp Scampi con un precio de 19.95

SELECT item_name, price
FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items);

El artículo menos caro es Edamame con un precio de 5.00

--Cuántos platos americanos hay en el menú?

SELECT COUNT(category) 
FROM menu_items
WHERE category = 'American';

Hay 6 platos americanos en el menú

--Cuál es el precio promedio de los platos?

SELECT AVG(price) AS precio_promedio
FROM menu_items;

El precio promedio de los platos es de 13.285

--Explorar_Tabla "order_details"

SELECT * FROM order_details;

--¿Cuántos pedidos únicos se realizaron en total?

SELECT COUNT (DISTINCT order_details_id) AS total_pedidos_unicos
FROM order_details;

Se realizaron 12234 pedidos únicos en total

--¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

SELECT order_id, item_id
FROM order_details
ORDER BY item_id DESC
LIMIT 5;

Los 5 pedidos que tuvieron el mayor número de artículos fueron: 161,50, 125,147 y 200

--¿Cuándo se realizó el primer pedido y el último pedido?

SELECT 
MIN(order_date) AS primer_pedido,
MAX(order_date) AS ultimo_pedido
FROM order_details;

El primer pedido se realizo el 2023-01-01 y el último pedido se realizo el 2023-03-31


--¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

SELECT Count(order_id)
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

Se realizaron 702 pedidos 

--Relacion_de_clientes_menu

/*Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).*/

SELECT item_id, menu_item_id
FROM order_details AS OD
LEFT JOIN menu_items AS MI ON od.item_id = mi.menu_item_id;

SELECT * FROM order_details AS OD
LEFT JOIN menu_items AS MI 
ON od.item_id = mi.menu_item_id;


--¿Cuántos platos Italianos hay en el menú?
SELECT COUNT(category) 
FROM menu_items
WHERE category = 'Italian';

-- Ingreso total  

SELECT SUM(price) AS total_price
FROM order_details AS od
JOIN menu_items AS mi ON od.item_id = mi.menu_item_id;

El ingreso total en el perido  2023-01-01 - 2023-03-31 fue de 15,9217.90

--Los 3 platillos que más se piden 
	
SELECT item_name, menu_item_id
FROM menu_items
ORDER BY menu_item_id DESC
LIMIT 3;

Los tres platillos más solicitados son: Eggplant Parmesan, Chicken Parmesan y Shrimp Scampi

-- Cual es el promedio con respecto al horario en el que se realizan los pedidos 

SELECT AVG(order_time) 
FROM order_details;

El promedio con respceto al horario en el que se realizan los pedidos es a las 16:22:27

--Estilo de cocina mayor y menor mente solicitados en el menú 
	
SELECT 
MIN(category) AS H_typeofcousine,
MAX(category) AS L_typeofcousine
FROM menu_items;

El estilo de cocina que mayor demanda es el American y el que tiene menos demanda es el Mexican
