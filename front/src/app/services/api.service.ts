import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Data } from '../types/data';
import { SelectData } from '../types/select-data';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(private http: HttpClient) {}

  apiUrl = 'https://localhost:7238';

  getData(): Observable<Data[]> {
    return this.http.get<Data[]>(`${this.apiUrl}/api/pumps/getAll`);
  }

  getDataById(id: number): Observable<Data> {
    return this.http.get<Data>(`${this.apiUrl}/api/pumps/get/${id}`);
  }

  addData(data: Data) {
    return this.http.post(`${this.apiUrl}/api/pumps/add`, data);
  }

  updateData(data: Data) {
    return this.http.put(`${this.apiUrl}/api/pumps/update`, data);
  }

  deleteData(id: number) {
    return this.http.delete(`${this.apiUrl}/api/pumps/delete/${id}`);
  }

  getMotors() {
    return this.http.get<SelectData[]>(`${this.apiUrl}/api/pumps/getMotors`);
  }

  getMaterials() {
    return this.http.get<SelectData[]>(`${this.apiUrl}/api/pumps/getMaterials`);
  }
}
