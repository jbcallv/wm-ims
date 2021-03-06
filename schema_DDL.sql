/* tag relation */
DROP TABLE IF EXISTS tag;
CREATE TABLE tag (
    tag_id varchar(8),
    vendor varchar(20),
    purchase_price int,
    purchase_date DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY(tag_id)
);

/* manufacturer table */
DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer (
    id SERIAL,
    manufacturer_name varchar(20),
    PRIMARY KEY(id)
);

/* located_at table */
DROP TABLE IF EXISTS located_at;
CREATE TABLE located_at (
    id SERIAL,
    building varchar(25),
    room_number INT,
    PRIMARY KEY(id)
);

/* machine table */
DROP TABLE IF EXISTS machine;
CREATE TABLE machine (
    id SERIAL,
    located_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id)
); 

/* relationship between machine and tag tables */
DROP TABLE IF EXISTS m_tagged;
CREATE TABLE m_tagged (
    machine_id INT,
    tag_id varchar(8),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id) 
);

/* relationship between manufacturer and machine tables */
DROP TABLE IF EXISTS m_made;
CREATE TABLE m_made (
    machine_id INT,
    manufacturer_id INT,
    FOREIGN KEY(machine_id)
        REFERENCES machine(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

/* gpu_model table */
DROP TABLE IF EXISTS gpu_model;
CREATE TABLE gpu_model (
    model_name varchar(20),
    vram INT,
    PRIMARY KEY(model_name)
);

/* gpu table */
DROP TABLE IF EXISTS gpu;
CREATE TABLE gpu (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES gpu_model (model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at (id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer (id)
);

DROP TABLE IF EXISTS gpu_in_machine;
CREATE TABLE gpu_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES gpu(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);


/* relationship between gpu and component tables */
DROP TABLE IF EXISTS gpu_tagged;
CREATE TABLE gpu_tagged (
    gpu_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(gpu_id)
        REFERENCES gpu(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* memory_model table */
DROP TABLE IF EXISTS memory_model;
CREATE TABLE memory_model (
    model_name varchar(20),
    size INT,
    type_generation varchar(6),
    type_speed INT,
    type_form_factor varchar(6),
    PRIMARY KEY(model_name)
);

/* memory table */
DROP TABLE IF EXISTS memory;
CREATE TABLE memory (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES memory_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS memory_in_machine;
CREATE TABLE memory_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES memory(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between memory and component tables */
DROP TABLE IF EXISTS memory_tagged;
CREATE TABLE memory_tagged (
    memory_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(memory_id)
        REFERENCES memory(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* cpu_model table */
DROP TABLE IF EXISTS cpu_model;
CREATE TABLE cpu_model (
    model_name varchar(20),
    threads INT, 
    cores INT,
    PRIMARY KEY(model_name)
);

/* cpu table */
DROP TABLE IF EXISTS cpu;
CREATE TABLE cpu (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES cpu_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS cpu_in_machine;
CREATE TABLE cpu_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES cpu(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between cpu and component tables */
DROP TABLE IF EXISTS cpu_tagged;
CREATE TABLE cpu_tagged (
    cpu_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(cpu_id)
        REFERENCES cpu(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* motherboard_model table */
DROP TABLE IF EXISTS motherboard_model;
CREATE TABLE motherboard_model (
    model_name varchar(20),
    motherboard_type varchar(15),
    PRIMARY KEY(model_name)
);

/* motherboard table */
DROP TABLE IF EXISTS motherboard;
CREATE TABLE motherboard (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES motherboard_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS motherboard_in_machine;
CREATE TABLE motherboard_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES motherboard(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between motherboard and component tables */
DROP TABLE IF EXISTS motherboard_tagged;
CREATE TABLE motherboard_tagged (
    motherboard_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(motherboard_id)
        REFERENCES motherboard(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* nc_model table */
DROP TABLE IF EXISTS nc_model;
CREATE TABLE nc_model (
    model_name varchar(20),
    nc_type varchar(15),
    PRIMARY KEY(model_name)
);

/* nc table */
DROP TABLE IF EXISTS nc;
CREATE TABLE nc (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES nc_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS nc_in_machine;
CREATE TABLE nc_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES nc(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between nc and component tables */
DROP TABLE IF EXISTS nc_tagged;
CREATE TABLE nc_tagged (
    nc_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(nc_id)
        REFERENCES nc(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* psu_model table */
DROP TABLE IF EXISTS psu_model;
CREATE TABLE psu_model (
    model_name varchar(20),
    wattage INT,
    PRIMARY KEY(model_name)
);

/* psu table */
DROP TABLE IF EXISTS psu;
CREATE TABLE psu (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES psu_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS psu_in_machine;
CREATE TABLE psu_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES psu(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between psu and component tables */
DROP TABLE IF EXISTS psu_tagged;
CREATE TABLE psu_tagged (
    psu_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(psu_id)
        REFERENCES psu(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* drives_model table */
DROP TABLE IF EXISTS drives_model;
CREATE TABLE drives_model (
    model_name varchar(20),
    size INT, 
    drive_type varchar(15),
    interface varchar(4),
    PRIMARY KEY(model_name)
);

/* drives table */
DROP TABLE IF EXISTS drives;
CREATE TABLE drives (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES drives_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS drives_in_machine;
CREATE TABLE drives_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES drives(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between drives and component tables */
DROP TABLE IF EXISTS drives_tagged;
CREATE TABLE drives_tagged (
    drives_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(drives_id)
        REFERENCES drives(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);

/* display_model table */
DROP TABLE IF EXISTS display_model;
CREATE TABLE display_model (
    model_name varchar(20),
    display_size INT, 
    resolution varchar(10),
    PRIMARY KEY(model_name)
);

/* display table */
DROP TABLE IF EXISTS display;
CREATE TABLE display (
    id SERIAL,
    model_name varchar(20),
    located_id INT,
    manufacturer_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(model_name)
        REFERENCES display_model(model_name),
    FOREIGN KEY(located_id)
        REFERENCES located_at(id),
    FOREIGN KEY(manufacturer_id)
        REFERENCES manufacturer(id)
);

DROP TABLE IF EXISTS display_in_machine;
CREATE TABLE display_in_machine (
    component_id INT,
    machine_id INT,
    FOREIGN KEY(component_id)
        REFERENCES display(id),
    FOREIGN KEY(machine_id)
        REFERENCES machine(id)
);

/* relationship between display and component tables */
DROP TABLE IF EXISTS display_tagged;
CREATE TABLE display_tagged (
    display_id INT NOT NULL,
    tag_id varchar(8),
    FOREIGN KEY(display_id)
        REFERENCES display(id),
    FOREIGN KEY(tag_id)
        REFERENCES tag(tag_id)
);