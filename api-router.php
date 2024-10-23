<?php
require_once 'config.php';
require_once './libs/router.php';
require_once './app/controllers/pedidos.controller.php';

// crea el router
$router = new Router();

// tabla de ruteo
$router->addRoute('pedidos', 'GET', 'pedidosController', 'showAll');
$router->addRoute('pedidos/:ID', 'GET', 'pedidosController', 'showPedidoById');
$router->addRoute('pedidos/:ID', 'DELETE', 'pedidosController', 'deletePedido');
$router->addRoute('pedidos', 'POST', 'pedidosController', 'addPedido');
$router->addRoute('pedidos/:ID', 'PUT', 'pedidosController', 'updatePedido'); 
$router->addRoute('pedidos/token', 'GET', 'UserApiController', 'getToken');

echo $_GET["resource"];

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);