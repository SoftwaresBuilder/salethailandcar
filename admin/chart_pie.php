<?php
include("../config/config.php");

$sql = "SELECT c.title, COUNT(*) as types FROM ".$tblproperties." as p
		LEFT JOIN ".$tblcategories." as c on c.id=p.ptype_id
		GROUP BY ptype_id";
$records = sql($sql);
?>
<script>
window.onload = function() {

var chart_pie = new CanvasJS.Chart("chart_pie", {
	animationEnabled: true,
	data: [{
		type: "pie",
		startAngle: 240,
		yValueFormatString: "##0",
		indexLabel: "{label} {y}",
		dataPoints: [
			<?php
			if(count($records)>0){
				foreach($records as $v){
				?>
					{y: <?php echo $v['types'];?>, label: "<?php echo $v['title'];?>"},
				<?php
				}
			}
			?>
		]
	}]
});
chart_pie.render();

}
</script>
<script src="assets/js/canvasjs.min.js"></script>

<div id="chart_pie" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
