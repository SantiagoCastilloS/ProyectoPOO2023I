import {Component, OnInit} from '@angular/core';
import {Producto} from "../../interfaces";
import {ApiService} from "../../ApiService";

@Component({
  selector: 'app-catalogo',
  templateUrl: './catalogo.component.html',
  styleUrls: ['./catalogo.component.scss']
})
export class CatalogoComponent implements OnInit{
  lista: Producto[] = [];
  indice: number = -1;
  producto?: Producto=undefined;
  constructor(private api:ApiService) {
  }
  ngOnInit(): void {
    this.api.mostrarproducto().subscribe(data => {this.lista = data.lista})
  }
  mostrarproducto() {
    this.producto = this.lista[this.indice]
  }
}
