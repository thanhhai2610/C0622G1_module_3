DROP DATABASE IF EXISTS quan_ly_ho_khau;
CREATE DATABASE quan_ly_ho_khau;
USE quan_ly_ho_khau;

  CREATE TABLE `quan_ly_ho_khau`.`ho_khau` (
  `ma_ho_khau` INT NOT NULL,
  `ten_chu_ho` VARCHAR(45) NULL,
  `ngay_lap_hk` DATE NULL,
  `dia_chi` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_ho_khau`));

CREATE TABLE `quan_ly_ho_khau`.`thanh_vien` (
  `cmnd` INT PRIMARY KEY AUTO_INCREMENT ,
  `ho_va_ten` VARCHAR(45) ,
  `ngay_sinh` DATE ,
  `ma_ho_khau` INT ,
  FOREIGN KEY  (ma_ho_khau) REFERENCES ho_khau(ma_ho_khau) 
  );
  


INSERT INTO `quan_ly_ho_khau`.`ho_khau` (`ma_ho_khau`, `ten_chu_ho`, `ngay_lap_hk`, `dia_chi`) VALUES ('123', 'thanh hai', '2000-12-12', 'quang nam');
INSERT INTO `quan_ly_ho_khau`.`ho_khau` (`ma_ho_khau`, `ten_chu_ho`, `ngay_lap_hk`, `dia_chi`) VALUES ('456', 'thanh hai 1', '2000-12-12', 'quang nam');
INSERT INTO `quan_ly_ho_khau`.`ho_khau` (`ma_ho_khau`, `ten_chu_ho`, `ngay_lap_hk`, `dia_chi`) VALUES ('789', 'thanh hai 2', '2000-12-12', 'quang nam');
INSERT INTO `quan_ly_ho_khau`.`ho_khau` (`ma_ho_khau`, `ten_chu_ho`, `ngay_lap_hk`, `dia_chi`) VALUES ('012', 'thanh hai 3', '2000-12-12', 'quang nam');

INSERT INTO `quan_ly_ho_khau`.`thanh_vien` (`cmnd`, `ho_va_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('111', 'hai', '2020-12-12', '123');
INSERT INTO `quan_ly_ho_khau`.`thanh_vien` (`cmnd`, `ho_va_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('222', 'hai', '2020-12-12', '456');
INSERT INTO `quan_ly_ho_khau`.`thanh_vien` (`cmnd`, `ho_va_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('333', 'hai', '2020-12-12', '123');
INSERT INTO `quan_ly_ho_khau`.`thanh_vien` (`cmnd`, `ho_va_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('444', 'hai', '2020-12-12', '456');


CREATE VIEW quan_ly_ho_khau as 
					SELECT hk.ma_ho_khau, hk.ten_chu_ho, count(tv.ma_ho_khau) as so_luong_thanh_vien,
					hk.ngay_lap_hk, hk.dia_chi 
					FROM thanh_vien tv
					RIGHT JOIN ho_khau hk on hk.ma_ho_khau = tv.ma_ho_khau
					GROUP BY hk.ma_ho_khau;
     

                    
                    
                    