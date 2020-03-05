<?php
include("../config/config.php");

$sql = "SELECT billing_month, SUM(total_bill) as bills, SUM(paid_amount) as earnings FROM ".$tblbills." WHERE billing_month!='0000-00-00' GROUP BY billing_month ORDER BY id DESC limit 6";
$records = sql($sql);
?>
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chart_bills_earnings", {
	///exportEnabled: true,
	animationEnabled: true,
	toolTip: {
		shared: true
	},
	data: [{
		type: "column",
		name: "Bills",      
		yValueFormatString: "#,##0.# Units",
		dataPoints: [
			<?php
			if(count($records)>0){
				foreach($records as $v){
					$month = dateFormat($v['billing_month'],"m-Y");
				?>
					{ label: "<?php echo $month;?>",  y: <?php echo $v['bills'];?> },
				<?php
				}
			}
			?>
		]
	},
	{
		type: "column",
		name: "Earnings",
		axisYType: "secondary",
		yValueFormatString: "#,##0.# Units",
		dataPoints: [
			<?php
			if(count($records)>0){
				foreach($records as $v){
					$month = dateFormat($v['billing_month'],"m-Y");
				?>
					{ label: "<?php echo $month;?>",  y: <?php echo $v['earnings'];?> },
				<?php
				}
			}
			?>
		]
	}]
});
chart.render();

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else {
		e.dataSeries.visible = true;
	}
	e.chart.render();
}

}
</script>
<script src="assets/js/canvasjs.min.js"></script>

<div id="chart_bills_earnings" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
