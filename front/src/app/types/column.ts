export type Column = {
  code: string;
  name: string;
  hide?: boolean;
  type: Types;
  nullable?: boolean;
};

export enum Types {
  Number,
  String,
  Select,
  Photo,
}
