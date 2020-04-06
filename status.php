<div class="status_tag">
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