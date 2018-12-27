import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AssetsComponent } from './assets/assets.component';
import { AssetrComponent } from './assetr.component';

@NgModule({
  declarations: [
    AssetsComponent,
    AssetrComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    AssetrComponent,
    AssetsComponent
  ]
})
export class AssetrModule { }
