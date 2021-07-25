ALTER TABLE dim_clients.t_dim_clients
       DROP CONSTRAINT fk_ref_dim_clients;

ALTER TABLE dim_drivers.t_dim_drivers
       DROP CONSTRAINT fk_ref_dim_drivers;

ALTER TABLE dim_vehicles.t_dim_vehicles
       DROP CONSTRAINT fk_ref_dim_vehicles;

ALTER TABLE dim_locations.t_dim_locations
       DROP CONSTRAINT fk_ref_dim_locations;

ALTER TABLE dim_time_dd.t_dim_time_dd
       DROP CONSTRAINT fk_ref_dim_time_dd;

ALTER TABLE dim_trips.t_dim_trips
       DROP CONSTRAINT fk_ref_dim_trips;

DROP TABLE dim_fct_orders.t_dim_fct_orders CASCADE CONSTRAINTS;

--==============================================================
-- Table: dim_fct_orders.t_dim_fct_orders                                        
--==============================================================
CREATE TABLE dim_fct_orders.t_dim_fct_orders
(
    event_id                    DATE          NOT NULL
   ,client_surr_id              NUMBER(22,0)
   ,driver_surr_id              NUMBER(22,0)
   ,vehicle_surr_id             NUMBER(22,0)
   ,trip_id                     NUMBER(22,0)
   ,location_id                 NUMBER(22,0)
   ,order_dt                    NUMBER(22,0)
   ,avg_trip_duration           NUMBER(22,0)
   ,avg_cost                    NUMBER(22,0)
   ,orders_count                NUMBER(22,0)
   ,CONSTRAINT "dim_fct_orders.t_dim_fct_orders" PRIMARY KEY (event_id)
)
PARTITION BY RANGE (event_id)
INTERVAL(numtoyminterval(1, 'MONTH'))
(
    PARTITION prt_orders_q2_2020 VALUES LESS THAN (TO_DATE('1-7-2020', 'DD-MM-YYYY')),
    PARTITION prt_orders_q1_2021 VALUES LESS THAN (TO_DATE('1-1-2021', 'DD-MM-YYYY')),
    PARTITION prt_orders_q2_2021 VALUES LESS THAN (TO_DATE('1-7-2021', 'DD-MM-YYYY')) );

--==============================================================
-- Table: dim_clients.t_dim_clients                                        
--==============================================================
CREATE TABLE dim_clients.t_dim_clients 
(
    client_surr_id              NUMBER(22,0)          NOT NULL
   ,client_id                   NUMBER(22,0)          NOT NULL
   ,client_desc                 VARCHAR(256)
   ,client_bitrhdate            NUMBER(22,0)
   ,client_gender               VARCHAR(8)
   ,insert_dt                   DATE
   ,update_dt                   DATE
   ,valid_from                  DATE
   ,valid_to                    DATE
   ,is_active                   VARCHAR(4)
   ,CONSTRAINT "fk_ref_dim_clients.t_dim_clients" PRIMARY KEY (client_surr_id)
);

--==============================================================
-- Table: dim_drivers.t_dim_drivers
--==============================================================
CREATE TABLE dim_drivers.t_dim_drivers
(
    driver_surr_id              NUMBER(22,0)          NOT NULL
   ,driver_id                   NUMBER(22,0)          NOT NULL
   ,driver_desc                 VARCHAR(256)
   ,driver_license_type         VARCHAR(8)
   ,insert_dt                   DATE
   ,update_dt                   DATE
   ,valid_from                  DATE
   ,valid_to                    DATE
   ,is_active                   VARCHAR(4)
   ,CONSTRAINT "fk_ref_dim_drivers.t_dim_drivers" PRIMARY KEY (driver_surr_id)
);

--==============================================================
-- Table: dim_vehicles.t_dim_vehicles
--==============================================================
CREATE TABLE dim_vehicles.t_dim_vehicles
(
    vehicle_surr_id              NUMBER(22,0)          NOT NULL
   ,vehicle_id                   NUMBER(22,0)          NOT NULL
   ,vehicle_code                 NUMBER(22,0)
   ,vehicle_desc                 VARCHAR(256)
   ,vehicle_numbers              VARCHAR(10)
   ,insert_dt                    DATE
   ,update_dt                    DATE
   ,valid_from                   DATE
   ,valid_to                     DATE
   ,is_active                    VARCHAR(4)
   ,CONSTRAINT "fk_ref_dim_vehicles.t_dim_vehicles" PRIMARY KEY (vehicle_surr_id)
);

