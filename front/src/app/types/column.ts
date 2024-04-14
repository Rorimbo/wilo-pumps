export type Column = {
  code: string;
  name: string;
  hide?: boolean;
  type: Types;
};

export enum Types {
  Number,
  String,
  Select,
}
