# API de Pedidos

Esta API permite gestionar los pedidos en la tienda de ropa. A continuación se detalla cada endpoint disponible, incluyendo métodos, descripciones, y ejemplos de uso.

# http://localhost/WEB-2APIRESTful/api/pedidos

## Endpoints

### 1. Obtener todos los pedidos

- **Método:** `GET`
- **Endpoint:** `/pedidos`
- **Descripción:** Retorna una lista de todos los pedidos.
- **Ejemplo de uso:**
  ```bash
  curl -X GET http://localhost/WEB-2APIRESTful/api/pedidos
  ```

### 2. Filtrar pedidos por campo

- **Método:** `POST`
- **Endpoint:** `/pedidos/filter/{campo}`
- **Descripción:** Filtra los pedidos según el campo especificado y el valor correspondiente. Los campos válidos son `id_pedido`, `fecha_pedido`, `estado`, `total`.
- **Ejemplo de uso:**
  ```bash
  curl -X POST http://localhost/WEB-2APIRESTful/api/pedidos/filter/estado \
       -H "Content-Type: application/json" \
       -d '{"valor": "completado"}'
  ```

### 3. Obtener un pedido por ID

- **Método:** `GET`
- **Endpoint:** `/pedidos/{ID}`
- **Descripción:** Retorna los detalles de un pedido específico.
- **Ejemplo de uso:**
  ```bash
  curl -X GET http://localhost/WEB-2APIRESTful/api/pedidos/1
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
  curl -X POST http://localhost/WEB-2APIRESTful/api/pedidos \
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
  curl -X PUT http://localhost/WEB-2APIRESTful/api/pedidos/1 \
       -H "Content-Type: application/json" \
       -d '{"fecha_pedido": "2024-10-24", "estado": "completado", "total": 150.75}'
  ```

### 6. Eliminar un pedido

- **Método:** `DELETE`
- **Endpoint:** `/pedidos/{ID}`
- **Descripción:** Elimina un pedido específico de la base de datos.
- **Ejemplo de uso:**
  ```bash
  curl -X DELETE http://localhost/WEB-2APIRESTful/api/pedidos/1
  ```

### 7. Paginacion de pedidos

- **Método:** `GET`
- **Endpoint:** `/pedidos`
- **Descripción:** Permite obtener una lista de todos los pedidos con paginación. Puedes especificar el número de elementos por página y la página actual.
- **Parámetros de consulta:**
  limit: (opcional) Número de pedidos a retornar por página. Por defecto es 10.
  page: (opcional) Número de la página actual. Por defecto es 1.
- **Ejemplo de uso:**
  ```bash
  curl -X GET "http://localhost/WEB-2APIRESTful/api/pedidos?limit=5&page=2"
  ```
- **Respuesta:**
  La respuesta incluirá la información de paginación junto con los pedidos obtenidos. Un ejemplo de la respuesta podría ser:

  {
  "current_page": 2,
  "total_pages": 4,
  "total_items": 15,
  "items": [
  {
  "id_pedido": 6,
  "fecha_pedido": "2024-10-20",
  "estado": "pendiente",
  "total": 75.00
  },
  {
  "id_pedido": 7,
  "fecha_pedido": "2024-10-21",
  "estado": "completado",
  "total": 150.00
  }
  // ... más pedidos
  ]
  }

### 8. Ordenar pedidos por campo (Ascendente o Descendente)

- **Método:** `GET`
- **Endpoint:** `/pedidos?sortby={campo}&order={asc|desc}`
- **Descripción:** Permite ordenar los pedidos por el campo especificado en orden ascendente o descendente. Los campos válidos son id_pedido, fecha_pedido, estado, total.
- **Parámetros de consulta:**
  sortby: El campo por el cual se realizará la ordenación (por ejemplo, fecha_pedido, estado).
  order: Define el orden de la lista. Utiliza asc para orden ascendente o desc para descendente.
- **Ejemplo de uso:**
  Ordenar pedidos por total en orden ascendente:
  ```bash
  curl -X GET "http://localhost/WEB-2APIRESTful/api/pedidos?sortby=total&order=asc"
  ```
  Ordenar pedidos por fecha_pedido en orden descendente:
  ```bash
  curl -X GET "http://localhost/WEB-2APIRESTful/api/pedidos?sortby=fecha_pedido&order=desc"
  ```
  - **Respuesta:**
    La respuesta será una lista de los pedidos ordenados según el campo y orden especificados. Ejemplo de respuesta:
    [
    {
    "id_pedido": 3,
    "fecha_pedido": "2024-10-23",
    "estado": "pendiente",
    "total": 120.50
    },
    {
    "id_pedido": 1,
    "fecha_pedido": "2024-10-22",
    "estado": "completado",
    "total": 100.00
    }
    // ... más pedidos
    ]