--==============================================================
-- Table: dim_trips.t_dim_trips
--==============================================================
CREATE TABLE dim_trips.t_dim_trips
(
    trip_id                   NUMBER(22,0)          NOT NULL
   ,trip_desc                 VARCHAR(256)
   ,trip_duration             NUMBER(4,0)
   ,trip_cost                 NUMBER(4,0)
   ,trip_payment_type         VARCHAR(30)
   ,insert_dt                 DATE
   ,update_dt                 DATE
   ,CONSTRAINT "fk_ref_dim_trips.t_dim_trips" PRIMARY KEY (trip_id)
);

--==============================================================
-- Table: dim_locations.t_dim_locations
--==============================================================
CREATE TABLE dim_locations.t_dim_locations
(
    location_id                   NUMBER(22,0)          NOT NULL
   ,location_desc                 VARCHAR(256)
   ,country_id                    NUMBER(22,0)
   ,country_desc                  VARCHAR(256)
   ,country_code                  NUMBER(4,0)
   ,district_id                   NUMBER(22,0)
   ,district_desc                 VARCHAR(256)
   ,district_code                 NUMBER(4,0)
   ,part_id                       NUMBER(22,0)
   ,part_desc                     VARCHAR(256)
   ,part_code                     NUMBER(4,0)
   ,geo_systems_id                NUMBER(22,0)
   ,geo_systems_desc              VARCHAR(256)
   ,geo_systems_code              NUMBER(4,0)
   ,geo_id                        NUMBER(22,0)
   ,geo_desc                      VARCHAR(256)
   ,geo_code                      NUMBER(4,0)
   ,geo_type_id                   NUMBER(22,0)
   ,geo_type_desc                 VARCHAR(256)
   ,geo_type_code                 NUMBER(4,0)
   ,insert_dt                     DATE
   ,update_dt                     DATE
   ,CONSTRAINT "fk_ref_dim_locations.t_dim_locations" PRIMARY KEY (location_id)
);

--==============================================================
-- Table: dim_time_dd.t_dim_time_dd
--==============================================================
CREATE TABLE dim_time_dd.t_dim_time_dd
(
    order_dt                  NUMBER(22,0)          NOT NULL
   ,insert_dt                 DATE
   ,update_dt                 DATE
   ,date_id                   NUMBER(22,0)
   ,date_desc                 VARCHAR(256)
   ,date_full_string          VARCHAR(256)
   ,last_day_week             DATE
   ,last_day_month            DATE
   ,last_day_quarter          DATE
   ,last_day_year             DATE
   ,day_id                    NUMBER(22,0)
   ,day_desc                  VARCHAR(256)
   ,day_num_of_year           NUMBER(22,0)
   ,week_id                   NUMBER(22,0)
   ,week_desc                 VARCHAR(256)
   ,week_num_of_year          NUMBER(22,0)
   ,week_starts_dt            DATE
   ,week_ends_dt              DATE
   ,month_id                  NUMBER(22,0)
   ,month_desc                VARCHAR(256)
   ,month_name                VARCHAR(30)
   ,month_num_of_year         NUMBER(22,0)
   ,quarter_id                NUMBER(22,0)
   ,quarter_desc              VARCHAR(256)
   ,quarter_num_of_year       NUMBER(22,0)
   ,quarter_starts_dt         DATE
   ,quarter_ends_dt           DATE
   ,year_id                   NUMBER(22,0)
   ,year_desc                 VARCHAR(256)
   ,year_starts_dt            DATE
   ,year_ends_dt              DATE
   ,CONSTRAINT "fk_ref_dim_time_dd.t_dim_time_dd" PRIMARY KEY (order_dt)
);

ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_clients FOREIGN KEY (client_surr_id)
      REFERENCES dim_clients.t_dim_clients (client_surr_id);

ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_drivers FOREIGN KEY (driver_surr_id)
      REFERENCES dim_drivers.t_dim_drivers (driver_surr_id);

ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_vehicle FOREIGN KEY (vehicle_surr_id)
      REFERENCES dim_vehicles.t_dim_vehicles (vehicle_surr_id);

ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_trip FOREIGN KEY (trip_id)
      REFERENCES dim_trips.t_dim_trips (trip_id);      
      
ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_location FOREIGN KEY (location_id)
      REFERENCES dim_locations.t_dim_locations (location_id);  
      
ALTER TABLE dim_fct_orders.t_dim_fct_orders
   ADD CONSTRAINT fk_ref_dim_time_dd FOREIGN KEY (order_dt)
      REFERENCES dim_time_dd.t_dim_time_dd (order_dt);  