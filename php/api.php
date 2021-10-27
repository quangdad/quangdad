<?php
require_once("server.php");//add code php file server vào trong file api.php
$event=$_POST['event'];//Lấy giá trị từ biến event từ client gửi lên theo dạng post  

switch ($event) {
	case "insertTL":
		$matl=$_POST['matl'];
		$tentl=$_POST['tentl'];   
		
	    $rs=mysqli_query($conn,"select COUNT(*) as 'total' from  theloai where MaTL='".$matl."' ");
        $row=mysqli_fetch_array($rs);
        if((int)$row['total']>0){
			 $res["success"] = 2; //{success:2} //đều có nghĩa là đã trùng tên
		}else{
        $sql="INSERT INTO `theloai`(`matl`, `tentl`) VALUES ('".$matl."','".$tentl."')";
      
       
            if (mysqli_query($conn, $sql)) {
					
                         $res["success"] = 1; //Insert dữ liệu thành công
				}
                else {
                    $res["success"] = 0;  //Không thành công
                }
            } 
        
        echo json_encode($res);
        mysqli_close($conn);
        break;
   
            case "updateTL":
                $matl=$_POST['matl'];
                $tentl=$_POST['tentl'];   
                //Viết câu lệnh update có điều kiện where matl=biến client
                $sql="update theloai set TenTL='".$tentl."' where MaTL='".$matl."'";      
                    if (mysqli_query($conn, $sql)) {

                            
                    $res["success"] = 1; //update dữ liệu thành c
                    } else {
                        $res["success"] = 0;  //Không thành công
                    }
               
                echo json_encode($res);
                mysqli_close($conn);
                break; 
        case "deleteTL":
                    $matl=$_POST['matl'];
                    //Kiểm tra matl có xuất các bảng (table khác  ? nếu có thì không xóa)
                    $rs=mysqli_query($conn,"select COUNT(*) as 'total' from  sach where MaTL='".$matl."' ");
                    $row=mysqli_fetch_array($rs);
                    if((int)$row['total']>0){
			            $res["success"] = 2; //{success:2} //đều có nghĩa là đã trùng tên
		            }
                   else{
                    $sql="delete  from theloai  where MaTL='".$matl."'";      
                    if (mysqli_query($conn, $sql)) {
                        if(mysqli_affected_rows($conn)>0){
                            
                        $res["success"] = 1; //update dữ liệu thành công
                        }else{
                            $res["success"] = 0 ;
                        }

                    } 
                   }
                    echo json_encode($res);
                    mysqli_close($conn);
                    break;
       //Get tất cả các TheLoai
       case "getALLTL":
		$mang=array();   
        $sql=mysqli_query($conn,"select * from Theloai"); 
		while($rows=mysqli_fetch_array($sql))
        {        
            $usertemp['matl']=$rows['MaTL'];
			$usertemp['tentl']=$rows['TenTL'];  
            array_push($mang,$usertemp);
        }       
        $jsonData['items'] =$mang; //{items:[{'matl':'TH','tentl':'tin hoc'},{'matl':'TH','tentl':'tin hoc'},{'matl':'TH','tentl':'tin hoc'}]}
        echo json_encode($jsonData);
		mysqli_close($conn);
		break;
	
		default:
        # code...
        break;
}
?>