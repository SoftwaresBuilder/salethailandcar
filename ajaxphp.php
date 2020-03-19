<?php
include('config/config.php');
error_reporting(0);
unset($_SESSION['sysErr']);
unset($_SESSION['sysData']);
$user_id = 0;
if(isset($_SESSION['user_record'])){
	$user_id = $_SESSION['user_record']['id'];
}
$lang = $_SESSION['lang'];
//echo $cat_id = dec_password($_GET['id']);

$p = $_GET['p'];


if($p=="chat_update"){
	$chat_id = dec_password($_POST['chat_id']);
	$chat = get_records($tblchat,"chat_id='".$chat_id."' and id>'".$_SESSION['chat']['last_id'][$chat_id]."'");
	if(count($chat)>0){
		foreach ($chat as $v) {
			include("chat_msgs.php");
		}
	}
	exit;
}

if($p=="chat_send"){
	$chat_id = dec_password($_POST['chat_id']);
	if(isset($_POST['product_id'])){
		$product_id = $_POST['product_id'];
	}
	$msg = $_POST['msg'];

	$chat = get_records($tblchat,"chat_id='".$chat_id."'","","1");
	if(count($chat)>0) {
		$product = get_records($tblproducts,"id='".$chat[0]['product_id']."'");
		$touser_id = ($chat[0]['user_id']==$user_id)?$chat[0]['touser_id']:$chat[0]['user_id'];
		$product_id = $chat[0]['product_id'];
	} else {
		$product = get_records($tblproducts,"id='".$product_id."'");
		$touser_id = $product[0]['user_id'];
	}

	$data = array();
	$data['chat_id'] = $chat_id;
	$data['product_id'] = $product_id;
	$data['user_id'] = $user_id;
	$data['touser_id'] = $touser_id;
	$data['msg'] = $msg;;
	$id = insert_record($tblchat,$data);

	$chat = get_records($tblchat,"chat_id='".$chat_id."' and id>'".$_SESSION['chat']['last_id'][$chat_id]."'");
	if(count($chat)>0){
		foreach ($chat as $v) {
			include("chat_msgs.php");
		}
	}

	exit;
}

if($p=="update_ad_type"){
	$id = $_POST['id'];
	$types = get_records($tblcategory_types,"category_id='".$id."'","title_".$lang." ASC");
	$html = '<option value="">Select Type</option>';
	if(count($types)>0){
		foreach ($types as $v) {
			$html .= '<option value="'.$v['id'].'">'.$v['title_'.$lang].'</option>';
		}
	}
	echo $html;
	exit;
}
if($p=="update_models"){
	$id = $_POST['id'];
	$models = get_records($tblcategory_models,"category_id='".$id."'","title_".$lang." ASC");
	$html = '<option value="">Select Models</option>';
	if(count($models)>0){
		foreach ($models as $v) {
			$html .= '<option value="'.$v['title_'.$lang].'">'.$v['title_'.$lang].'</option>';
		}
	} else {
		$html = "no";
	}
	echo $html;
	exit;
}
if($p=="update_submodels"){
	$id = $_POST['id'];
	$submodels = get_records($tblcategory_submodels,"type_id='".$id."'","title_".$lang." ASC");
	$html = '<option value="">Select Submodels</option>';
	if(count($submodels)>0){
		foreach ($submodels as $v) {
			$html .= '<option value="'.$v['title_'.$lang].'">'.$v['title_'.$lang].'</option>';
		}
	} else {
		$html = "no";
	}
	echo $html;
	exit;
}

if($p=="update_subcategories"){
	$id = $_POST['id'];
	
	$category = get_records($tblcategories,"pid='".$id."' and status='1' and trash='0'","title_".$lang." ASC");
	
	$html = '<option value="">'.translate("Select Sub Category").'</option>';
	if(count($category)>0){
		foreach ($category as $v) {
			$html .= '<option value="'.$v['id'].'">'.$v['title_'.$lang].'</option>';
		}
	}
	echo $html;
	exit;
}

