<?php

class pedidosModel {

    private $db;
   
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tienda_ropa;charset=utf8', 'root', '');
    }

    public function getAll($limit = null, $offset = null) {
        $query = "SELECT * FROM pedidos";
        
        if ($limit !== null && $offset !== null) {
            $query .= " LIMIT :limit OFFSET :offset";
        }
        
        $stmt = $this->db->prepare($query);
        
        if ($limit !== null && $offset !== null) {
            $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);
            $stmt->bindValue(':offset', (int)$offset, PDO::PARAM_INT);
        }
    
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
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


   
    function deletePedido($id_pedido) {
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

    public function filterPedidos($campo, $valor) {
        // Escapa el campo para evitar inyección SQL
        $camposValidos = ['id_pedido', 'fecha_pedido', 'estado', 'total'];
        
        if (!in_array($campo, $camposValidos)) {
            throw new InvalidArgumentException("Campo no válido");
        }
    
        // Prepara y ejecuta la consulta
        $query = $this->db->prepare("SELECT * FROM pedidos WHERE $campo = ?");
        $query->execute([$valor]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    public function getTotalCount() {
        $query = "SELECT COUNT(*) FROM pedidos";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
    

}