# API de Pedidos

Esta API permite gestionar los pedidos en la tienda de ropa. A continuación se detalla cada endpoint disponible, incluyendo métodos, descripciones, y ejemplos de uso.

# http://localhost/pedidos

## Endpoints

### 1. Obtener todos los pedidos

- **Método:** `GET`
- **Endpoint:** `/pedidos`
- **Descripción:** Retorna una lista de todos los pedidos.
- **Ejemplo de uso:**
  ```bash
  curl -X GET http://localhost/pedidos
  ```

### 2. Filtrar pedidos por campo

- **Método:** `POST`
- **Endpoint:** `/pedidos/filter/{campo}`
- **Descripción:** Filtra los pedidos según el campo especificado y el valor correspondiente. Los campos válidos son `id_pedido`, `fecha_pedido`, `estado`, `total`.
- **Ejemplo de uso:**
  ```bash
  curl -X POST http://localhost/pedidos/filter/estado \
       -H "Content-Type: application/json" \
       -d '{"valor": "completado"}'
  ```

### 3. Obtener un pedido por ID

- **Método:** `GET`
- **Endpoint:** `/pedidos/{ID}`
- **Descripción:** Retorna los detalles de un pedido específico.
- **Ejemplo de uso:**
  ```bash
  curl -X GET http://localhost/pedidos/1
  ```

### 4. Agregar un nuevo pedido

- **Método:** `POST`
- **Endpoint:** `/pedidos`
- **Descripción:** Agrega un nuevo pedido a la base de datos.
- **Cuerpo de la solicitud:**
  ```json
  {
    "id_pedido": 1,
    "fecha_pedido": "2024-10-23",
    "estado": "pendiente",
    "total": 100.5
  }
  ```
- **Ejemplo de uso:**
  ```bash
  curl -X POST http://localhost/pedidos \
       -H "Content-Type: application/json" \
       -d '{"id_pedido": 1, "fecha_pedido": "2024-10-23", "estado": "pendiente", "total": 100.50}'
  ```

### 5. Actualizar un pedido existente

- **Método:** `PUT`
- **Endpoint:** `/pedidos/{ID}`
- **Descripción:** Actualiza los detalles de un pedido específico.
- **Cuerpo de la solicitud:**
  ```json
  {
    "fecha_pedido": "2024-10-24",
    "estado": "completado",
    "total": 150.75
  }
  ```
- **Ejemplo de uso:**
  ```bash
  curl -X PUT http://localhost/pedidos/1 \
       -H "Content-Type: application/json" \
       -d '{"fecha_pedido": "2024-10-24", "estado": "completado", "total": 150.75}'
  ```

### 6. Eliminar un pedido

- **Método:** `DELETE`
- **Endpoint:** `/pedidos/{ID}`
- **Descripción:** Elimina un pedido específico de la base de datos.
- **Ejemplo de uso:**
  ```bash
  curl -X DELETE http://localhost/pedidos/1
  ```
