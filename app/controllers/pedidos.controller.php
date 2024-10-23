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

    
    public function showAll($params = NULL){
      if (isset($_GET['sortby']) && isset($_GET['order'])) { 
        if (($_GET['sortby'] == 'id_pedido' || $_GET['sortby'] == 'fecha_pedido'|| $_GET['sortby'] == 'estado'|| $_GET['sortby'] == 'total') 
        &&($_GET['order']== 'ASC' || $_GET['order']== 'DESC')){
          $pedidos = $this->model->sortbyorder($_GET['sortby'], $_GET['order']);
          return $this->apiView->response($pedidos, 200);
        }else{
          return $this->apiView->response("Los campos son inválidos", 400);
        }
      } 
      else{
        $pedidos = $this->model->getAll();
        return $this->apiView->response($pedidos, 200);
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
        if ($pedidoData) {
            $this->model->update($id_pedido, $pedidoData->fecha_pedido, $pedidoData->estado, $pedidoData->total);
            $this->apiView->response("El pedido con el id=$id_pedido se actualizó correctamente", 200);
        } else {
            $this->apiView->response("El pedido no existe", 404);
        }
    }
    

    public function filterPedidos($params = NULL) {
      $campo = $params[':CAMPO'];
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