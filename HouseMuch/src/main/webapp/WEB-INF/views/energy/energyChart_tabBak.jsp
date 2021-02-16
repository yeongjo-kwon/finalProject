<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainInc/mainTop.jsp"%>

<!-- 차트리소스 -->
 <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/styles.css" rel="stylesheet" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
 
 <!-- 탭 -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
   <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
 <!-- 탭 끝 -->
 <style>
.apt-bg-primary{
	background-color:#5c9f24; 
}
.apt-bg-secondary{
	background-color:#f6f6f6; 
}
.apt-bg-light{
	background-color:#F2FBDD; 
}
.apt-bg-dark{
	background-color:#22550E; 
}

.apt-text-primary{
	color:#5c9f24; 
}
.apt-text-secandary{
	color:#666666; 
}
.apt-text-third{
	color:#F2FBDD; 
}
.apt-text-dark{
	color:#22550E; 
}

.btn{
	background-color:#5c9f24;
	border-color: #5c9f24;
}
.btn:hover{
	background-color:#326717;
	border-color: #326717;
}

.btn-light{
	background-color:#F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}
.btn-light:hover{
	background-color:#ffffff;
	border-color: #5c9f24;
}


/* 탭css */

.nav-tabs .nav-item.open .nav-link, .nav-tabs .nav-item.open .nav-link:focus, .nav-tabs .nav-item.open .nav-link:hover, .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-item.show .nav-link:focus, .nav-tabs .nav-item.show .nav-link:hover, .nav-tabs .nav-link.active, .nav-tabs .nav-link.active:focus, .nav-tabs .nav-link.active:hover {
    color: #fff;
    background-color: #3f51b5;
    border-color: transparent;
    border-bottom-color: #3f51b5;
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #fff;
    background-color: #3f51b5;
    border-color: #e0e0e0;
}
.nav-tabs-line .nav-link {
    padding: .715rem 1.429rem;
    border-bottom: 2px solid transparent;
}
.nav-tabs .nav-link {
    color: #757575;
    transition: .25s;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .215rem;
    border-top-right-radius: .215rem;
}
.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}

.nav-tabs-line .nav-link {
    padding: .715rem 1.429rem;
    border-bottom: 2px solid transparent;
}
.nav-tabs .nav-link {
    color: #757575;
    transition: .25s;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .215rem;
    border-top-right-radius: .215rem;
}
.nav-link {
    position: relative;
    display: block;
    padding: .715rem 1.072rem;
    overflow: hidden;
}
.nav-link {
    display: block;
    padding: .715rem 1.429rem;
}
</style>

<div class="yiWrapper" style="width:100%; min-height:700px; margin: 0 auto;">
<div class="clearfix" style="height:80px;background-color:#f6f6f6;position:sticky;"></div>

