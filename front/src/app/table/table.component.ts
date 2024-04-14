import { Component, AfterViewInit, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';
import { DeleteDialogComponent } from '../delete-dialog/delete-dialog.component';
import { Data } from '../types/data';
import { Column } from '../types/column';
import { DialogData } from '../types/dialog-data';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DataService } from '../services/data.service';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss'],
})
export class TableComponent implements OnInit, AfterViewInit {
  @ViewChild(MatSort) sort: MatSort;
  pumpData: Data[] = [];
  displayedColumns: string[] = [
    'id',
    'name',
    'maxPressure',
    'liquidTemp',
    'weight',
    'motor',
    'housing',
    'impeller',
    'description',
    'picture',
    'price',
    'empty',
  ];
  dataSource = new MatTableDataSource(this.pumpData);

  columns: Column[] = [
    { code: 'id', name: '№' },
    { code: 'name', name: 'Наименование' },
    { code: 'maxPressure', name: 'Максимальное давление' },
    { code: 'liquidTemp', name: 'Температура жидкости' },
    { code: 'weight', name: 'Вес' },
    { code: 'motor', name: 'Мотор' },
    { code: 'housing', name: 'Материал корпуса' },
    { code: 'impeller', name: 'Материал рабочего колеса' },
    { code: 'description', name: 'Описание' },
    { code: 'picture', name: 'Фото' },
    { code: 'price', name: 'Цена' },
  ];

  constructor(public dialog: MatDialog, private dataService: DataService) {}

  ngOnInit() {
    this.dataService.getData().subscribe({
      next: (pumpData) => {
        this.pumpData = pumpData;
        this.dataSource.data = this.pumpData;
      },
      error: (err: any) => console.log(err),
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }

  addData(): void {
    let dialogData: DialogData = {
      title: 'Добавить насос',
      rows: this.columns,

      onSaveClick: (data: Data) => {
        this.pumpData.push(data);
        this.dataSource.data = this.pumpData;
        this.dataService.addData(data);
      },
    };

    this.dialog.open(DialogComponent, {
      width: '448px',
      height: '593px',
      panelClass: 'dialog-cont',
      data: dialogData,
    });
  }

  editData(rowIndex: number): void {
    let dialogData: DialogData = {
      title: 'Редактирование',
      rowData: this.pumpData[rowIndex],
      rows: this.columns,
      onSaveClick: (data: Data) => {
        this.pumpData[rowIndex] = data;
        this.dataSource.data = this.pumpData;
        this.dataService.updateData(data);
      },
    };

    this.dialog.open(DialogComponent, {
      width: '448px',
      height: '593px',
      panelClass: 'dialog-cont',
      data: dialogData,
    });
  }

  deleteData(data: Data): void {
    let title = `Подтвердите удаление насоса ${data.name}`;
    let dialogData: DialogData = {
      title: title,
      onSaveClick: () => {
        let id = data.id;
        let index = this.pumpData.indexOf(data);
        this.pumpData.splice(index, 1);
        this.dataSource.data = this.pumpData;
        this.dataService.deleteData(id);
      },
    };

    this.dialog.open(DeleteDialogComponent, {
      width: '448px',
      height: '300px',
      panelClass: 'dialog-cont',
      data: dialogData,
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}
