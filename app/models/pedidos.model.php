<?php

class pedidosModel {

    private $db;
   
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tienda_ropa;charset=utf8', 'root', '');
    }

    public function getAll() {
        $query = $this->db->prepare("SELECT * FROM pedidos");
        $query->execute();
        $pedidos = $query->fetchAll(PDO::FETCH_OBJ);
        return $pedidos;
    }

  
    public function getPedidoById($id_pedido) {
        $query = $this->db->prepare("SELECT * FROM pedidos WHERE id_pedido = ?");
        $query->execute([$id_pedido]);
        $pedidoById = $query->fetch(PDO::FETCH_OBJ);
        return $pedidoById;
    }

   
    public function insertPedido($id_pedido, $fecha_pedido, $estado, $total) {
        $query = $this->db->prepare("INSERT INTO pedidos (id_pedido, fecha_pedido, estado, total) VALUES (?, ?, ?, ?)");
        $query->execute([$id_pedido, $fecha_pedido, $estado, $total]);

        return $this->db->lastInsertId();
    }


   
    function deleteProduct($id_pedido) {
        $query = $this->db->prepare('DELETE FROM pedidos WHERE id_pedido = ?');
        $query->execute([$id_pedido]);
    }

 
    function sortbyorder($sortby = null , $order = null ){
        $query = $this->db->prepare("SELECT * FROM pedidos ORDER BY $sortby $order");
        $query->execute();
        $pedidos = $query->fetchAll(PDO::FETCH_OBJ);
        return $pedidos;
    }

   
    function update($id_pedido, $fecha_pedido, $estado, $total){
        $query = $this->db->prepare('UPDATE pedidos SET fecha_pedido=?, estado=?, total=? WHERE id_pedido=?');
        $query->execute([$id_pedido, $fecha_pedido, $estado, $total]);
    }

}