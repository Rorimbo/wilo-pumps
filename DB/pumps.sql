-- public.pumps определение

-- Drop table

-- DROP TABLE public.pumps;

CREATE TABLE public.pumps (
	"name" varchar NULL, -- Название насоса
	id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	maxpressure int4 NULL, -- Максимальное давление
	liquidtemp int4 NULL, -- Температура жидкости
	motor int4 NULL, -- Мотор
	housingid int4 NULL, -- Материал корпуса
	impellerid int4 NULL, -- Материал рабочего колеса
	description varchar NULL, -- Описание
	picture varchar NULL, -- Фото
	price int4 NULL, -- Цена
	weight numeric NULL, -- Вес
	CONSTRAINT pumps_pk PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN public.pumps."name" IS 'Название насоса';
COMMENT ON COLUMN public.pumps.maxpressure IS 'Максимальное давление';
COMMENT ON COLUMN public.pumps.liquidtemp IS 'Температура жидкости';
COMMENT ON COLUMN public.pumps.motor IS 'Мотор';
COMMENT ON COLUMN public.pumps.housingid IS 'Материал корпуса';
COMMENT ON COLUMN public.pumps.impellerid IS 'Материал рабочего колеса';
COMMENT ON COLUMN public.pumps.description IS 'Описание';
COMMENT ON COLUMN public.pumps.picture IS 'Фото';
COMMENT ON COLUMN public.pumps.price IS 'Цена';
COMMENT ON COLUMN public.pumps.weight IS 'Вес';


-- public.pumps внешние включи

ALTER TABLE public.pumps ADD CONSTRAINT pumps_materials_fk FOREIGN KEY (housingid) REFERENCES public.materials(id);
ALTER TABLE public.pumps ADD CONSTRAINT pumps_materials_fk_1 FOREIGN KEY (impellerid) REFERENCES public.materials(id);
ALTER TABLE public.pumps ADD CONSTRAINT pumps_motors_fk FOREIGN KEY (motor) REFERENCES public.motors(id);