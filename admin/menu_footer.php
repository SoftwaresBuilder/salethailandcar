<footer class="footer">
    <div class="container-fluid">
        <p class="copyright pull-left">
            &copy; <script>document.write(new Date().getFullYear())</script> <?php echo $cons_sitetitle;?>
        </p>
        <p class="copyright pull-right">
            Developed by <a href="http://softwaresbuilder.com" class="simple-text" target="_blank">Software's Builder</a>
        </p>
    </div>
</footer>
<script type="text/javascript">
function my_slug(slug_value){ 
    slug_en = slug_value.toString();
    slug_en = slug_en.replace(/\s+/g,'-');
   $('#slug_en').attr('value',slug_en);
}
</script>