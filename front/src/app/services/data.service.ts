import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { Observable, map, of } from 'rxjs';
import { Data } from '../types/data';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  constructor(private api: ApiService) {}

  getData(): Observable<Data[]> {
    return this.api.getData();
  }

  addData(data: Data) {
    return this.api.addData(data).subscribe();
  }

  updateData(data: Data) {
    return this.api.updateData(data).subscribe();
  }

  deleteData(id: number) {
    return this.api.deleteData(id).subscribe();
  }
}
