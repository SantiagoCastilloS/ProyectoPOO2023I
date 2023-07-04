export interface Producto{
  id: number;
  nombre: string;
  descripcion: string;
  stock: number;
  precioProd: number;
  porcentajeDesc: number;
  precioFinal: number;
  url: string;
  vendedor: string;
}
export interface RespuestaProducto{
  lista: Producto[];
}

