<style type="text/css">
    .status { position: relative; top:-20px ; background-color: #4089cd;
        height: 40px;
        width: 100%;
        border-radius: 100%;
        text-align: center;
        font-size: 20px;
        margin-bottom: -19px;
        font-family: serif;
        color: white;
        border :1px dashed;
        font-weight: bold;
     }
     .status:hover{
        background-color: #245c91;
     }
</style>
<div class="status">
        <?php if($product['status']==1)
    {
    echo 'Active';
    }
    else if($product['status']==2)
    {
    echo 'Sold';
    }
    else if($product['status']==3)
    {
    echo 'Expired';
    }
     ?>
    </div>