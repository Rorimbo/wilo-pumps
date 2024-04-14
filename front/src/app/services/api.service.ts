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
    return this.http.get<Data[]>('https://localhost:7238/api/pumps/getAll');
  }

  getDataById(id: number): Observable<Data> {
    return this.http.get<Data>(`https://localhost:7238/api/pumps/get/${id}`);
  }

  addData(data: Data) {
    return this.http.post('https://localhost:7238/api/pumps/add', data);
  }

  updateData(data: Data) {
    return this.http.put('https://localhost:7238/api/pumps/update', data);
  }

  deleteData(id: number) {
    return this.http.delete(`https://localhost:7238/api/pumps/delete/${id}`);
  }
}
