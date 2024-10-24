<?php
require_once './app/models/pedidos.model.php';
require_once './app/views/api.view.php';

class pedidosController {
    private $model;
    private $viewApi;
    private $data;

    // Constructor
    public function __construct() {
        $this->model = new pedidosModel();
        $this->apiView = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    // Funcion: decodifica 
    private function getData() {
        return json_decode($this->data);
    }

    
    public function showAll($params = NULL) {
        $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10; // Número de pedidos por página
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Número de página actual
        $offset = ($page - 1) * $limit; // Calcular el desplazamiento
    
        // Verifica si hay ordenamiento
        if (isset($_GET['sortby']) && isset($_GET['order'])) { 
            try {
                $sortby = $_GET['sortby'];
                $order = $_GET['order'];
                $pedidos = $this->model->sortbyorder($sortby, $order);
                return $this->apiView->response($pedidos, 200);
            } catch (InvalidArgumentException $e) {
                return $this->apiView->response($e->getMessage(), 400);
            }
        } else {
            // Obtiene la lista de pedidos con paginación
            $pedidos = $this->model->getAll($limit, $offset);
            
            // Cuenta el total de pedidos
            $totalPedidos = $this->model->getTotalCount(); 
            $totalPages = ceil($totalPedidos / $limit); 
    
            // Prepara la respuesta con información de paginación
            $response = [
                'current_page' => $page,
                'total_pages' => $totalPages,
                'total_items' => $totalPedidos,
                'items' => $pedidos,
            ];
    
            return $this->apiView->response($response, 200);
        } 
    }
    
  
  

   
      public function showPedidoById($params = NULL) {
        $id_pedido = $params[':ID'];
        $pedidos  = $this->model->getPedidoById($id_pedido);
        if($pedidos)
            $this->apiView->response($pedidos, 200);
        else 
            $this->apiView->response("El pedido buscado con el id=$id_pedido no existe", 404);
      }

     
      public function addPedido($params = NULL){ 
        $pedidobyid = $this->getData();  
        if( empty($pedidobyid->id_pedido) || empty($pedidobyid->fecha_pedido)|| empty($pedidobyid->estado)|| empty($pedidobyid->total)){ 
            $this->apiView->response("Complete los datos", 400);
        }
        else {
            $id_pedido = $this->model->insertPedido($pedidobyid->id_pedido, $pedidobyid->fecha_pedido, $pedidobyid->estado, $pedidobyid->total);
            $pedidobyid = $this->model->getPedidoById($id_pedido);
            $this->apiView->response("El pedido se agregó correctamente", 201);
        }
      }

    
      public function deletePedido($params = NULL) {
        $id_pedido = $params[':ID'];
        $pedido  = $this->model->getPedidoById($id_pedido);
      if($pedido){
        $this->model->deletePedido($id_pedido);
        $this->apiView->response("el pedido con el id=$id_pedido se eliminó correctamente", 200);
      }
      else
        $this->apiView->response("el pedido con el id=$id_pedido no existe", 404);
      }

     
      public function updatePedido($params = null){
        $id_pedido = $params[':ID'];
        $pedidoData = $this->getData();
        
        // Verifica si el pedido existe
        if($this->model->getPedidoById($id_pedido)) {
            // Valida los campos
            if (!empty($pedidoData->fecha_pedido) && !empty($pedidoData->estado) && !empty($pedidoData->total)) {
                $this->model->update($id_pedido, $pedidoData->fecha_pedido, $pedidoData->estado, $pedidoData->total);
                $this->apiView->response("El pedido con el id=$id_pedido se actualizó correctamente", 200);
            } else {
                $this->apiView->response("Datos inválidos o incompletos", 400);
            }
        } else {
            $this->apiView->response("El pedido no existe", 404);
        }
    }
    
    

    public function filterPedidos($params = NULL) {
      $campo = $params[':campo'];
      $valor = $this->getData()->valor; // Asumiendo que el valor se envía en el cuerpo de la solicitud
  
      try {
          $pedidos = $this->model->filterPedidos($campo, $valor);
          if (!empty($pedidos)) {
              $this->apiView->response($pedidos, 200);
          } else {
              $this->apiView->response("No se encontraron pedidos para el campo $campo con el valor $valor", 404);
          }
      } catch (InvalidArgumentException $e) {
          $this->apiView->response($e->getMessage(), 400);
      } catch (Exception $e) {
          $this->apiView->response("Error en la consulta: " . $e->getMessage(), 500);
      }
  }
  
}