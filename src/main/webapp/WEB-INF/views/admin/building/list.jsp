<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="buildingAPI" value="api/buildings"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>

                <li>
                    <a href="#">UI &amp; Elements</a>
                </li>
                <li class="active">Content Sliders</li>
            </ul><!-- /.breadcrumb -->

<%--            <div class="nav-search" id="nav-search">--%>
<%--                <form class="form-search">--%>
<%--								<span class="input-icon">--%>
<%--									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />--%>
<%--									<i class="ace-icon fa fa-search nav-search-icon"></i>--%>
<%--								</span>--%>
<%--                </form>--%>
<%--            </div><!-- /.nav-search -->--%>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>Danh sách tòa nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box" style="font-family: 'Times New Roman',Times,serif;">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

                            <span class="widget-toolbar">
											<a href="#" data-action="reload">
												<i class="ace-icon fa fa-refresh"></i>
											</a>
											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</span>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form action="/admin/building-list" modelAttribute="modelSearch" method="GET" id="listForm">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <lable>Tên tòa nhà</lable>
<%--                                                    <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                    <form:input path="name" class="form-control"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <lable>Diện tích sàn</lable>
<%--                                                    <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                    <form:input path="floorArea" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <lable>Quận</lable>
<%--                                                    <select class="form-control" name="district">--%>
<%--                                                        <option value="">---Chọn Quận---</option>--%>
<%--                                                        <option value="QUAN_1">Quận 1</option>--%>
<%--                                                        <option value="QUAN_2">Quận 2</option>--%>
<%--                                                        <option value="QUAN_3">Quận 3</option>--%>
<%--                                                        <option value="QUAN_4">Quận 4</option>--%>
<%--                                                        <option value="QUAN_5">Quận 5</option>--%>
<%--                                                        --%>
<%--                                                    </select>--%>
                                                    <div>
                                                        <form:select  class="form-control" path="district">
                                                            <form:option value="" label="---Chọn Quận---"></form:option>
                                                            <form:options items="${districtCode}" />
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-5">
                                                    <lable>Phường</lable>
<%--                                                    <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                    <form:input path="ward" class="form-control"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <lable>Đường</lable>
<%--                                                    <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                    <form:input path="street" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <lable>Số tầng hầm</lable>
<%--                                                    <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                    <form:input path="numberOfBasement" class="form-control"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <lable>Hướng</lable>
<%--                                                    <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                    <form:input path="direction" class="form-control"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <lable>Hạng</lable>
<%--                                                    <input type="text" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                    <form:input path="level" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <lable>Diện tích từ</lable>
<%--                                                    <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                    <form:input path="areaFrom" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <lable>Diện tích đến</lable>
<%--                                                    <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                    <form:input path="areaTo" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <lable>Giá thuê từ</lable>
<%--                                                    <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                    <form:input path="rentPriceFrom" class="form-control"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <lable>Giá thuê đến</lable>
<%--                                                    <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                    <form:input path="rentPriceTo" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <lable>Tên quản lý</lable>
<%--                                                    <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">--%>
                                                    <form:input path="managerName" class="form-control"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <lable>SĐT quản lý</lable>
<%--                                                    <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">--%>
                                                    <form:input path="managerPhone" class="form-control"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <lable>Nhân viên phụ trách</lable>
<%--                                                    <select class="form-control" name="staffId">--%>
<%--                                                        <option value="">---Chọn Nhân Viên---</option>--%>
<%--                                                        <option value="1">Nguyen Van A</option>--%>
<%--                                                        <option value="3">Tran Thi C</option>--%>
<%--                                                        <option value="4">Pham Thi D</option>--%>
<%--                                                    </select>--%>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="---Chọn Nhân Viên---"></form:option>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                   <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button class="btn btn-sm btn-primary" id="btnSearch">
                                                        <i class="ace-icon glyphicon glyphicon-search"></i>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a href="/admin/building-edit">
                        <button title = "Thêm tòa nhà" class="btn btn-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                        </a>
                        <button title = "Xóa tòa nhà" class="btn btn-danger" id="btnDeleteBuildings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.page-content -->

            <div class="hr hr-18 dotted hr-double"></div>

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <table id="buildingList" class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại quản lý</th>
                            <th>D.Tích sàn</th>
                            <th>D.Tích trống</th>
                            <th>D.Tích thuê</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Phí môi giới</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items = "${buildings}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="1">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${item.name}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>3.2</td>
                                <td>
                                    <div>
                                        <button class="btn btn-sm btn-success" title="Giao tòa nhà"
                                                onclick="assignmentBuilding(1)">
                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                        </button>
                                        <a class="btn btn-sm btn-info" title="Sửa tòa nhà" href="/admin/building-edit-1">
                                            <i class="ace-icon fa fa-pencil-square-o"></i>
                                        </a>
                                        <button class="btn btn-sm btn-danger" title="Xóa tòa nhà">
                                            <i class="ace-icon glyphicon glyphicon-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div><!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

                &nbsp; &nbsp;
                <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="assignmentBuildingModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">
                    <table  class="table table-bordered" id="staffList">
                        <thead>
                        <tr>
                            <th class="center">
                                Chọn
                            <th class="center">Tên Nhân Viên</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="center">
                                <input type="checkbox" id="checkbox_1" value= "1" checked>
                            </td>
                            <td>Nguyen Van A</td>
                        </tr>
                        <tr>
                            <td class="center">
                                <input type="checkbox" id="checkbox_2" value= "3">
                            </td>
                            <td>Nguyen Van B</td>
                        </tr>
                        <tr>
                            <td class="center">
                                <input type="checkbox" id="checkbox_3" value= "5">
                            </td>
                            <td>Nguyen Van C</td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="buildingId" name="buildingId" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao tòa nhà</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div><!-- /.main-container -->

<script>
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        $('#buildingId').val(buildingId);
        loadStaffs(buildingId);
    }
    function loadStaffs(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            dataType: "json",
            success:(response)=>{
               var row = '';
               $.each(response.data , function (index,item){
                  row += '<tr>';
                  row += '<td class="center"><input type="checkbox" value = '  + item.staffId + 'id="checkbox_"' + item.staffId + '"  ' + item.checked + '/></td>';
                  row += '<td class="center">' + item.fullName + '</td>';
                  row +='</tr>';
               });
               $('#staffList tbody').html(row);
            },
            error : function(response){
                alert("Xóa không thành công");
                console.log(response);
            }
        });
    }
    $('#btnAssignBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;

        $.ajax({
            type: "PUT",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            // dataType: "text",
            success:(response)=>{
                alert("Giao tòa nhà thành công!");
            },
            error : function(response){
                alert("Giao tòa nhà không thành công!");
            }
        });
    });
    $('#btnDeleteBuildings').click(function (e){
        e.preventDefault();
        var data = {};
        var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['ids'] = buildingIds;
        deleteBuilding(data);

    });
    function btnDeleteBuilding(buildingId){
        var data = {};
        var id = [buildingId];
        data['ids'] = id;
        deleteBuilding(data);
    }
    function deleteBuilding(data){
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}",
            data: JSON.stringify(data['ids']),
            contentType: "application/json",
            dataType: "text",
            success:(response)=>{
                alert(response);
                window.location.replace("/admin/building-list");
            },
            error : function(response){
                alert("Xóa không thành công");
                console.log(response);
            }
        });
    }
    $('#btnSearch').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    });
</script>
</body>
</html>