if($p=="add_bidd"){
	
	if(isset($_GET['bid_amount'])){

		$product_id = $_GET['product_id'];
		$user_id = $_GET['user_id'];
		$bidder_id = $_GET['bidder_id'];
		$bid_amount = $_GET['bid_amount'];
		$bid_message = $_GET['bid_message'];
	
	
		$data = array();
		$data['user_id'] = $user_id;
		$data['bidder_id'] = $bidder_id;
		$data['product_id'] = $product_id;
		$data['amount'] = $bid_amount;
		$data['message'] = $bid_message;
		
		$id = insert_record($tblbidding,$data);
		sendmail_bidding($bidder_id,'post bid',$id);
		$get_product_bid =get_records($tblbidding,"product_id='".$product_id."' and status='1' and trash='0' order by id desc limit 1"); 
						$items = array();
                     if(!empty($get_product_bid))
                     { 
                     	
						foreach($get_product_bid as $record) {

						 $items[] = $record;
						}
					  }
                     			}


////////////////////   top bidder details//////////////
                   $where = "product_id=".$product_id."";
              $query = "SELECT MAX(amount) FROM tblbidding WHERE .; ";
            $max_bid_amount = sql("SELECT MAX(amount) as max_bid_amount FROM " . $tblbidding . " where " . $where);
             $min_bid_amount = sql("SELECT MIN(amount) as min_bid_amount FROM " . $tblbidding . " where " . $where);
             $total_bid_counts = sql("SELECT COUNT(*) as Num FROM " . $tblbidding . " where " . $where);
             	$items[0]['max_bid_amount'] = $max_bid_amount[0]['max_bid_amount'];
             	$items[0]['min_bid_amount'] = $min_bid_amount[0]['min_bid_amount'];
             	$items[0]['total_bid_counts'] = $total_bid_counts[0]['Num'];

				echo json_encode($items);
				exit;
}					
if($p=="get_search_filter"){
	 	$location = $_GET['location'];
	
		$subcategory_ids = implode(",",$_GET['product_ids']);
	     $condition = " category_id=".$_GET['cat_val'];
		if($subcategory_ids){
			$condition .= " AND subcategory_id IN(".$subcategory_ids.")";
		}
		if($location){
			$condition .= " AND location LIKE '%".$location."%' ";
		}
		/////////////// Search Code ///////////////////
		$products = get_records($tblproducts,$condition,"","");

				if(count($products)>0){
		          foreach ($products as $product) {
		          ?>
		           <div class="col-12 col-md-4"><?php include("card_real_state.php");?></div>
		           <?php
		          }
		        } else {
		        
		          echo $str_search_result = '<div class="col-12"><div class="err err_div">No record found</div></div>';
		        
		        }
		/////////////// End of Search Code ////////////
	
}	
if($p=="get_real_estate_type"){
	 	 $radio_value = $_GET['radio_value'];
	 	 $location = $_GET['location'];
	     $condition = " category_id=".$_GET['cat_val']; 
	     if($location)
	     {
			 $condition .= " AND type = '$radio_value'";
			 $condition .= " AND location Like '%".$location."%' ";
		 }
		 
		 $products = get_records($tblproducts,$condition,"",""); 

				if(count($products)>0){
		          foreach ($products as $product) {
		          ?>
		           <div class="col-12 col-md-4"><?php include("card_real_state.php");?></div>
		           <?php
		          }
		        } else {
		        
		          echo $str_search_result = '<div class="col-12"><div class="err err_div">No record found</div></div>';
		        
		        }
		/////////////// End of Search Code ////////////
	
}	
if($p=="get_jobs_filter"){
	  
    $job_title = $_GET['job_title'];
    $job_location = $_GET['job_location'];
    $job_sub_category = $_GET['job_sub_category'];
    $job_month_year = $_GET['job_month_year'];
    $job_min_price = $_GET['job_min_price'];
    $job_max_price = $_GET['job_max_price'];
	
	 	 $condition = " category_id=".$_GET['cat_val'];
		if($job_title){
			$condition .= " AND title LIKE '%".$job_titlex."%' ";
		}
		if($job_location){
			$condition .= " AND location LIKE '%".$job_location."%' ";
		}
		if($job_sub_category){
			$condition .= " AND subcategory_id =".$job_sub_category;
		}
		
		 $condition; 
	 	 $products = get_records($tblproducts,$condition,"","");

				if(count($products)>0){
		          foreach ($products as $product) {
		          ?>
		           <div class="col-12 col-md-4"><?php include("card_real_state.php");?></div>
		           <?php
		          }
		        } else {
		        
		          echo $str_search_result = '<div class="col-12"><div class="err err_div">No record found</div></div>';
		        
		        }

		exit;
}	
if($p=="get_price_sort"){
	  
    
   $sort_by = $_GET['sort_by'];
   $condition = " category_id=".$_GET['cat_val'];
		
		if($sort_by=="low_to_high"){
			$order_by .= " price asc ";
		}
		else if($sort_by=="high_to_low"){
			$order_by .= " price desc ";
		}
		else if($sort_by=="default"){
			$order_by .= " sort_date ASC ";
		}
		
		 $condition; 
	 	 $products = get_records($tblproducts,$condition,$order_by,"");

				if(count($products)>0){
		          foreach ($products as $product) {
		          ?>
		           <div class="col-12 col-md-4"><?php include("card_real_state.php");?></div>
		           <?php
		          }
		        } else {
		        
		          echo $str_search_result = '<div class="col-12"><div class="err err_div">No record found</div></div>';
		        
		        }

		exit;
}	
if($p=="change_product_status"){    
    $p_id = $_GET['id'];
 	$status = $_GET['status'];

 	$data = array();
	$data['status'] = $status;
	$condition = array();
	$condition['id'] = $p_id;
	$result = update_record($tblproducts,$data,$condition);

    if($status!=1){
    ?>
        <a href ="javascript:void(0);" onclick="update_status(1,<?php echo $p_id; ?>);">Activate</a>
    <?php
    } if($status!=2){
    ?>
        <a href ="javascript:void(0);" onclick="update_status(2,<?php echo $p_id; ?>);">Sold</a>
    <?php
    } if($status!=3){
    ?>
        <a href="javascript:void(0);" onclick="update_status(3,<?php echo $p_id; ?>);">Expired</a>
    <?php
    }
    
	exit;
}	
if($p=="bump_up_product"){    
    $p_id = $_GET['id'];
    $results = get_records($tblusers,'id = '.$_SESSION['user_record']['id']);
    if($results[0]['bump_up']>0){
    	$data = array();
		$data['bump_up'] = $results[0]['bump_up']-1;
		$condition = array();
		$condition['id'] = $results[0]['id'];
		$result = update_record($tblusers,$data,$condition);
		$data2 = array();
		$data2['sort_date'] = date('Y-m-d H:i:s');
		$condition2 = array();
		$condition2['id'] = $p_id;
		$result2 = update_record($tblproducts,$data2,$condition2);
		echo 'yes';
    }
    else {
    	echo 'no';
    }
	exit;
}	
if($p=="translate_into_thai"){    
    $description = $_GET['description'];
    if($description)
    {
    	echo $result = translate_into_thai($description);
    }
	exit;
}	

