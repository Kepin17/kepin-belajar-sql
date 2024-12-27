SELECT * FROM category;
SELECT * FROM pembeli;
SELECT * FROM transaksi_detail;
SELECT * FROM transaksi_header;
SELECT * FROM barang;


INSERT INTO category VALUES (
  "CA001",
  "Kamera"
);

INSERT INTO category VALUES (
  "CA002",
  "ponsel & tablet"
);

INSERT INTO category VALUES (
  "CA003",
  "Laptop"
);

INSERT INTO barang VALUES (
  "BR001",
  "Laptop Asus FX504GD",
  5,
  5000000,
  "CA003"
);

INSERT INTO barang VALUES (
  "BR002",
  "Laptop ASUS F14 TUF Gaming",
  10,
  200000,
  "CA003"
);

INSERT INTO pembeli VALUES (
  "PE001",
  "Budi",
  "Jl. Raya Semarang",
  "08123456789",
  "o2Y2Y@example.com",
  "Secure@123",
  FALSE
) 

INSERT INTO pembeli VALUES (
  "PE002",
  "Andi",
  "Jl. Raya Semarang",
  "08123456789",
  "o2Y2Y@example.com",
  "Secure@123",
  FALSE
)

INSERT INTO transaksi_header VALUES (
  "TR001",
  "PE001",
  "2022-01-01 00:00:00"
)

INSERT INTO transaksi_detail VALUES (
  "BR001",
  "TR001",
  1,
  5000000
)


INSERT INTO transaksi_detail VALUES (  
  "BR002",
  "TR001",
  3,
  2000000
)

