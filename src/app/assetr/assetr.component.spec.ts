import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetrComponent } from './assetr.component';

describe('AssetrComponent', () => {
  let component: AssetrComponent;
  let fixture: ComponentFixture<AssetrComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetrComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
