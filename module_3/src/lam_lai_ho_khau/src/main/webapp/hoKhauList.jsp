<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/08/2022
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Room Page</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="home.css">
</head>
<body>

<div class="container-fluid px-0 vh-100">

    <div class="header bg-light ">
        <nav class=" navbar navbar-expand-lg bg-light ">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a style="    padding-top: 31%; width: 120px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="#">Home </a>
                        </li>
                        <li class="nav-item">
                            <a style="padding-top: 22%; width: 170px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="#">item a </a>
                        </li>
                        <li class="nav-item">
                            <a style="padding-top: 13%; width: 300px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="#">item b </a>
                        </li>


                    </ul>

                    <div class="d-flex mx-3" role="search">
                        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
                            style="--bs-scroll-height: 100px;">
                            <li style="position: relative;" class="nav-item dropdown d-flex">
                                <form action="/employee?action=search" method="post">
                                    <input name="searchName" class="form-control me-2" type="search"
                                           placeholder="Search"
                                           aria-label="Search">
                                    <svg style=" position:absolute; right:16px; top: 3px;"
                                         xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-search mt-2"
                                         viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </form>
                            </li>
                        </ul>
                    </div>


                </div>

            </div>
        </nav>

    </div>

    <div class="row mx-0 position-relative " style="height: 90%;margin-top: 0">
        <div align="center">
            <caption><h2>List Employee</h2></caption>
            <table id="product_table" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>ma hk</th>
                    <th>Ho ten</th>
                    <th>số lượng thành viên</th>
                    <th>Ngày lập</th>
                    <th>Địa chỉ</th>
                    <th>action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="stt" var="data" items="${hoKhauList}">
                    <tr>
                        <td>${stt.count}</td>
                        <td><c:out value="${data.maHoKhau}"/></td>
                        <td><c:out value="${data.tenChuHo}"/></td>
                        <td><c:out value="${data.soLuongThanhVien}"/></td>
                        <td><c:out value="${data.ngayLapHoKhau}"/></td>
                        <td><c:out value="${data.diaChi}"/></td>
                        <td>

                            <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                    data-bs-target="#update${data.maHoKhau}"> Chỉnh sửa
                            </button>

                            <div class="modal fade" id="update${data.maHoKhau}" tabindex="-1"
                                 aria-labelledby="1exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="1exampleModalLabel-update"> Nhân viên</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Chỉnh sửa <strong>${data.tenChuHo}</strong>:

                                            <form action="/hokhau?action=edit&maHoKhau=${data.maHoKhau}" method="post">
                                                <fieldset>
                                                    <legend>Thông tin Nhân viên</legend>
                                                    <table class="table table-striped table-bordered"
                                                           style="width: 100%">
                                                        <tr>
                                                            <th>Ma HK:</th>
                                                            <td>
                                                                <input type="text" name="maHoKhau" disabled
                                                                       value="${data.maHoKhau}"/>
                                                                <input type="hidden"
                                                                       name="maHoKhau"
                                                                       value="${data.maHoKhau}"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <th>Name :</th>
                                                            <td>
                                                                <input type="text" name="tenChuHo"
                                                                       value="${data.tenChuHo}"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <th>so luong thanh vien :</th>
                                                            <td>
                                                                <input type="text" name="soLuongThanhVien" disabled
                                                                       value="${data.soLuongThanhVien}"/>
                                                                <input type="hidden" name="soLuongThanhVien"
                                                                       value="${data.soLuongThanhVien}"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <th>Ngay lap HK :</th>
                                                            <td>
                                                                <input type="text" name="ngayLapHoKhau"
                                                                       value="${data.ngayLapHoKhau}"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <th>Dia chi:</th>
                                                            <td>
                                                                <input type="text" name="diaChi"
                                                                       value="${data.diaChi}"/>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </fieldset>
                                                <div class="modal-footer">
                                                    <a href="/hokhau" class="btn btn-secondary" data-bs-dismiss="modal">Hủy
                                                        bỏ</a>
                                                    <input type="submit" value="Xác nhận" class="btn btn-warning">

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a href="/hokhau?action=view&maHoKhau=${data.maHoKhau}">
                                <button type="button" class="btn btn-warning" data-bs-toggle="modal"> Xem chi tiết
                                </button>
                            </a>


                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>
        </div>

        <c:if test="${mess!=null}">
            <div aria-live="polite" aria-atomic="true" class="position-relative">
                <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <svg class="bd-placeholder-img rounded me-2" width="20" height="20"
                             xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <rect width="100%" height="100%" fill="#007aff"></rect>
                        </svg>
                        <strong class="me-auto"><span style="vertical-align: inherit;"><span
                                style="vertical-align: inherit;">Create Product</span></span></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Đóng"></button>
                    </div>
                    <div class="toast-body"><span style="vertical-align: inherit;"><span
                            style="vertical-align: inherit;">
                   <strong> ${mess}</strong> </span></span></div>
                </div>
            </div>
        </c:if>


    </div>

</div>

<%--<div class="modal fade" id="update${data.maHoKhau}" tabindex="-1"--%>
<%--     aria-labelledby="exampleModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel-update"> Danh sách </h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <div class="modal-body">--%>
<%--                    <c:forEach items="${map.get(data.maHoKhau)}" var="thanhvien">--%>
<%--                        <p>${thanhvien.hoVaTen}</p>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#product_table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>

