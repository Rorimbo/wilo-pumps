import { Column } from './column';
import { Data } from './data';

export interface DialogData {
  title: string;
  rowData?: Data;
  rows?: Column[];
  onSaveClick: any;
}
