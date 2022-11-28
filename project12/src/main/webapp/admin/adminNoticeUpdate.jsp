<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Fork and Knife | Admin</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="../assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/libs/css/style.css">
<link rel="stylesheet" href="../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" href="../assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<link rel="stylesheet" href="../assets/vendor/inputmask/css/inputmask.css" />
<link rel="stylesheet" href="../assets/vendor/summernote/css/summernote-bs4.css" />
</head>

<body>
	<jsp:include page="../inc/adminTop.jsp" />
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- 왼쪽 사이드바(left sidebar) -->
		<!-- ============================================================== -->
		<jsp:include page="../inc/adminSidebar.jsp" />
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content">
				<div class="row">
					<div class="col-xl-10">
						<!-- ============================================================== -->
						<!-- pageheader  -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="page-header" id="top">
									<h2 class="pageheader-title">관리자 공지 작성</h2>
									<p class="pageheader-text">Proin placerat ante duiullam
										scelerisque a velit ac porta, fusce sit amet vestibulum mi.
										Morbi lobortis pulvinar quam.</p>
									<div class="page-breadcrumb">
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item">
												<a href="#" class="breadcrumb-link">Dashboard</a></li>
												<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Forms</a></li>
												<li class="breadcrumb-item active" aria-current="page">관리자 공지 수정</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end pageheader  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- basic form  -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="section-block" id="basicform">
									<h3 class="section-title">Form Elements</h3>
								</div>
								<div class="card">
									<h5 class="card-header">관리자 공지 등록</h5>
									<div class="card-body">
										<form>
											<div class="form-group">
												<select id="inputText3" type="text" class="form-control">
													<option>게시판 선택</option>
													<option>공지</option>
													<option>이벤트</option>
												</select>
											</div>
											<div class="form-group">
												<label for="inputText3" class="col-form-label">제목</label> 
												<input id="inputText3" type="text" class="form-control">
											</div>
											<!---------------------------------------------------------------------------------------->
											<!-- 글쓰기 설정  -->
											<div class="note-toolbar-wrapper" style="height: 92px;">
												<div class="note-toolbar card-header" style="position: relative; top: 0px; width: 100%;">
													<div class="note-btn-group btn-group note-style">
														<div class="note-btn-group btn-group">
															<button type="button" class="note-btn btn btn-gray dropdown-toggle" tabindex="-1" data-toggle="dropdown" title="" data-original-title="Style" aria-expanded="false">
																<i class="note-icon-magic"></i>
															</button>
															<div class="dropdown-menu dropdown-style" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 41px, 0px); top: 0px; left: 0px; will-change: transform;">
																<a class="dropdown-item" href="#" data-value="p"><p>Normal</p>
																</a><a class="dropdown-item" href="#" data-value="blockquote">
																<blockquote class="blockquote">Blockquote</blockquote></a>
																<a class="dropdown-item" href="#" data-value="pre"><pre>Code</pre></a>
																<a class="dropdown-item" href="#" data-value="h1"><h1>Header1</h1></a>
																<a class="dropdown-item" href="#" data-value="h2"><h2>Header2</h2></a>
																<a class="dropdown-item" href="#" data-value="h3"><h3>Header3</h3></a>
																<a class="dropdown-item" href="#" data-value="h4"><h4>Header4</h4></a>
																<a class="dropdown-item" href="#" data-value="h5"><h5>Header5</h5></a>
																<a class="dropdown-item" href="#" data-value="h6"><h6>Header6</h6></a>
															</div>
														</div>
													</div>
													<div class="note-btn-group btn-group note-font">
														<button type="button" class="note-btn btn btn-gray note-btn-bold" tabindex="-1" title="" data-original-title="Bold (CTRL+B)">
															<i class="note-icon-bold"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray note-btn-underline" tabindex="-1" title="" data-original-title="Underline (CTRL+U)">
															<i class="note-icon-underline"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray" tabindex="-1" title="" data-original-title="Remove Font Style (CTRL+\)">
															<i class="note-icon-eraser"></i>
														</button>
													</div>
													<div class="note-btn-group btn-group note-fontname">
														<div class="note-btn-group btn-group">
															<button type="button" class="note-btn btn btn-gray dropdown-toggle" tabindex="-1" data-toggle="dropdown" title="" data-original-title="Font Family">
																<span class="note-current-fontname" style="font-family: &amp; quot;Circular Std Book&amp;quot;;">Circular Std Book</span>
															</button>
															<div class="dropdown-menu note-check dropdown-fontname">
																<a class="dropdown-item" href="#" data-value="Arial">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Arial'">Arial</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Arial Black">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Arial Black'">Arial Black</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Comic Sans MS">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Comic Sans MS'">Comic Sans MS</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Courier New">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Courier New'">Courier New</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Helvetica">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Helvetica'">Helvetica</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Impact">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Impact'">Impact</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Tahoma">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Tahoma'">Tahoma</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Times New Roman">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Times New Roman'">Times New Roman</span>
																</a>
																<a class="dropdown-item" href="#" data-value="Verdana">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Verdana'">Verdana</span>
																</a>
																<a class="dropdown-item checked" href="#" data-value="Circular Std Book">
																	<i class="note-icon-menu-check"></i> 
																	<span style="font-family: 'Circular Std Book'">Circular Std Book</span>
																</a>
															</div>
														</div>
													</div>
													<div class="note-btn-group btn-group note-color">
														<div class="note-btn-group btn-group note-color">
															<button type="button" class="note-btn btn btn-gray note-current-color-button" tabindex="-1" title="" data-original-title="Recent Color" data-backcolor="#FFFF00">
																<i class="note-icon-font note-recent-color" style="background-color: rgb(255, 255, 0);"></i>
															</button>
															<button type="button" class="note-btn btn btn-gray dropdown-toggle" tabindex="-1" data-toggle="dropdown" title="" data-original-title="More Color"></button>
															<div class="dropdown-menu">
																<div class="note-palette">
																	<div class="note-palette-title">Background Color</div>
																	<div>
																		<button type="button" class="note-color-reset btn btn-light" data-event="backColor" data-value="inherit">Transparent</button>
																	</div>
																	<div class="note-holder" data-event="backColor">
																		<div class="note-color-palette">
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #000000" data-event="backColor" data-value="#000000" title="" data-toggle="button" tabindex="-1" data-original-title="#000000"></button>
																				<button type="button" class="note-color-btn" style="background-color: #424242" data-event="backColor" data-value="#424242" title="" data-toggle="button" tabindex="-1" data-original-title="#424242"></button>
																				<button type="button" class="note-color-btn" style="background-color: #636363" data-event="backColor" data-value="#636363" title="" data-toggle="button" tabindex="-1" data-original-title="#636363"></button>
																				<button type="button" class="note-color-btn" style="background-color: #9C9C94" data-event="backColor" data-value="#9C9C94" title="" data-toggle="button" tabindex="-1" data-original-title="#9C9C94"></button>
																				<button type="button" class="note-color-btn" style="background-color: #CEC6CE" data-event="backColor" data-value="#CEC6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#CEC6CE"></button>
																				<button type="button" class="note-color-btn" style="background-color: #EFEFEF" data-event="backColor" data-value="#EFEFEF" title="" data-toggle="button" tabindex="-1" data-original-title="#EFEFEF"></button>
																				<button type="button" class="note-color-btn" style="background-color: #F7F7F7" data-event="backColor" data-value="#F7F7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#F7F7F7"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFFFFF" data-event="backColor" data-value="#FFFFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFFFF"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #FF0000" data-event="backColor" data-value="#FF0000" title="" data-toggle="button" tabindex="-1" data-original-title="#FF0000"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FF9C00" data-event="backColor" data-value="#FF9C00" title="" data-toggle="button" tabindex="-1" data-original-title="#FF9C00"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFFF00" data-event="backColor" data-value="#FFFF00" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFF00"></button>
																				<button type="button" class="note-color-btn" style="background-color: #00FF00" data-event="backColor" data-value="#00FF00" title="" data-toggle="button" tabindex="-1" data-original-title="#00FF00"></button>
																				<button type="button" class="note-color-btn" style="background-color: #00FFFF" data-event="backColor" data-value="#00FFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#00FFFF"></button>
																				<button type="button" class="note-color-btn" style="background-color: #0000FF" data-event="backColor" data-value="#0000FF" title="" data-toggle="button" tabindex="-1" data-original-title="#0000FF"></button>
																				<button type="button" class="note-color-btn" style="background-color: #9C00FF" data-event="backColor" data-value="#9C00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#9C00FF"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FF00FF" data-event="backColor" data-value="#FF00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#FF00FF"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #F7C6CE" data-event="backColor" data-value="#F7C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#F7C6CE"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFE7CE" data-event="backColor" data-value="#FFE7CE" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE7CE"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFEFC6" data-event="backColor" data-value="#FFEFC6" title="" data-toggle="button" tabindex="-1" data-original-title="#FFEFC6"></button>
																				<button type="button" class="note-color-btn" style="background-color: #D6EFD6" data-event="backColor" data-value="#D6EFD6" title="" data-toggle="button" tabindex="-1" data-original-title="#D6EFD6"></button>
																				<button type="button" class="note-color-btn" style="background-color: #CEDEE7" data-event="backColor" data-value="#CEDEE7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEDEE7"></button>
																				<button type="button" class="note-color-btn" style="background-color: #CEE7F7" data-event="backColor" data-value="#CEE7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEE7F7"></button>
																				<button type="button" class="note-color-btn" style="background-color: #D6D6E7" data-event="backColor" data-value="#D6D6E7" title="" data-toggle="button" tabindex="-1" data-original-title="#D6D6E7"></button>
																				<button type="button" class="note-color-btn" style="background-color: #E7D6DE" data-event="backColor" data-value="#E7D6DE" title="" data-toggle="button" tabindex="-1" data-original-title="#E7D6DE"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #E79C9C" data-event="backColor" data-value="#E79C9C" title="" data-toggle="button" tabindex="-1" data-original-title="#E79C9C"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFC69C" data-event="backColor" data-value="#FFC69C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFC69C"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFE79C" data-event="backColor" data-value="#FFE79C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE79C"></button>
																				<button type="button" class="note-color-btn" style="background-color: #B5D6A5" data-event="backColor" data-value="#B5D6A5" title="" data-toggle="button" tabindex="-1" data-original-title="#B5D6A5"></button>
																				<button type="button" class="note-color-btn" style="background-color: #A5C6CE" data-event="backColor" data-value="#A5C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#A5C6CE"></button>
																				<button type="button" class="note-color-btn" style="background-color: #9CC6EF" data-event="backColor" data-value="#9CC6EF" title="" data-toggle="button" tabindex="-1" data-original-title="#9CC6EF"></button>
																				<button type="button" class="note-color-btn" style="background-color: #B5A5D6" data-event="backColor" data-value="#B5A5D6" title="" data-toggle="button" tabindex="-1" data-original-title="#B5A5D6"></button>
																				<button type="button" class="note-color-btn" style="background-color: #D6A5BD" data-event="backColor" data-value="#D6A5BD" title="" data-toggle="button" tabindex="-1" data-original-title="#D6A5BD"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #E76363" data-event="backColor" data-value="#E76363" title="" data-toggle="button" tabindex="-1" data-original-title="#E76363"></button>
																				<button type="button" class="note-color-btn" style="background-color: #F7AD6B" data-event="backColor" data-value="#F7AD6B" title="" data-toggle="button" tabindex="-1"data-original-title="#F7AD6B"></button>
																				<button type="button" class="note-color-btn" style="background-color: #FFD663" data-event="backColor" data-value="#FFD663" title="" data-toggle="button" tabindex="-1" data-original-title="#FFD663"></button>
																				<button type="button" class="note-color-btn" style="background-color: #94BD7B" data-event="backColor" data-value="#94BD7B" title="" data-toggle="button" tabindex="-1" data-original-title="#94BD7B"></button>
																				<button type="button" class="note-color-btn" style="background-color: #73A5AD" data-event="backColor" data-value="#73A5AD" title="" data-toggle="button" tabindex="-1" data-original-title="#73A5AD"></button>
																				<button type="button" class="note-color-btn" style="background-color: #6BADDE" data-event="backColor" data-value="#6BADDE" title="" data-toggle="button" tabindex="-1" data-original-title="#6BADDE"></button>
																				<button type="button" class="note-color-btn" style="background-color: #8C7BC6" data-event="backColor" data-value="#8C7BC6" title="" data-toggle="button" tabindex="-1" data-original-title="#8C7BC6"></button>
																				<button type="button" class="note-color-btn" style="background-color: #C67BA5" data-event="backColor" data-value="#C67BA5" title="" data-toggle="button" tabindex="-1" data-original-title="#C67BA5"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #CE0000" data-event="backColor" data-value="#CE0000" title="" data-toggle="button" tabindex="-1" data-original-title="#CE0000"></button>
																				<button type="button" class="note-color-btn" style="background-color: #E79439" data-event="backColor" data-value="#E79439" title="" data-toggle="button" tabindex="-1" data-original-title="#E79439"></button>
																				<button type="button" class="note-color-btn" style="background-color: #EFC631" data-event="backColor" data-value="#EFC631" title="" data-toggle="button" tabindex="-1" data-original-title="#EFC631"></button>
																				<button type="button" class="note-color-btn" style="background-color: #6BA54A" title="" data-toggle="button" tabindex="-1" data-original-title="#6BA54A"></button>
																				<button type="button" class="note-color-btn" style="background-color: #4A7B8C" data-event="backColor" data-value="#4A7B8C" title="" data-toggle="button" tabindex="-1" data-original-title="#4A7B8C"></button>
																				<button type="button" class="note-color-btn" style="background-color: #3984C6" data-event="backColor" data-value="#3984C6" title="" data-toggle="button" tabindex="-1" data-original-title="#3984C6"></button>
																				<button type="button" class="note-color-btn" style="background-color: #634AA5" data-event="backColor" data-value="#634AA5" title="" data-toggle="button" tabindex="-1" data-original-title="#634AA5"></button>
																				<button type="button" class="note-color-btn" style="background-color: #A54A7B" data-event="backColor" data-value="#A54A7B" title="" data-toggle="button" tabindex="-1" data-original-title="#A54A7B"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #9C0000" data-event="backColor" data-value="#9C0000" title="" data-toggle="button" tabindex="-1" data-original-title="#9C0000"></button>
																				<button type="button" class="note-color-btn" style="background-color: #B56308" data-event="backColor" data-value="#B56308" title="" data-toggle="button" tabindex="-1" data-original-title="#B56308"></button>
																				<button type="button" class="note-color-btn" style="background-color: #BD9400" data-event="backColor" data-value="#BD9400" title="" data-toggle="button" tabindex="-1" data-original-title="#BD9400"></button>
																				<button type="button" class="note-color-btn" style="background-color: #397B21" data-event="backColor" data-value="#397B21" title="" data-toggle="button" tabindex="-1" data-original-title="#397B21"></button>
																				<button type="button" class="note-color-btn" style="background-color: #104A5A" data-event="backColor" data-value="#104A5A" title="" data-toggle="button" tabindex="-1" data-original-title="#104A5A"></button>
																				<button type="button" class="note-color-btn" style="background-color: #085294" data-event="backColor" data-value="#085294" title="" data-toggle="button" tabindex="-1" data-original-title="#085294"></button>
																				<button type="button" class="note-color-btn" style="background-color: #311873" data-event="backColor" data-value="#311873" title="" data-toggle="button" tabindex="-1" data-original-title="#311873"></button>
																				<button type="button" class="note-color-btn" style="background-color: #731842" data-event="backColor" data-value="#731842" title="" data-toggle="button" tabindex="-1" data-original-title="#731842"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn" style="background-color: #630000" data-event="backColor" data-value="#630000" title="" data-toggle="button" tabindex="-1" data-original-title="#630000"></button>
																				<button type="button" class="note-color-btn" style="background-color: #7B3900" data-event="backColor" data-value="#7B3900" title="" data-toggle="button" tabindex="-1" data-original-title="#7B3900"></button>
																				<button type="button" class="note-color-btn" style="background-color: #846300" data-event="backColor" data-value="#846300" title="" data-toggle="button" tabindex="-1" data-original-title="#846300"></button>
																				<button type="button" class="note-color-btn" style="background-color: #295218" data-event="backColor" data-value="#295218" title="" data-toggle="button" tabindex="-1" data-original-title="#295218"></button>
																				<button type="button" class="note-color-btn" style="background-color: #083139" data-event="backColor" data-value="#083139" title="" data-toggle="button" tabindex="-1" data-original-title="#083139"></button>
																				<button type="button" class="note-color-btn" style="background-color: #003163" data-event="backColor" data-value="#003163" title="" data-toggle="button" tabindex="-1" data-original-title="#003163"></button>
																				<button type="button" class="note-color-btn" style="background-color: #21104A" data-event="backColor" data-value="#21104A" title="" data-toggle="button" tabindex="-1" data-original-title="#21104A"></button>
																				<button type="button" class="note-color-btn" style="background-color: #4A1031" data-event="backColor" data-value="#4A1031" title="" data-toggle="button" tabindex="-1" data-original-title="#4A1031"></button>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="note-palette">
																	<div class="note-palette-title">Foreground Color</div>
																	<div>
																		<button type="button"
																			class="note-color-reset btn btn-light"
																			data-event="removeFormat" data-value="foreColor">Reset
																			to default</button>
																	</div>
																	<div class="note-holder" data-event="foreColor">
																		<div class="note-color-palette">
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #000000"
																					data-event="foreColor" data-value="#000000"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#000000"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #424242"
																					data-event="foreColor" data-value="#424242"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#424242"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #636363"
																					data-event="foreColor" data-value="#636363"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#636363"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #9C9C94"
																					data-event="foreColor" data-value="#9C9C94"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#9C9C94"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #CEC6CE"
																					data-event="foreColor" data-value="#CEC6CE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#CEC6CE"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #EFEFEF"
																					data-event="foreColor" data-value="#EFEFEF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#EFEFEF"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #F7F7F7"
																					data-event="foreColor" data-value="#F7F7F7"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#F7F7F7"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFFFFF"
																					data-event="foreColor" data-value="#FFFFFF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFFFFF"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #FF0000"
																					data-event="foreColor" data-value="#FF0000"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FF0000"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FF9C00"
																					data-event="foreColor" data-value="#FF9C00"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FF9C00"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFFF00"
																					data-event="foreColor" data-value="#FFFF00"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFFF00"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #00FF00"
																					data-event="foreColor" data-value="#00FF00"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#00FF00"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #00FFFF"
																					data-event="foreColor" data-value="#00FFFF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#00FFFF"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #0000FF"
																					data-event="foreColor" data-value="#0000FF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#0000FF"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #9C00FF"
																					data-event="foreColor" data-value="#9C00FF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#9C00FF"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FF00FF"
																					data-event="foreColor" data-value="#FF00FF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FF00FF"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #F7C6CE"
																					data-event="foreColor" data-value="#F7C6CE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#F7C6CE"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFE7CE"
																					data-event="foreColor" data-value="#FFE7CE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFE7CE"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFEFC6"
																					data-event="foreColor" data-value="#FFEFC6"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFEFC6"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #D6EFD6"
																					data-event="foreColor" data-value="#D6EFD6"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#D6EFD6"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #CEDEE7"
																					data-event="foreColor" data-value="#CEDEE7"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#CEDEE7"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #CEE7F7"
																					data-event="foreColor" data-value="#CEE7F7"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#CEE7F7"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #D6D6E7"
																					data-event="foreColor" data-value="#D6D6E7"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#D6D6E7"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #E7D6DE"
																					data-event="foreColor" data-value="#E7D6DE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#E7D6DE"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #E79C9C"
																					data-event="foreColor" data-value="#E79C9C"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#E79C9C"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFC69C"
																					data-event="foreColor" data-value="#FFC69C"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFC69C"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFE79C"
																					data-event="foreColor" data-value="#FFE79C"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFE79C"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #B5D6A5"
																					data-event="foreColor" data-value="#B5D6A5"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#B5D6A5"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #A5C6CE"
																					data-event="foreColor" data-value="#A5C6CE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#A5C6CE"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #9CC6EF"
																					data-event="foreColor" data-value="#9CC6EF"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#9CC6EF"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #B5A5D6"
																					data-event="foreColor" data-value="#B5A5D6"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#B5A5D6"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #D6A5BD"
																					data-event="foreColor" data-value="#D6A5BD"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#D6A5BD"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #E76363"
																					data-event="foreColor" data-value="#E76363"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#E76363"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #F7AD6B"
																					data-event="foreColor" data-value="#F7AD6B"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#F7AD6B"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #FFD663"
																					data-event="foreColor" data-value="#FFD663"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#FFD663"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #94BD7B"
																					data-event="foreColor" data-value="#94BD7B"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#94BD7B"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #73A5AD"
																					data-event="foreColor" data-value="#73A5AD"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#73A5AD"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #6BADDE"
																					data-event="foreColor" data-value="#6BADDE"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#6BADDE"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #8C7BC6"
																					data-event="foreColor" data-value="#8C7BC6"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#8C7BC6"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #C67BA5"
																					data-event="foreColor" data-value="#C67BA5"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#C67BA5"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #CE0000"
																					data-event="foreColor" data-value="#CE0000"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#CE0000"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #E79439"
																					data-event="foreColor" data-value="#E79439"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#E79439"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #EFC631"
																					data-event="foreColor" data-value="#EFC631"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#EFC631"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #6BA54A"
																					data-event="foreColor" data-value="#6BA54A"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#6BA54A"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #4A7B8C"
																					data-event="foreColor" data-value="#4A7B8C"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#4A7B8C"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #3984C6"
																					data-event="foreColor" data-value="#3984C6"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#3984C6"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #634AA5"
																					data-event="foreColor" data-value="#634AA5"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#634AA5"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #A54A7B"
																					data-event="foreColor" data-value="#A54A7B"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#A54A7B"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #9C0000"
																					data-event="foreColor" data-value="#9C0000"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#9C0000"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #B56308"
																					data-event="foreColor" data-value="#B56308"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#B56308"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #BD9400"
																					data-event="foreColor" data-value="#BD9400"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#BD9400"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #397B21"
																					data-event="foreColor" data-value="#397B21"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#397B21"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #104A5A"
																					data-event="foreColor" data-value="#104A5A"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#104A5A"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #085294"
																					data-event="foreColor" data-value="#085294"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#085294"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #311873"
																					data-event="foreColor" data-value="#311873"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#311873"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #731842"
																					data-event="foreColor" data-value="#731842"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#731842"></button>
																			</div>
																			<div class="note-color-row">
																				<button type="button" class="note-color-btn"
																					style="background-color: #630000"
																					data-event="foreColor" data-value="#630000"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#630000"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #7B3900"
																					data-event="foreColor" data-value="#7B3900"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#7B3900"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #846300"
																					data-event="foreColor" data-value="#846300"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#846300"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #295218"
																					data-event="foreColor" data-value="#295218"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#295218"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #083139"
																					data-event="foreColor" data-value="#083139"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#083139"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #003163"
																					data-event="foreColor" data-value="#003163"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#003163"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #21104A"
																					data-event="foreColor" data-value="#21104A"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#21104A"></button>
																				<button type="button" class="note-color-btn"
																					style="background-color: #4A1031"
																					data-event="foreColor" data-value="#4A1031"
																					title="" data-toggle="button" tabindex="-1"
																					data-original-title="#4A1031"></button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="note-btn-group btn-group note-para">
														<button type="button" class="note-btn btn btn-gray"
															tabindex="-1" title=""
															data-original-title="Unordered list (CTRL+SHIFT+NUM7)">
															<i class="note-icon-unorderedlist"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray"
															tabindex="-1" title=""
															data-original-title="Ordered list (CTRL+SHIFT+NUM8)">
															<i class="note-icon-orderedlist"></i>
														</button>
														<div class="note-btn-group btn-group">
															<button type="button"
																class="note-btn btn btn-gray dropdown-toggle"
																tabindex="-1" data-toggle="dropdown" title=""
																data-original-title="Paragraph">
																<i class="note-icon-align-left"></i>
															</button>
															<div class="dropdown-menu">
																<div class="note-btn-group btn-group note-align">
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Align left (CTRL+SHIFT+L)">
																		<i class="note-icon-align-left"></i>
																	</button>
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Align center (CTRL+SHIFT+E)">
																		<i class="note-icon-align-center"></i>
																	</button>
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Align right (CTRL+SHIFT+R)">
																		<i class="note-icon-align-right"></i>
																	</button>
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Justify full (CTRL+SHIFT+J)">
																		<i class="note-icon-align-justify"></i>
																	</button>
																</div>
																<div class="note-btn-group btn-group note-list">
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Outdent (CTRL+[)">
																		<i class="note-icon-align-outdent"></i>
																	</button>
																	<button type="button" class="note-btn btn btn-gray"
																		tabindex="-1" title=""
																		data-original-title="Indent (CTRL+])">
																		<i class="note-icon-align-indent"></i>
																	</button>
																</div>
															</div>
														</div>
													</div>
													<div class="note-btn-group btn-group note-table">
														<div class="note-btn-group btn-group">
															<button type="button"
																class="note-btn btn btn-gray dropdown-toggle"
																tabindex="-1" data-toggle="dropdown" title=""
																data-original-title="Table">
																<i class="note-icon-table"></i>
															</button>
															<div class="dropdown-menu note-table">
																<div class="note-dimension-picker">
																	<div class="note-dimension-picker-mousecatcher"
																		data-event="insertTable" data-value="1x1"
																		style="width: 10em; height: 10em;"></div>
																	<div class="note-dimension-picker-highlighted"></div>
																	<div class="note-dimension-picker-unhighlighted"></div>
																</div>
																<div class="note-dimension-display">1 x 1</div>
															</div>
														</div>
													</div>
													<div class="note-btn-group btn-group note-insert">
														<button type="button" class="note-btn btn btn-gray" tabindex="-1" title="" data-original-title="Link (CTRL+K)">
															<i class="note-icon-link"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray" tabindex="-1" title="" data-original-title="Picture">
															<i class="note-icon-picture"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray" tabindex="-1" title="" data-original-title="Video">
															<i class="note-icon-video"></i>
														</button>
													</div>
													<div class="note-btn-group btn-group note-view">
														<button type="button" class="note-btn btn btn-gray btn-fullscreen" tabindex="-1">
															<i class="note-icon-arrows-alt"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray btn-codeview" tabindex="-1">
															<i class="note-icon-code"></i>
														</button>
														<button type="button" class="note-btn btn btn-gray" tabindex="-1">
															<i class="note-icon-question"></i>
														</button>
													</div>
												</div>
											</div>
											<!-- 글쓰기 설정  -->
											<!---------------------------------------------------------------------------------------->
											<br>
											<div class="form-group">
												<textarea class="form-control" id="exampleFormControlTextarea1" rows="25"></textarea>
											</div>
											<div class="form-group">
			                                    <button class="btn btn-primary btn-space" type="submit"><i class="icon s7-mail"></i> 등록</button>
			                                    <button class="btn btn-secondary btn-space" type="button"><i class="icon s7-close"></i> 취소</button>
			                                </div>
											
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end basic form  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<div class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							Copyright © 2018 Concept. All rights reserved. Dashboard by <a
								href="https://colorlib.com/wp/">Colorlib</a>.
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="text-md-right footer-links d-none d-sm-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end footer -->
			<!-- ============================================================== -->
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="../assets/libs/js/main-js.js"></script>
	<script src="../assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
	<script>
		$(function(e) {
			"use strict";
					$(".date-inputmask").inputmask("dd/mm/yyyy"),
					$(".phone-inputmask").inputmask("(999) 999-9999"),
					$(".international-inputmask").inputmask("+9(999)999-9999"),
					$(".xphone-inputmask")
							.inputmask("(999) 999-9999 / x999999"),
					$(".purchase-inputmask").inputmask("aaaa 9999-****"),
					$(".cc-inputmask").inputmask("9999 9999 9999 9999"),
					$(".ssn-inputmask").inputmask("999-99-9999"),
					$(".isbn-inputmask").inputmask("999-99-999-9999-9"),
					$(".currency-inputmask").inputmask("$9999"),
					$(".percentage-inputmask").inputmask("99%"),
					$(".decimal-inputmask").inputmask({
						alias : "decimal",
						radixPoint : "."
					}),

					$(".email-inputmask")
							.inputmask(
									{
										mask : "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[*{2,6}][*{1,2}].*{1,}[.*{2,6}][.*{1,2}]",
										greedy : !1,
										onBeforePaste : function(n, a) {
											return (e = e.toLowerCase())
													.replace("mailto:", "")
										},
										definitions : {
											"*" : {
												validator : "[0-9A-Za-z!#$%&'*+/=?^_`{|}~/-]",
												cardinality : 1,
												casing : "lower"
											}
										}
									})
		});
	</script>
</body>

</html>