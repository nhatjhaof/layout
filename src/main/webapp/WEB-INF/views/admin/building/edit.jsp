<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="buildingEditURL" value ="/admin/building-edit"/>
<html>
<head>
    <title>Thông tin tòa nhà</title>
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

            <div class="nav-search" id="nav-search">
                <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>Thông tin tòa nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="BuildingEdit" action="${buildingEditURL}" method="GET" id="form-edit">
                <div class="col-xs-12">
                    <form class="form-horizontal" >
                        <div class="form-group">
                            <label class ="col-xs-3">Tên toà nhà</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" name="name">--%>
                    <form:input path="name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Quận</label>
                            <div class="col-xs-4">
                    <form:select  class="form-control" path="district">
                        <form:option value="" label="---Chọn Quận---"/>
                        <form:options items="${districtCode}" />
                    </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                    <form:input path="ward" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                    <form:input path="street" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Kết cấu</label name="structure">
                            <div class="col-xs-9">
                    <form:input path="structure" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                    <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                    <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                    <form:input path="direction" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                    <form:input path="level" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                    <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                    <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                    <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                    <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                    <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                    <form:input path="motoFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                    <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                    <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                    <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                    <form:input path="payment" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                    <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                    <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                    <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                    <form:input path="managerPhone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                    <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Loại toà nhà</label>
                            <div class="col-xs-9">
                    <form:checkboxes path="typeCode" items="${typeCodes}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                    <form:input path="note" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class ="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                        Thêm tòa nhà
                                    </button>
                                </c:if>
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn btn-warning" id="btnAddOrUpdateBuilding">
                                        Sửa tòa nhà
                                    </button>
                                </c:if>
                                <a href="/admin/building-list">
                                    <button type="button" class="btn btn-primary">
                                        Hủy thao tác
                                    </button>
                                </a>
                            </div>
                        </div>
                    </form>
                    </form:form>
                </div><!-- /.row -->

            </div><!-- /.page-content -->

        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData,function(i,it){
            if(it.name !='typeCode'){
                data["" + it.name + ""] = it.value;
            }
            else{
                typeCode.push(it.value);
            }
        });
        data['typeCode'] = typeCode;
        if(typeCode.length == 0)return alert("Loại tòa nhà không được thiếu!");
        else{   btnAddOrUpdate(data);}
    });
    function btnAddOrUpdate(data){
        $.ajax({
            type: "POST",
            url: "/api/buildings",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success:(response) =>{
                alert(response)
                window.location.replace("/admin/building-list")
            },
            error : function(response){
                console.log("failed");
                console.log(response);
            }
        });
    }
</script>
</body>
</html>
