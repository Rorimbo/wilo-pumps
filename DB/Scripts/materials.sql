-- public.materials определение

-- Drop table

-- DROP TABLE public.materials;

CREATE TABLE public.materials (
	id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NOT NULL, -- Наименование
	description varchar NULL, -- Описание материала
	CONSTRAINT materials_pk PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN public.materials."name" IS 'Наименование';
COMMENT ON COLUMN public.materials.description IS 'Описание материала';