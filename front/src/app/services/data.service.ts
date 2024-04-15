import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { Observable } from 'rxjs';
import { Data } from '../types/data';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  constructor(private api: ApiService) {}

  getData(): Observable<Data[]> {
    return this.api.getData();
  }

  getDataById(id: number): Observable<Data> {
    return this.api.getDataById(id);
  }

  addData(data: Data) {
    return this.api.addData(data);
  }

  updateData(data: Data) {
    return this.api.updateData(data);
  }

  deleteData(id: number) {
    return this.api.deleteData(id);
  }

  getMotors() {
    return this.api.getMotors();
  }

  getMaterials() {
    return this.api.getMaterials();
  }
}