<main id="main" style="position:sticky">
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs m-0">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="mt-2" style="line-height: 1; vertical-align: middle;">에너지 조회</h2>
				<ol style="font-size:0.9em; line-height:2;">
					<li><a href="<c:url value='/main/main.do'/>">Home</a></li>
					<li>우리집 에너지 조회</li>
					
				</ol>
			</div>
		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>
 
 <!-- 구매한템플릿탭 -->
             <div class="row row-lg">
              <div class="col-xl-6">
                <!-- Example Tabs Line -->
                <div class="example-wrap m-xl-0">
                  <div class="nav-tabs-horizontal" data-plugin="tabs">
                    <ul class="nav nav-tabs nav-tabs-line" role="tablist">
                      <li class="nav-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsLineOne"
                          aria-controls="exampleTabsLineOne" role="tab">Home</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineTwo"
                          aria-controls="exampleTabsLineTwo" role="tab">Components</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineThree"
                          aria-controls="exampleTabsLineThree" role="tab">Css</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineFour"
                          aria-controls="exampleTabsLineFour" role="tab">Javascript</a></li>
                      <li class="dropdown nav-item" role="presentation">
                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" aria-expanded="false">Dropdown </a>
                        <div class="dropdown-menu" role="menu">
                          <a class="active dropdown-item" data-toggle="tab" href="#exampleTabsLineOne" aria-controls="exampleTabsLineOne"
                            role="tab">Home</a>
                          <a class="dropdown-item" data-toggle="tab" href="#exampleTabsLineTwo" aria-controls="exampleTabsLineTwo"
                            role="tab">Components</a>
                          <a class="dropdown-item" data-toggle="tab" href="#exampleTabsLineThree" aria-controls="exampleTabsLineThree"
                            role="tab">Css</a>
                          <a class="dropdown-item" data-toggle="tab" href="#exampleTabsLineFour" aria-controls="exampleTabsLineFour"
                            role="tab">Javascript</a>
                        </div>
                      </li>
                    </ul>
                    <div class="tab-content pt-20">
                      <div class="tab-pane active" id="exampleTabsLineOne" role="tabpanel">
                        Quoquo timeret omne redeamus ratione monet nosque requietis afferrent iste, pertinerent.
                        Postremo frustra oportet pueriliter finxerat eos offendit
                        fecerint, iudicem quieti scribi animumque pondere ancillae,
                        timeret stoicos iustitia parvam.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineTwo" role="tabpanel">
                        Sole, latinas incurreret optari vivatur, porro delectu epicurus cadere impedit
                        fit ferreum concludaturque varias, omnium gloriosis vivendo
                        via filio contentam expeteretur fonte expectata, quosque
                        praetor quid iucunditatis fortitudinem esse.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineThree" role="tabpanel">
                        Maestitiam quamquam iudicare veterum contineri ipse cognoscerem se omittantur dialectica,
                        dixit poterit nondum tempora corpora claudicare ratione
                        percipitur. Earum comprehenderit laudem platonis allevatio
                        graeci, invidus coercendi valetudinis numen deseruisse.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineFour" role="tabpanel">
                        Adiit optime intemperantiam ostendis doctus brevi provincia suscepi. Eos efficitur
                        inprobis negent turbulenta consentientis ingeniis natura,
                        desperantes quisque concessum theophrasti, torquatus detracto,
                        deinde, intellegentium fruitur errorem nulli vivatur, operis.
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End Example Tabs Line -->
              </div>

              <div class="col-xl-6">
                <!-- Example Tabs Line Left -->
                <div class="example-wrap">
                  <div class="nav-tabs-vertical" data-plugin="tabs">
                    <ul class="nav nav-tabs nav-tabs-line mr-25" role="tablist">
                      <li class="nav-item" role="presentation"><a class="nav-link active" data-toggle="tab" href="#exampleTabsLineLeftOne"
                          aria-controls="exampleTabsLineLeftOne" role="tab">Home</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftTwo"
                          aria-controls="exampleTabsLineLeftTwo" role="tab">Components</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftThree"
                          aria-controls="exampleTabsLineLeftThree" role="tab">Css</a></li>
                      <li class="nav-item" role="presentation"><a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftFour"
                          aria-controls="exampleTabsLineLeftFour" role="tab">Javascript</a></li>
                    </ul>
                    <div class="tab-content py-15">
                      <div class="tab-pane active" id="exampleTabsLineLeftOne" role="tabpanel">
                        Mel, incorruptis confidam derepta inportuno perpetuam placatae. Expetenda summam
                        venandi cotidie euripidis vexetur, scribendi recta fortunam
                        hanc oblivione. Iniuria ipso statuam utrumque asperiores
                        eae cogitemus, evertitur triarium perspexit conclusionemque
                        propterea repellendus agatur scilicet, leniter intervalla
                        nocet praeterierunt tuum privatione, senserit sale vias,
                        delectatum dedecora ratione o religionis derigatur diuturnum
                        arbitrantur conspiratione, legam opera splendore iste democritum
                        apte romanum legum egregios.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftTwo" role="tabpanel">
                        Mnesarchum velit cumanum utuntur tantam deterritum, democritum vulgo contumeliae
                        abest studuisse quanta telos. Inmensae. Arbitratu dixisset
                        invidiae ferre constituto gaudeat contentam, omnium nescius,
                        consistat interesse animi, amet fuisset numen graecos incidunt
                        euripidis praesens, homines religionis dirigentur postulant.
                        Magnum utrumvis gravitate appareat fabulae facio perveniri
                        fruenda indicaverunt texit, frequenter probet diligenter
                        sententia meam distinctio theseo legerint corporis quoquo,
                        optari futurove expedita.
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftThree" role="tabpanel">
                       <!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->
                      </div>
                      <div class="tab-pane" id="exampleTabsLineLeftFour" role="tabpanel">
                        Dicent feramus necesse proficiscuntur libidinem quisquis, petulantes divitias compositis,
                        disseretur voluptates crudeli sustulisti. Hostis res utuntur
                        bono incurrunt navigandi laboribus istae tali, miserum
                        metuamus labor quasi synephebos iudicante. Effecerit sicine
                        falsarum pugnantibus imperitos, vero successionem exhorrescere
                        illis magnopere deteriora maioribus necessariam industria.
                        Illi variari stabilique augendas suscipiet, corrigere conducunt,
                        divinum affecti, eruditus clarorum. Spatio gustare cupiditates
                        desideret aliena sinat utrumque.
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End Example Tabs Line Left -->
              </div>
            </div>
          </div>
        </div>
        <!-- End Panel Tabs -->
 
 <!-- 구매한템플릿탭 끝-->
 
 
 
 
 
      <!-- ======= Departments Section ======= -->
    <section id="departments" class="departments">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Departments</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-4 mb-5 mb-lg-0">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#tab-1">
                  <h4><i class="fas fa-chart-area mr-1"></i>영역차트</h4>
                  
                </a>
              </li>
              <li class="nav-item mt-2">
                <a class="nav-link" data-toggle="tab" href="#tab-2">
                  <h4>막대</h4>
                  <p>Voluptas vel esse repudiandae quo excepturi.</p>
                </a>
              </li>
              <li class="nav-item mt-2">
                <a class="nav-link" data-toggle="tab" href="#tab-3">
                  <h4>도넛</h4>
                  <p>Velit veniam ipsa sit nihil blanditiis mollitia natus.</p>
                </a>
              </li>
             
            </ul>
          </div>
          <div class="col-lg-8">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <h3>Area차트</h3>
                <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                <img src="assets/img/departments-1.jpg" alt="" class="img-fluid">
                <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
             	<canvas id="myAreaChart" width="100%" height="30"></canvas>
             
              </div>
              <div class="tab-pane" id="tab-2">
                <h3><i class="fas fa-chart-bar mr-1"></i>막대차트</h3>
                <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                <img src="assets/img/departments-2.jpg" alt="" class="img-fluid">
                <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
              	<canvas id="myBarChart" width="100%" height="50"></canvas>
              </div>
              <div class="tab-pane" id="tab-3">
                <h3><i class="fas fa-chart-pie mr-1"></i>파이차트</h3>
                <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                <img src="assets/img/departments-3.jpg" alt="" class="img-fluid">
                <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
              	<canvas id="myPieChart" width="100%" height="50"></canvas>
              </div>
              
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Departments Section -->
    
<!-- <main> -->
	<section id="energyChart">
		<div class="container center">
			<div class="card mb-4">
				<div class="card-body">공과금 별 어쩌고 저쩌고<br> 
				더 자세한 내용은 <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js
						documentation</a> .
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i> Area Chart Example
				</div>
				<div class="card-body">
					<!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar mr-1"></i> Bar Chart Example
						</div>
						<div class="card-body">
							<!-- <canvas id="myBarChart" width="100%" height="50"></canvas> -->
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-pie mr-1"></i> Pie Chart Example
						</div>
						<div class="card-body">
							<!-- <canvas id="myPieChart" width="100%" height="50"></canvas> -->
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>
		</div>
</section>
<!-- 차트섹섹션-->
<!-- </main> -->

</div>

<!-- 차트스크립트 -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-bar-demo.js"></script>
        <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/assets/demo/chart-pie-demo.js"></script>
<!-- 탭리소스 -->
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/counterup/counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/ynResources/ynChart/tab/js/main.js"></script>
<%@ include file="../mainInc/mainBottom.jsp"%>