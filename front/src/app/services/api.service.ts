import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Data } from '../types/data';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(private http: HttpClient) {}

  getData(): Observable<Data[]> {
    return this.http.get<Data[]>('');
  }

  addData(data: Data) {
    return this.http.post('', data);
  }

  updateData(data: Data) {
    return this.http.put('', data);
  }

  deleteData(id: number) {
    return this.http.delete(`/${id}`);
  }
}
