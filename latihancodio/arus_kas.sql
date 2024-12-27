-- Active: 1729959967185@@127.0.0.1@3306@olyzanokas
CREATE DATABASE olyzanokas;
use olyzanokas;

CREATE TABLE MsAnggota (
  id_anggota VARCHAR(6) PRIMARY KEY NOT NULL UNIQUE,
  nama_anggota VARCHAR(50) NOT NULL,
  email_anggota VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(16) NOT NULL,
  id_data_anggota VARCHAR(6),
  create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT MSAnggota1 CHECK (CHAR_LENGTH(id_anggota) = 5),
  CONSTRAINT MSAnggota2 CHECK (id_anggota REGEXP '^AG[0-9][0-9][0-9]$'),
  CONSTRAINT FK_DataAnggota FOREIGN KEY (id_data_anggota) REFERENCES MsDataAnggota(id_data_anggota) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE MsDataAnggota;

CREATE TABLE MsDataAnggota (
  id_data_anggota VARCHAR(6) PRIMARY KEY NOT NULL UNIQUE,
  no_hp VARCHAR(12) UNIQUE,
  tanggal_lahir DATE,
  id_kelas VARCHAR(6),
  id_detail_anggota VARCHAR(6),
  CONSTRAINT RecheckDataAnggota1 CHECK (CHAR_LENGTH(id_data_anggota) = 5),
  CONSTRAINT RecheckDataAnggota2 CHECK (id_data_anggota REGEXP '^DA[0-9][0-9][0-9]$'),
  CONSTRAINT FK_Kelas FOREIGN KEY (id_kelas) REFERENCES KategoriKelas(id_kelas) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_DetailAnggota FOREIGN KEY (id_detail_anggota) REFERENCES DetailDataAnggota(id_detail_anggota) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DetailDataAnggota (
  id_detail_anggota VARCHAR(6) UNIQUE PRIMARY KEY NOT NULL,
  jenis_kelamin CHAR(1),
  status VARCHAR(15),
  id_agama VARCHAR(6),
  id_alamat VARCHAR(6),
  id_pekerjaan VARCHAR(6),
  CONSTRAINT RecheckDetailDataAnggota1 CHECK (CHAR_LENGTH(id_detail_anggota) = 5),
  CONSTRAINT RecheckDetailDataAnggota2 CHECK (id_detail_anggota REGEXP '^DT[0-9][0-9][0-9]$'),
  CONSTRAINT RecheckDetailDataAnggota3 CHECK (jenis_kelamin IN ('L', 'P')),
  CONSTRAINT RecheckDetailDataAnggota4 CHECK (status IN ('Menikah', 'Belum Menikah')),
  CONSTRAINT FK_kategori_agama FOREIGN KEY (id_agama) REFERENCES KategoriAgama(id_agama) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_alamat FOREIGN KEY (id_alamat) REFERENCES AlamatAnggota(id_alamat) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_pekerjaan FOREIGN KEY (id_pekerjaan) REFERENCES KategoriPekerjaan(id_pekerjaan) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE MsDataAnggota, DetailDataAnggota, MsAnggota;
DROP TABLE DetailDataAnggota;

CREATE TABLE KategoriAgama (
  id_agama VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  nama_agama VARCHAR(30),
  CONSTRAINT RecheckKategoriAgama1 CHECK (CHAR_LENGTH(id_agama) = 5),
  CONSTRAINT RecheckKategoriAgama2 CHECK (id_agama REGEXP '^KA[0-9][0-9][0-9]$'),
  CONSTRAINT RecheckKategoriAgama3 CHECK (nama_agama IN ('Islam', 'Kristen', 'Katolik', 'Hindu', 'Budha', 'Konghucu'))
)

CREATE TABLE AlamatAnggota (
  id_alamat VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  nama_jalan VARCHAR(50),
  rt_rw VARCHAR(5),
  kecamatan VARCHAR(20),
  kota VARCHAR(20),
  provinsi VARCHAR(20),
  CONSTRAINT CheckAlamat1 CHECK (CHAR_LENGTH(id_alamat) = 5),
  CONSTRAINT CheckAlamat2 CHECK (id_alamat REGEXP '^AL[0-9][0-9][0-9]$')
)

CREATE TABLE KategoriPekerjaan (
  id_pekerjaan VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  nama_pekerjaan VARCHAR(50),
  CONSTRAINT CheckJenisPekerjaan1 CHECK (CHAR_LENGTH(id_pekerjaan) = 5),
  CONSTRAINT CheckJenisPekerjaan2 CHECK (id_pekerjaan REGEXP '^KP[0-9][0-9][0-9]$')
)

CREATE TABLE KategoriKelas (
  id_kelas VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  kelas VARCHAR(10),
  CONSTRAINT CHeckKategoriKelas1 CHECK (CHAR_LENGTH(id_kelas) = 5),
  CONSTRAINT CHeckKategoriKelas2 CHECK (id_kelas REGEXP '^KK[0-9][0-9][0-9]$')
)

CREATE TABLE MsKategoriKas (
  id_categori_kas VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  kategori_kas VARCHAR(50),
  CONSTRAINT CHeckKategoriKas1 CHECK (CHAR_LENGTH(id_categori_kas) = 5),
  CONSTRAINT CHeckKategoriKas2 CHECK (id_categori_kas REGEXP '^KK[0-9][0-9][0-9]$')
)

DROP TABLE MsKas

CREATE TABLE MsKas (
  id_kas VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
  nama_kas VARCHAR(50),
  total_kas DECIMAL(10,2),
  id_categori_kas VARCHAR(6),
  CONSTRAINT CHeckKas1 CHECK (CHAR_LENGTH(id_kas) = 5),
  CONSTRAINT CHeckKas2 CHECK (id_kas REGEXP '^KK[0-9][0-9][0-9]$'),
  CONSTRAINT FK_KategoriKas FOREIGN KEY(id_categori_kas) REFERENCES MsKategoriKas(id_categori_kas) ON UPDATE CASCADE ON DELETE CASCADE
)