
<?php
if($user_id>0){
	$liked = get_records($tblproduct_favorites,"user_id='".$user_id."' and product_id='".$product['id']."'");
	?>
	<a onclick="add_to_favourite('<?php echo $product['id'];?>');" href="javascript:;"><i id="like_<?php echo $product['id'];?>" class="fa fa-heart <?php if(count($liked)>0){?>liked <?php }else{?>like <?php }?>"></i></a>
    
<?php
}
?>
<script type="text/javascript">
	function add_to_favourite(id)
	{
		$.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {id:id,p:'like_product'},
            success: function(data){
            	$("#like_"+id).removeClass('liked');
            	if(data=='liked'){
            		$("#like_"+id).addClass('liked');
            	}else{
            		$("#like_"+id).addClass('like');
            	}
            } 
        });
	}
</script>