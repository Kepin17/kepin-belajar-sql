CREATE DATABASE toko_kepin;
use toko_kepin;

CREATE TABLE barang (
  id_barang VARCHAR(6) PRIMARY KEY UNIQUE,
  nama_barang VARCHAR(50) NOT NULL,
  qty INTEGER NOT NULL,
  harga DECIMAL(10,2) NOT NULL,
  id_category VARCHAR(6),
  CONSTRAINT Checkbarang1 Check (CHAR_LENGTH(id_barang) = 5),
  CONSTRAINT Checkbarang2 Check (id_barang REGEXP '^BR[0-9][0-9][0-9]$'),
  CONSTRAINT Checkbarang3 Check (qty > 0),
  CONSTRAINT Checkbarang4 Check (harga > 0),
  CONSTRAINT FK_category_barang FOREIGN KEY (id_category) REFERENCES category(id_category) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE category (
  id_category VARCHAR(6) PRIMARY KEY UNIQUE,
  nama_category VARCHAR(50) NOT NULL,
  CONSTRAINT Checkcategory1 Check (CHAR_LENGTH(id_category) = 5),
  CONSTRAINT Checkcategory2 Check (id_category REGEXP '^CA[0-9][0-9][0-9]$')
);


CREATE TABLE pembeli (
  id_pembeli VARCHAR(6) PRIMARY KEY UNIQUE,
  nama_pembeli VARCHAR(50) NOT NULL,
  alamat_pembeli VARCHAR(100) NOT NULL,
  no_hp VARCHAR(12) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(16) UNIQUE NOT NULL,
  ismember BOOLEAN DEFAULT FALSE,
  CONSTRAINT Checkpembeli1 Check (CHAR_LENGTH(id_pembeli) = 5),
  CONSTRAINT Checkpembeli2 Check (id_pembeli REGEXP '^PE[0-9][0-9][0-9]$')
);



CREATE TABLE admin (
  id_admin VARCHAR(6) PRIMARY KEY UNIQUE,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(16) NOT NULL UNIQUE,
  CONSTRAINT Checkadmin1 Check (CHAR_LENGTH(id_admin) = 5),
  CONSTRAINT Checkadmin2 Check (id_admin REGEXP '^AD[0-9][0-9][0-9]$')
)


CREATE TABLE superadmin (
  id_superadmin VARCHAR(6) PRIMARY KEY UNIQUE,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(16) NOT NULL UNIQUE,
  CONSTRAINT Checksuperadmin1 Check (CHAR_LENGTH(id_superadmin) = 5),
  CONSTRAINT Checksuperadmin2 Check (id_superadmin REGEXP '^SA[0-9][0-9][0-9]$')
)



CREATE TABLE akses_pengguna (
  id_admin VARCHAR(6),
  id_pembeli VARCHAR(6),
  id_superadmin VARCHAR(6),
  akses_role VARCHAR(15) DEFAULT 'pembeli',
  CONSTRAINT Checkakses1 Check (akses_role IN ('pembeli', 'admin', 'superadmin')),
  CONSTRAINT FK_admin FOREIGN KEY (id_admin) REFERENCES admin(id_admin) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_pembeli FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_superadmin FOREIGN KEY (id_superadmin) REFERENCES superadmin(id_superadmin) ON UPDATE CASCADE ON DELETE CASCADE
)


CREATE TABLE transaksi_header (
  id_transaksi VARCHAR(6) PRIMARY KEY UNIQUE,
  id_pembeli VARCHAR(6),
  tanggal_transaksi DATETIME NOT NULL,
  CONSTRAINT FK_akses_pengguna FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Checktransaksi1 Check (CHAR_LENGTH(id_transaksi) = 5),
  CONSTRAINT Checktransaksi2 Check (id_transaksi REGEXP '^TR[0-9][0-9][0-9]$')
);


CREATE TABLE transaksi_detail (
  id_barang VARCHAR(6),
  id_transaksi VARCHAR(6),
  qty INTEGER NOT NULL,
  total_harga DECIMAL(10,2) NOT NULL,
  CONSTRAINT Checktransaksi3 Check (total_harga > 0),
  CONSTRAINT Checktransaksi4 Check (qty > 0),
  CONSTRAINT FK_transaksi FOREIGN KEY (id_transaksi) REFERENCES transaksi_header(id_transaksi) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FK_barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang) ON UPDATE CASCADE ON DELETE CASCADE
)