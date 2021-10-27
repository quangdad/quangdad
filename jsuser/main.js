function swapMain(main){
	$(".formtheloai").addClass("is-hidden");
	$(".formnhaxuat").addClass("is-hidden");
    $(".formsach").addClass("is-hidden");
	$("."+main).removeClass("is-hidden");
}
$(document).ready(function(){
    swapMain("formtheloai");//mặc địch khi load trang chủ lên
    $(".menutheloai").on("click", function(){
        $(".titlestatus").html('<li class="breadcrumb-item"><a href="#">Danh mục</a></li><li class="breadcrumb-item active titlestatus">Thể Loại</li>');
        swapMain("formtheloai");
        //Sáng nút Them, Mờ nút lưu và sửa
        $(".btnthemtl").prop("disabled",false);//sáng 
        $(".btnsuatl").prop("disabled",true);//sáng 
        $(".btnluutl").prop("disabled",true);//sáng 
        showDataTheLoai();
    });
    $(".menunxb").on("click", function(){
        $(".titlestatus").html('<li class="breadcrumb-item"><a href="#">Danh mục</a></li><li class="breadcrumb-item active titlestatus">Nhà xuất bản</li>');
  
        swapMain("formnhaxuat");
    });
    $(".menusach").on("click", function(){
        $(".titlestatus").html('<li class="breadcrumb-item"><a href="#">Danh mục</a></li><li class="breadcrumb-item active titlestatus">Sách</li>');
  
        swapMain("formsach");
    });
});
//Ham get data
function queryData(url,dataSend,callback){
    
    $.ajax({
        type: 'POST',
        url: url,
        data: dataSend,
        async: true,
        dataType: 'json',
        success: callback
    });
}
//Sử dụng thư viện bootbox
function alert_error(mes) {
    bootbox.alert({
        size: "small",
        title: "<span style='color: red'>Thất bại</span>",
        message: mes,
        callback: function(){ /* your callback code */ }
    });
}
function alert_success(mes,callback) {
    bootbox.alert({
        size: "small",
        title: "",
        message: mes,
        callback: callback
    });
}
function alert_info(mes) {
    bootbox.alert({
        size: "small",
        title: "",
        message: mes,
        callback: function(){ /* your callback code */ }
    });
}