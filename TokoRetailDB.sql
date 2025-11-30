IF DB_ID('TokoRetailDB') IS NOT NULL
BEGIN
	USE master;
	DROP DATABASE TokoRetailDB;
	END
	GO

	CREATE DATABASE TokoRetailDB
	GO

USE TokoRetailDB;
GO

CREATE TABLE KategoriProduk(
KategoriID INT IDENTITY(1, 1) PRIMARY KEY,
NamaKategori VARCHAR(100) NOT NULL UNIQUE
 );
 GO

 CREATE TABLE Produk (
 ProdukID INT IDENTITY(1001, 1) PRIMARY KEY,
 SKU VARCHAR(20) NOT NULL UNIQUE,
 NamaProduk VARCHAR(150) NOT NULL,
 Harga DECIMAL(10,2) NOT NULL,
 Stok INT NOT NULL,
 KategoriID INT NULL,

 CONSTRAINT CHK_HargaPositif CHECK (Harga >=0),
 CONSTRAINT CHK_StokPositif CHECK (Stok >=0),
 CONSTRAINT FK_Produk_Kategori 
 FOREIGN KEY (KategoriID)
 REFERENCES KategoriProduk (KategoriID)
  );
 GO


 CREATE TABLE Pelanggan (
 PelangganID INT IDENTITY (1, 1)PRIMARY KEY,
 NamaDepan VARCHAR (50) NOT NULL,
 NamaBelakang VARCHAR(50) NOT NULL,
 Email VARCHAR (50) NOT NULL UNIQUE,
 NoTelepon VARCHAR (20)  NULL,
 TanggalDaftar DATE DEFAULT GETDATE()
 );
 GO


 CREATE TABLE PesananHeader (
 PesananID INT IDENTITY (1001, 1) PRIMARY KEY,
 PelangganID INT NOT NULL,
 TanggalPesanan DATETIME2 DEFAULT GETDATE(),
 StatusPesanan VARCHAR (20) NOT NULL,
 CONSTRAINT CHK_StatusPesanan CHECK (StatusPesanan IN ('Baru','Proses','Selesai','Batal')),
 CONSTRAINT FK_PesananPelanggan
 FOREIGN KEY (PelangganID)
 REFERENCES Pelanggan (PelangganID)
 );
 GO


 CREATE TABLE PesananDetail(
 PesananDetailID INT IDENTITY (1, 1) PRIMARY KEY,
 PesananID INT NOT NULL,
 ProdukID INT NOT NULL,
 Jumlah INT NOT NULL,
 HargaSatuan DECIMAL (10,2)NOT NULL,
 CONSTRAINT FK_Detail_Header
 FOREIGN KEY (PesananID)
 REFERENCES PesananHeader(PesananID)
 ON DELETE CASCADE, --JIKA HEADER DI HAPUS DETAIL JUGA IKUT KE HAPUS

 CONSTRAINT FK_Detail_Produk
 FOREIGN KEY (ProdukID)
 REFERENCES Produk(ProdukID)

 );
 GO


 INSERT INTO Pelanggan(NamaDepan,NamaBelakang,Email,NoTelepon)
 VALUES
 ('BUDI','SANTOSA','Budi@gmail.com','085624666520'),
 ('ALI','FAUZI','aliganx@gmail.com','NULL');

 PRINT 'Data Pelanggan:';
 SELECT*
 FROM Pelanggan

 INSERT INTO KategoriProduk(NamaKategori)
 VALUES 
 ('Elektronik'), 
 ('Buku'), 
 ('Pakaian');

  PRINT 'Data Kategori:';
 SELECT*
 FROM KategoriProduk

 INSERT INTO Produk(SKU,NamaProduk,Harga,Stok,KategoriID)
 VALUES 
 ('ELEC-001','Laptop Geming',150000000.00,50,10),
('PAK-001','Kaos Giordano',150000000.00 ,200,5);