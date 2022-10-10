package repository;

import model.HoKhau;
import model.ThanhVien;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HoKhauRepo implements IHoKhau {


    private static final String SELECT_ALL = "SELECT * FROM quan_ly_ho_khau.quan_ly_ho_khau;";
    private static final String SELECT_ALL_THANH_VIEN = "SELECT * FROM quan_ly_ho_khau.thanh_vien;";
    private static final String UPDATE_HOKHAU_SQL1 = "UPDATE `quan_ly_ho_khau`.`ho_khau` SET `ten_chu_ho` = ?, `ngay_lap_hk` = ?, `dia_chi` = ? WHERE (`ma_ho_khau` = ?);\n";

    @Override
    public void insertHoKhau(model.HoKhau hoKhau) {

    }

    @Override
    public List<HoKhau> selectAllHoKhau() {     //hiển thị ds  quản lý trả về một list hộ khẩu
        List<HoKhau> hoKhauList = new ArrayList<>();
        try (Connection connection = BaseRepo.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int ma_ho_khau = rs.getInt("ma_ho_khau");
                String ho_ten = rs.getString("ten_chu_ho");
                int so_thannh_vien = Integer.parseInt(rs.getString("so_luong_thanh_vien"));
                String ngay_lap_ho_khau = rs.getString("ngay_lap_hk");
                String dia_chi = rs.getString("dia_chi");
                hoKhauList.add(new HoKhau(ma_ho_khau, ho_ten, so_thannh_vien, ngay_lap_ho_khau, dia_chi));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hoKhauList;
    }

    public List<ThanhVien> selectAllThanhVien() {     //hiển thị ds  quản lý trả về một list hộ khẩu
        List<ThanhVien> thanhVienList = new ArrayList<>();
        try (Connection connection = BaseRepo.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_THANH_VIEN)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int cmnd = rs.getInt("cmnd");
                String ho_va_ten = rs.getString("ho_va_ten");
                String ngay_sinh = (rs.getString("ngay_sinh"));
                int ma_ho_khau = Integer.parseInt(rs.getString("ma_ho_khau"));
                thanhVienList.add(new ThanhVien(cmnd, ho_va_ten, ngay_sinh, ma_ho_khau));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return thanhVienList;
    }


    public List<ThanhVien> selectThanhVienID(int id) {
        List<ThanhVien> hoKhauList = selectAllThanhVien();
        List<ThanhVien> thanhVienListId = new ArrayList<>();

        for (ThanhVien item : hoKhauList) {
            if (item.getMaHoKhau() == id) {
                thanhVienListId.add(item);
            }
        }
        return thanhVienListId;
    }


    @Override
    public List<HoKhau> selectHoKhauName(String name) {
        List<HoKhau> hoKhauList = selectAllHoKhau();
        List<HoKhau> hoKhauListNmae = new ArrayList<>();

        for (HoKhau item : hoKhauList) {
            if (item.getTenChuHo().equals(name)) {
                hoKhauListNmae.add(item);
            }
        }
        return hoKhauListNmae;
    }

    @Override
    public HoKhau selectHoKhauId(int id) {
        List<HoKhau> hoKhauList = selectAllHoKhau();
        for (HoKhau item : hoKhauList) {
            if (item.getMaHoKhau() == id) {
                return item;
            }
        }
        return null;
    }


    @Override
    public boolean deleteHoKhau(int id) {
        return false;
    }

    @Override
    public boolean updateHoKhau(HoKhau hoKhau) {
        Connection connection = BaseRepo.getConnectDB();
        boolean update = false;
        try {
            PreparedStatement preparedStatement1 = connection.prepareStatement(UPDATE_HOKHAU_SQL1);
            preparedStatement1.setString(1, hoKhau.getTenChuHo());
            preparedStatement1.setString(2, hoKhau.getNgayLapHoKhau());
            preparedStatement1.setString(3, hoKhau.getDiaChi());
            preparedStatement1.setInt(4, Integer.parseInt(String.valueOf(hoKhau.getMaHoKhau())));
            System.out.println(preparedStatement1);
            update = preparedStatement1.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return update;

    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
