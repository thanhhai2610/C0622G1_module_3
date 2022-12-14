<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/06/2022
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="../furama/css/reset.css">
    <link rel="stylesheet" href="../furama/css/index.css">
</head>
<body>

<div class="container-fluid px-0 vh-100">

    <div class="header bg-light ">
        <nav class=" navbar navbar-expand-lg bg-light ">
            <div class="container-fluid">
                <a class="navbar-brand fs-3" href="/home"><img style="height: 150px; width: auto;"
                                                               src="data:image/jpeg;base64,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"
                                                               alt=""></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                        aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a style="padding-top: 26%; width: 150px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="/home">Home </a>
                        </li>
                        <li class="nav-item">
                            <a style="padding-top: 26%; width: 150px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="/home?action=employee">Emploee </a>
                        </li>
                        <li class="nav-item">
                            <a style="padding-top: 26%; width: 150px; height: 100px; font-size: 30px;"
                               class="nav-link active px-2"
                               aria-current="page"
                               href="/home?action=customer">Customer </a>
                        </li>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false"
                               style="padding-top: 26%; width: 150px; height: 100px; font-size: 30px;">
                                Service
                            </a>
                            <ul class="dropdown-menu">
                                <a class="dropdown-item" href="/home?action=villa">
                                    <li>Villa</li>
                                </a>
                                <a class="dropdown-item" href="/home?action=house">
                                    <li>House</li>
                                </a>
                                <a class="dropdown-item" href="/home?action=room">
                                    <li>Room</li>
                                </a>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false"
                               style="padding-top: 26%; width: 150px; height: 100px; font-size: 30px;">
                                Contract
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>

                    <form class="d-flex mx-3" role="search">
                        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
                            style="--bs-scroll-height: 100px;">
                            <li style="position: relative;" class="nav-item dropdown d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <svg style=" position:absolute; right:16px; top: 3px;"
                                     xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search mt-2"
                                     viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>

                            </li>
                        </ul>

                    </form>
                </div>
            </div>
        </nav>
    </div>

    <div>
        <section class="main">
            <!-- Carousel -->
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./images/carouse1.jpg" class="d-block" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/carouse2.jpg" class="d-block" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/carouse3.jpg" class="d-block" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
                <p class="fs-3 main__title">
                    KHU NGH??? D?????NG ???M TH???C
                    T???A L???C T???I B??I BI???N ???? N???NG
                    M???T TRONG 6 B??I BI???N ?????P NH???T TH??? GI???I
                </p>
                <div class="booking-form">
                </div>
            </div>
            <!-- About -->
            <div class="main-about d-flex flex-row justify-content-center">
                <div class="wrapper d-flex">
                    <div class="main-about__image">
                        <img src="./images/about-hotel-img.jpeg" alt="" class="main-about__image img-fluid">
                        <div class="img-label">FURAMA RIVERFRONT, SINGAPORE</div>
                    </div>
                    <div class="main-about__text">
                        <h2 class="main-about__title">C??C LO???I PH??NG</h2>
                        <p class="main-about__desc">
                            H?????ng ra b??i bi???n ???? N???ng tr???i d??i c??t tr???ng, Furama Resort ???? N???ng l?? c???a
                            ng?? ?????n v???i 3 di s???n v??n ho?? th??? gi???i: H???i An (20 ph??t), M??? S??n (90 ph??t) v?? Hu???
                            (2 ti???ng. 196 ph??ng h???ng sang c??ng v???i 70 c??n bi???t th??? t??? hai ?????n b???n ph??ng ng??? c?? h??? b??i
                            ri??ng ?????u ???????c trang tr?? trang nh??, theo phong c??ch thi???t k??? truy???n th???ng c???a Vi???t Nam v??
                            ki???n tr??c thu???c ?????a c???a Ph??p, bi???n Furama th??nh khu ngh??? d?????ng danh gi?? nh???t t???i Vi???t Nam ???
                            vinh d??? ???????c ????n ti???p nhi???u ng?????i n???i ti???ng, gi???i ho??ng gia, ch??nh kh??ch, ng??i sao ??i???n ???nh
                            v?? c??c nh?? l??nh ?????o kinh doanh qu???c t???.</p>
                        <h3 class="main-about__label">VIEW HOTELS BY</h3>
                        <div class="main-about__buttons d-flex">
                            <button class="btn btn-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Brands</button>
                            <button class="btn btn-outline-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">
                                Destinations
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Festival -->
            <div class="festival">
                <div class="festival-container">
                    <p class="fs-2 text-center text-uppercase fw-bold ">KHU NGH??? D?????NG ?????NG C???P TH??? GI???I, FURAMA ????
                        N???NG, N???I TI???NG L?? KHU NGH??? D?????NG ???M TH???C T???I VI???T NAM.</p>
                    <p class="fs-3 mt-4 text-uppercase text-bold  text-center">Khu ngh??? d?????ng c?? 196 ph??ng ???????c thi???t k???
                        theo phong c??ch truy???n th???ng Vi???t Nam k???t h???p v???i phong c??ch Ph??p, 2 t??a nh?? 4 t???ng c?? h?????ng
                        nh??n ra bi???n, nh??n ra h??? b??i trong xanh v?? nh???ng khu v?????n nhi???t ?????i xanh t????i m??t. Ngo??i ra, khu
                        ngh??? d?????ng Furama c??n cung c???p ca??c li????u ph??p spa, ph??ng x??ng h??i ??????t, ph??ng x??ng h??i kh??,
                        di??ch vu?? ma??t-xa ca??nh h???? b??i, c??c d???ch v??? th??? thao d?????i n?????c v?? ca??c l????p t????p yoga v?? Tha??i
                        C????c Quy????n tr??n b??i bi???n.</p>
                    <div class="d-flex w-100 gap-5">
                        <button class="btn btn-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Sign me up</button>
                        <button class="btn btn-outline-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Log in
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div>
        <section class="footer d-flex justify-content-center mt-5">
            <div class="wrapper container">
                <div class="row h-100">
                    <div class="col-6 " style="padding-top: 5%;">
                        <p class="fs-5 text-uppercase text-dark fw-bold">Our Brands</p>
                        <div class="d-flex mt-4">
                            <img class="footer__brand-logo" src="./images/xclusive.png" alt="">
                            <img class="footer__brand-logo" src="./images/fx.png" alt="">
                        </div>
                    </div>
                    <div class="col-6">
                        <h3 class="fs-2 text-uppercase text-dark fw-bold mb-4"> Furama</h3>
                        <div class="row">
                            <div class="col-3">
                                <div class="d-flex flex-column gap-2">
                                    <a href="#" class="text-dark fs-5">Our hotel</a>
                                    <a href="#" class="text-dark fs-5">Promotions</a>
                                    <a href="#" class="text-dark fs-5">Meetings</a>
                                    <a href="#" class="text-dark fs-5">Brand story</a>
                                    <a href="#" class="text-dark fs-5">Media center</a>
                                    <a href="#" class="text-dark fs-5">Corporate info</a>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="d-flex flex-column gap-2">
                                    <a href="#" class="text-dark fs-5">Lifestyle blog</a>
                                    <a href="#" class="text-dark fs-5">Careers</a>
                                    <a href="#" class="text-dark fs-5">Contact us</a>
                                    <a href="#" class="text-dark fs-5">Notices</a>
                                    <a href="#" class="text-dark fs-5">EGifts</a>
                                    <a href="#" class="text-dark fs-5">Expore south-east asia </a>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="d-flex flex-column gap-2">
                                    <a href="#" class="text-dark fs-5">Travel agents</a>
                                    <a href="#" class="text-dark fs-5">Sitemap</a>
                                    <a href="#" class="text-dark fs-5">Terms & Conditions</a>
                                    <a href="#" class="text-dark fs-5">Privacy policy</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


</div>

<script type="text/javascript">
    window.addEventListener("scroll", () => {
        const navbar = document.querySelector("#navbar");
        navbar.classList.toggle("sticky-top", window.scrollY > 124);
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>

</body>
</html>

