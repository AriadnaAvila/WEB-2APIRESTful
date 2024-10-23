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
$router->addRoute('pedidos/filter/:campo', 'POST', 'pedidosController', 'filterPedidos');
$router->addRoute('pedidos/token', 'GET', 'UserApiController', 'getToken');

// Captura la parte de la URL que necesitas
$resource = isset($_GET["resource"]) ? $_GET["resource"] : '';

// Para depuración, puedes imprimir el recurso
echo $resource;

// Ajusta la lógica de ruteo para interpretar el valor del campo
if (preg_match('/^pedidos\/filter\/([^\/]+)$/', $resource, $matches)) {
    $campo = $matches[1]; // Captura el campo
    // Cambia a la ruta con el campo correspondiente
    $router->route("pedidos/filter/$campo", $_SERVER['REQUEST_METHOD']);
} else {
    // Ejecuta la ruta normal
    $router->route($resource, $_SERVER['REQUEST_METHOD']);
}
