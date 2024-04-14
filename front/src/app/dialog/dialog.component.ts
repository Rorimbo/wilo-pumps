import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DialogData } from '../types/dialog-data';
import { SelectData } from '../types/select-data';
import { forkJoin } from 'rxjs';
import { DataService } from '../services/data.service';
import { Types } from '../types/column';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss'],
})
export class DialogComponent implements OnInit {
  formGroup: FormGroup;
  motors: SelectData[];
  materials: SelectData[];

  types = Types;

  constructor(
    public dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private fb: FormBuilder,
    public dataService: DataService
  ) {
    if (!data) {
      this.data = {} as DialogData;
    }

    let newForm = {};
    this.data.rows?.forEach((row) => {
      newForm = {
        ...newForm,
        ...{
          [row.code]: ['', row.hide ? null : Validators.required],
        },
      };
    });
    this.formGroup = this.fb.group(newForm);

    if (this.data.rowData) {
      this.formGroup.setValue(this.data.rowData);
    }
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
