import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DialogData } from '../types/dialog-data';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss'],
})
export class DialogComponent {
  formGroup: FormGroup;

  constructor(
    public dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private fb: FormBuilder
  ) {
    if (!data) {
      this.data = {} as DialogData;
    }

    let newForm = {};
    this.data.rows?.forEach((row) => {
      newForm = { ...newForm, ...{ [row.code]: ['', Validators.required] } };
    });
    this.formGroup = this.fb.group(newForm);

    if (this.data.rowData) {
      this.formGroup.setValue(this.data.rowData);
    }
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
