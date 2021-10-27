
$(document).ready(function(){
   //nhấn vào nút thêm 
   var flagTL=0;//giả sử không thao tác
    $(".btnthemtl").on("click", function(){
        //1 mờ nút thêm
        $(".btnthemtl").prop("disabled",true);
        $(".btnluutl").prop("disabled",false);
        $(".btnsuatl").prop("disabled",true);
         //Dữ liệu trên ô matl, tentl sẽ xóa đi
        resetViewTL();
        flagTL=1;//1 đang nhấn nút thêm
        //cờ xác định trạng thái là người dùng đang nhấn nút thêm hay nút sửa
        $(".txtmatl").prop("disabled",false);
    });
    $(".btnsuatl").on("click", function(){
        //1 mờ nút thêm
        $(".btnthemtl").prop("disabled",true);
        $(".btnluutl").prop("disabled",false);
        $(".btnsuatl").prop("disabled",true);
        flagTL=2;//2 đang nhấn nút cập nhật dữ liệu
        //cờ xác định trạng thái là người dùng đang nhấn nút thêm hay nút sửa
        $(".txtmatl").prop("disabled",true);
    });
    $(".btnlamlaitl").on("click", function(){
        //1 mờ nút thêm
        resetViewTL();
        $(".btnthemtl").prop("disabled",false);
        $(".btnluutl").prop("disabled",true);
        $(".btnsuatl").prop("disabled",true);
        flagTL=0;
        
    });
    $(".btnluutl").on("click", function(){
            if(flagTL==1){
                console.log("Them");
                //1.Lấy dữ liệu từ web matl,têntl
                var matl=$(".txtmatl").val();
                var tentl=$(".txttentl").val();
                if(matl==""){
                    alert_info("Mã Thể Loại không thể để trống");
                    $(".txtmatl").focus();
                }else if(tentl==""){
                    alert_info("Tên Thể Loại không thể để trống");
                    $(".txttentl").focus();
                }else  //có nghĩa matl và tên thể loại hop le
                {
                        //tạo ra 1 bộ dataclient gửi lên
                        var dataclient={
                            //Không thành công
                            matl:matl,
                            tentl:tentl,
                            event:"insertTL",
                        }    
                        //Gọi hàm Query
                        queryData("php/api.php",dataclient,function(res){
                                console.log(""+res.success);
                                if(res.success==2){
                                    alert_error("Dữ liệu đã bị trùng mã TL");
                                   
                                }else if(res.success==1){
                                    alert_success("Insert Thành Công");
                                    flagTL=0;
                                    resetViewTL();
                                    $(".btnthemtl").prop("disabled",false);
                                    $(".btnluutl").prop("disabled",true);
                                    $(".btnsuatl").prop("disabled",true);
                                    showDataTheLoai();
                                }else{
                                    alert("Lỗi Insert Thành Công");
                                }
                        });  
                }

            }else if(flagTL==2){
                console.log("update");
                var matl=$(".txtmatl").val();
                var tentl=$(".txttentl").val();
                if(matl==""){
                    alert_info("Mã Thể Loại không thể để trống");
                    $(".txtmatl").focus();
                }else if(tentl==""){
                    alert_info("Tên Thể Loại không thể để trống");
                    $(".txttentl").focus();
                }else  //có nghĩa matl và tên thể loại hop le
                {
                        //tạo ra 1 bộ dataclient gửi lên
                        var dataclient={
                            //Không thành công
                            matl:matl,
                            tentl:tentl,
                            event:"updateTL"
                        }    
                        //Gọi hàm Query
                        queryData("php/api.php",dataclient,function(res){
                                console.log(""+res.success);
                                if(res.success==2){
                                    alert_error("Dữ liệu đã bị trùng mã TL");
                                   
                                }else if(res.success==1){
                                    showDataTheLoai();
                                    alert_success("Cập nhật Thành Công");
                                    flagTL=0;
                                 
                                    $(".btnthemtl").prop("disabled",false);
                                    $(".btnluutl").prop("disabled",true);
                                    $(".btnsuatl").prop("disabled",true);
                                }else{
                                    alert_error("Lỗi Update Thành Công");
                                }
                        });  
                }

            }else{
                console.log("chưa nhấn nút nào cả");
            }
    });
    $(".btnxoatl").click(function(){
        var matl=$(".txtmatl").val();
		var tentl=$(".txttentl").val();
	 bootbox.confirm("Bạn có chắc xóa thể loại[ "+tentl+" ] này không?", function(result){
        if(result==true) {
            
         var dataSend = {
			 event: "deleteTL",
                matl:matl
            };
       
		
            queryData("php/api.php", dataSend, function (data) {
                console.log(data.success)
              if(data.success==1){
                  alert('Xóa thành công')
				showDataTheLoai();
                resetViewTL();
			  }else if(data.success==0){
				  alert("Xóa lỗi");
			  }else{
                alert("Thể loại đã được sử dụng trong bảng sách");
			  }
               
				
            });
			
			
        }else
        {
            // alert_info("Lỗi");
        }
    })
    })
    ////Bắt sự kiện click trên mỗi dòng
    $(".addListTheLoai").on('click','.click_view_theloai', function(){
             var matl=  $(this).parent().attr("data-matl");
             var tentl=  $(this).parent().attr("data-tentl");
             $(".txtmatl").val(matl);
             $(".txttentl").val(tentl);
             $(".btnthemtl").prop("disabled",false);
             $(".btnluutl").prop("disabled",true);
             $(".btnsuatl").prop("disabled",false);
            
    })

});
//Viết 1 hàm lấy dự liệu từ server
function showDataTheLoai(){
    var dataSend={
        event:"getALLTL"
    }
    var htmls='';
    console.log("s");
    queryData("php/api.php", dataSend, function (data) {
        var ar=data.items;//lấy ra mảng 
        var stt=1;
        for(var item in ar){
            var d=ar[item];
            htmls=htmls+  '<tr data-matl='+d.matl+' data-tentl="'+d.tentl+'" >'+
                            '<td>'+stt+'</td>'+
                            '<td>'+d.matl+'</td>'+
                            '<td>'+d.tentl+'</td>'+            
                            '<td class="click_view_theloai"><span class="badge bg-danger">Xem</span></td>'+
                          '</tr>';
          stt++;
        }
        $(".addListTheLoai").html(htmls);
        console.log(htmls);
    });
}
function resetViewTL(){
    $(".txtmatl").val("");
    $(".txttentl").val("");
   //đưa focus vào ô mã thể loại
   $(".txtmatl").focus();
}