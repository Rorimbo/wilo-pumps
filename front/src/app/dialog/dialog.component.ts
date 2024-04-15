import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DialogData } from '../types/dialog-data';
import { SelectData } from '../types/select-data';
import { forkJoin } from 'rxjs';
import { DataService } from '../services/data.service';
import { Types } from '../types/column';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss'],
})
export class DialogComponent implements OnInit {
  formGroup: FormGroup;
  motors: SelectData[];
  materials: SelectData[];
  pictures: string[] = [
    'RTEW_2358_EM_v3',
    'NOC_258_EM',
    'TNOC_1258_EM',
    'BOC_2758_EM',
    'REW_2358_EM',
    'POC_2358_EM',
  ];

  types = Types;

  constructor(
    public dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private fb: FormBuilder,
    public dataService: DataService,
    private _snackBar: MatSnackBar
  ) {
    if (!data) {
      this.data = {} as DialogData;
    }

    let newForm = {};
    this.data.rows?.forEach((row) => {
      newForm = {
        ...newForm,
        ...{
          [row.code]: ['', row.nullable ? null : Validators.required],
        },
      };
    });
    this.formGroup = this.fb.group(newForm);

    if (this.data.rowData) {
      this.formGroup.setValue(this.data.rowData);
    }
  }

  openSnackBar(message: string) {
    this._snackBar.open(message, 'Закрыть', {
      horizontalPosition: 'end',
      verticalPosition: 'top',
      duration: 10000,
    });
  }

  ngOnInit(): void {
    forkJoin([
      this.dataService.getMotors(),
      this.dataService.getMaterials(),
    ]).subscribe({
      next: ([motors, materials]) => {
        this.motors = motors;
        this.materials = materials;
      },
      error: () => {
        this.openSnackBar('Ошибка получения данных');
      },
    });
  }

  onCancelClick(): void {
    this.dialogRef.close();
  }

  onSaveClick(): void {
    if (typeof this.data.onSaveClick == 'function') {
      this.data.onSaveClick(this.formGroup.value);
    }
    this.dialogRef.close();
  }

  checkIfFieldFilled(fieldCode: string): boolean {
    return (
      this.formGroup.controls[fieldCode].value &&
      this.formGroup.controls[fieldCode].valid &&
      this.formGroup.controls[fieldCode]
    );
  }
}
