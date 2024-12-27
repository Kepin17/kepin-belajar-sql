CREATE DATABASE perusahaan_kepin;
USE perusahaan_kepin;

CREATE TABLE karyawan (
  id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
  nama_karyawan VARCHAR(100) NOT NULL,
  tanggal_lahir DATE
)

ALTER TABLE karyawan 
ADD id_divisi INT;

ALTER TABLE karyawan
ADD CONSTRAINT FK_divisi 
FOREIGN KEY(id_divisi) 
REFERENCES divisi(id_divisi) 

CREATE TABLE divisi (
  id_divisi INT PRIMARY KEY AUTO_INCREMENT
  nama_divisi VARCHAR(100) NOT NULL
)

CREATE TABLE proyek (
  id_proyek INT PRIMARY KEY AUTO_INCREMENT,
  nama_proyek VARCHAR(100) NOT NULL,
  tanggal_mulai DATE,
  tanggal_selesai DATE
)

CREATE TABLE karyawan_proyek (
  id_karyawan_proyek INT PRIMARY KEY AUTO_INCREMENT,
  role VARCHAR(100) NOT NULL
)


ALTER TABLE karyawan_proyek
ADD id_karyawan INT;

ALTER TABLE karyawan_proyek
ADD CONSTRAINT FK_karyawan
FOREIGN KEY (id_karyawan)
REFERENCES karyawan (id_karyawan)

ALTER TABLE karyawan_proyek
ADD id_proyek INT;

ALTER TABLE karyawan_proyek
ADD CONSTRAINT FK_proyek
FOREIGN KEY (id_proyek)
REFERENCES proyek (id_proyek)

DROP TABLE karyawan_proyek


SELECT * FROM karyawan;
SELECT * FROM divisi;
SELECT * FROM proyek;
SELECT * FROM karyawan_proyek;


INSERT INTO divisi VALUES (
  1,
  "Frontend Dev"
);

INSERT INTO karyawan VALUES (
  1,
  "kepin",
  "2000-02-03",
  1
);

INSERT INTO proyek VALUES (
  1,
  "projek gabut",
  "2024-04-05",
  "2025-04-22"
);

INSERT INTO karyawan_proyek VALUES (
  1,
  "frontend",
  1,
  1
);
