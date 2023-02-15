CREATE TABLE `nguoi_dung` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ten_nguoi_dung` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mat_khau` VARCHAR(255) NOT NULL,
  `ngay_sinh` DATE NOT NULL,
  `gioi_tinh` INT(2),
  `hinh_anh` VARCHAR(255),
  `anh_bia` VARCHAR(255),
  `trang_thai` INT(2),
  `ngay_tao` DATETIME NOT NULL,
  `ngay_cap_nhat` DATETIME,
  `token` VARCHAR(255),
  `token_iat` TIMESTAMP
);

CREATE TABLE `bai_dang` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` INT(11) NOT NULL,
  `noi_dung` TEXT NOT NULL,
  `ngay_dang` DATETIME NOT NULL
);

CREATE TABLE `binh_luan` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` INT(11) NOT NULL,
  `id_bai_dang` INT(11) NOT NULL,
  `noi_dung` TEXT NOT NULL,
  `ngay_binh_luan` DATETIME NOT NULL
);

CREATE TABLE `ket_ban` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung_1` INT(11) NOT NULL,
  `id_nguoi_dung_2` INT(11) NOT NULL,
  `trang_thai` TINYINT(1) NOT NULL,
  `ngay_tao` DATETIME NOT NULL
);

CREATE TABLE `tin_nhan` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_nguoi_gui` INT(11) NOT NULL,
  `id_nguoi_nhan` INT(11) NOT NULL,
  `noi_dung` TEXT NOT NULL,
  `ngay_gui` DATETIME NOT NULL
);

CREATE TABLE `thich` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_nguoi_dung` INT(11) NOT NULL,
  `id_bai_dang` INT(11) NOT NULL,
  `ngay_thich` DATETIME NOT NULL
);

CREATE TABLE `hinh_anh` (
  `id` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_bai_dang` INT(11) NOT NULL,
  `duong_dan` VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX `nguoi_dung_index_0` ON `nguoi_dung` (`email`);

CREATE UNIQUE INDEX `ket_ban_index_1` ON `ket_ban` (`id_nguoi_dung_1`, `id_nguoi_dung_2`);

ALTER TABLE `bai_dang` ADD FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `binh_luan` ADD FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `binh_luan` ADD FOREIGN KEY (`id_bai_dang`) REFERENCES `bai_dang` (`id`);

ALTER TABLE `ket_ban` ADD FOREIGN KEY (`id_nguoi_dung_1`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `ket_ban` ADD FOREIGN KEY (`id_nguoi_dung_2`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `tin_nhan` ADD FOREIGN KEY (`id_nguoi_gui`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `tin_nhan` ADD FOREIGN KEY (`id_nguoi_nhan`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `thich` ADD FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

ALTER TABLE `thich` ADD FOREIGN KEY (`id_bai_dang`) REFERENCES `bai_dang` (`id`);

ALTER TABLE `hinh_anh` ADD FOREIGN KEY (`id_bai_dang`) REFERENCES `bai_dang` (`id`);
