-- public.motors определение

-- Drop table

-- DROP TABLE public.motors;

CREATE TABLE public.motors (
	"name" varchar NOT NULL, -- Наименование
	id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	power int4 NULL, -- Мощность
	amperage int4 NULL, -- Ток
	ratedspeed int4 NULL, -- Номинальная скорость
	motor varchar NULL, -- Мотор
	description varchar NULL, -- Описание мотора
	price int4 NULL, -- Цена
	CONSTRAINT motors_pk PRIMARY KEY (id),
	CONSTRAINT motors_unique UNIQUE (id)
);

-- Column comments

COMMENT ON COLUMN public.motors."name" IS 'Наименование';
COMMENT ON COLUMN public.motors.power IS 'Мощность';
COMMENT ON COLUMN public.motors.amperage IS 'Ток';
COMMENT ON COLUMN public.motors.ratedspeed IS 'Номинальная скорость';
COMMENT ON COLUMN public.motors.motor IS 'Мотор';
COMMENT ON COLUMN public.motors.description IS 'Описание мотора';
COMMENT ON COLUMN public.motors.price IS 'Цена';