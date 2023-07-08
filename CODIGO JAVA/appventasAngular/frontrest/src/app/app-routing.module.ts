import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {CatalogoComponent} from "./catalogo/catalogo.component";
import {LoginComponent} from "./login/login.component";

const routes: Routes = [
  {path:"catalogo", component: CatalogoComponent},
  {path: "login", component: LoginComponent}
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