if($p == "getAllProduct"){
		$cid=$_GET['cid'];
		$sort_by=$_GET['sort_by'];
		$location=$_GET['location'];
		$latlng=explode(",",$_GET['latlng']);
		$sort_by = ($sort_by)?$sort_by:"distance";
		// pr($latlng);exit();
		$lat=trim($latlng[0]);
		$lng=trim($latlng[1]);
		
		///$products=get_records($tblproducts,"category_id='".$cid."' and status>0 and trash!=1");
		///$sub_cat_id=$products[0]['subcategory_id'];
		
		$sql="SELECT *, (3959 * acos(cos(radians('".$lat."')) * cos(radians(latitude)) * cos( radians(longitude) - radians('".$lng."')) + sin(radians('".$lat."')) * sin(radians(latitude)))) AS distance FROM ".$tblproducts." HAVING distance < $cons_gmap_distance AND category_id='".$cid."' AND status>0 AND trash!=1 AND location LIKE '%".$location."%' ORDER BY ".$sort_by." LIMIT 0 , 10";

        $products=sql($sql);

        if(count($products)>0){

              foreach ($products as $product) { ?>
                      <div><?php include('card_map.php');?></div>
                        <?php  
              }
            }
            else{
            	 echo "<div class='err'> No post found in your selected area</div>";
            } 
	exit;
}
if($p == "getTranslate"){
		$cid=$_GET['cid'];
		$chat_msgs=get_records($tblchat,"id='".$cid."' and trash!=1");
		$msg=$chat_msgs[0]['msg'];

        if($lang=='en'){
        		$c_msg=translate_api($msg,'en','th');
        		echo '<br>'.$c_msg;
        		
        	}else{
        		$c_msg=translate_api($msg);
        		echo '<br>'.$c_msg;
        	}
}
	if($p == "like_product"){
		$pid=$_GET['id'];
		if($user_id>0)
		{
			$liked = get_records($tblproduct_favorites,"user_id='".$user_id."' and product_id='".$pid."'");
			if(count($liked)>0){
				$result = delete_records($tblproduct_favorites ,"user_id='".$user_id."' and product_id='".$pid."'");
				echo "dislike";
			} 
			else {
				$data = array();
				$data['user_id'] = $user_id;
				$data['product_id'] = $pid;
				$id = insert_record($tblproduct_favorites,$data);
				if($id>0)
				{
					echo 'liked';
				}
			}
		}
		
}
?>