  --membuat DataBase baru--

  CREATE DATABASE TokoRetailDB;
  GO
  
  --Gunakan DB tokoretail--
  USE TokoRetailDB;
  GO

  --1.membuat tabel kategori--
  CREATE TABLE KategoriProduk(
  kategoriID INT IDENTITY(1,1) PRIMARY KEY,
  NamaKategori VARCHAR(100) NOT NULL UNIQUE
  );
  GO

  DROP TABLE Produk;
  --2.MEMBUAT TABEL PRODUK--
  CREATE TABLE Produk(
  ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
  SKU VARCHAR(20) NOT NULL UNIQUE,
  NamaProduk VARCHAR(150) NOT NULL,
  Harga DECIMAL(10,2) NOT NULL,
  Stok INT NOT NULL,
  KategoriID INT NOT NULL,

  --Cara Menulis Constraint
  --Constraint nama_constraint jenis_constraint (nama kolom yang akan ditambahkan contraint)
  CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
  CONSTRAINT CHK_StokPositif CHECK (Stok >= 0),
  CONSTRAINT FK_Produk_Kategori
  FOREIGN KEY (KategoriID)
  REFERENCES KategoriProduk (KategoriID)
  );
  GO

  --3. membuat table pelanggan--
  CREATE TABLE Pelanggan (
  PelangganID INT IDENTITY(1,1) PRIMARY KEY,
  NamaDepan VARCHAR (50) NOT NULL,
  NamaBelakang VARCHAR (50) NULL,
  Email VARCHAR (100) NOT NULL UNIQUE,
  NoTelepon VARCHAR (20) NULL,
  TanggalDaftar DATE DEFAULT GETDATE()
  );
  GO

  --MEMBUAT PESANAN HEADER--
  CREATE TABLE PesananHeader (
  PesananID INT IDENTITY(5000, 1) PRIMARY KEY,
  PelangganID INT NOT NULL,
  TanggalPesanan DATETIME2 DEFAULT GETDATE(),
  StatusPesanan VARCHAR(20) NOT NULL, 

  CONSTRAINT CHK_StatusPesanan CHECK (StatusPesanan IN ('Baru', 'Proses', 'Selesai', 'Batal')),
  CONSTRAINT FK_Pesanan_Pelanggan 
  FOREIGN KEY (PelangganID)
  REFERENCES Pelanggan(PelangganID)
  -- ON DELETE NO ACTION (DEFAULT)
  );
  GO

   --5. Buat tabel Pesanan Detail--
CREATE TABLE PesananDetail (
PesananDetailID INT IDENTITY(1,1) PRIMARY KEY,
PesananID INT NOT NULL,
ProdukID INT NOT NULL,
Jumlah INT NOT NULL,
HargaSatuan DECIMAL(10, 2) NOT NULL,

CONSTRAINT CHK_JumlahPositif CHECK (Jumlah > 0),
--FK PesananDetail & PesananHeader
CONSTRAINT FK_Detail_Header
FOREIGN KEY (PesananID)
REFERENCES PesananHeader(PesananID)
ON DELETE CASCADE,

-- Jika Header dihapus, detail ikut terhapus
CONSTRAINT FK_Detail_Produk
FOREIGN KEY (ProdukID)
REFERENCES Produk(ProdukID)
);
GO

--MENAMBAH DATA KE TABLE PELANGGAN--
INSERT INTO Pelanggan (NamaDepan, NamaBelakang, Email, NoTelepon)
VALUES
('Budi', 'Santoso', 'budi.santoso@email.com', '081234567890'),
('Citra', 'Lestari', 'citra.lestari@email.com', NULL);

--Verifikasi Data
PRINT 'Data Pelanggan:';
SELECT * 
FROM Pelanggan;

INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('Elektronik'),
('Pakaian')
('Buku')

PRINT 'Data Pelanggan:';
SELECT *
FROM KategoriProduk;

--menambahkan data ke table produk--
INSERT Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES 
('ELEC-001', 'Laptop Pro 14 inch', 15000000.00, 50, 1),
('PAK-001', 'Kaos Polos Putih', 75000.00, 200, 2);

PRINT 'Data Produk:';
SELECT * 
FROM Produk ;

INSERT INTO Pelanggan (NamaDepan,Email)
VALUES ('Budi', 'budi.santoso@email.com');