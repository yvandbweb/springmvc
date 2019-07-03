          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.bundle.min.js"></script>          
			
			<div class="row">
				  <div class="title1">
				  Average Posts per Month
				  </div>
				  <div class="col-sm">
						<canvas id="myAreaChart" style="display: block; width: 659px; height: 320px;" width="659" height="320" class="chartjs-render-monitor"></canvas>
				  </div>
	       </div>
	       
	        <div class="row">
		        
		        <div class="col-sm-6">  
			        <div style="">	
			        
						  <div class="title1">
						  Top Posters 
						  </div>
				            
		                   <canvas id="myPieChart" class="" style="width: 205px; height: 205px;"></canvas> 
		            </div>
	            </div>
		        
		        <div class="col-sm-6">  
			         <div style=""> 		  
						  <div class="title1">
						  Top Commenters	
						  </div>		               		       		                 
		                   <canvas id="myPieChart2" class="" style="width: 205px; height: 205px;"></canvas> 
		            </div>
	            </div>
	       </div>	       
                
                     
<script>
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [<c:forEach items="${monthlist}" var="m">"${m.mname}",</c:forEach>],
    datasets: [{
      label: "Earnings",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: [<c:forEach items="${monthlist}" var="m">"${m.cnt}",</c:forEach>],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 12
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 10,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});


//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

//Pie Chart Example
var ctx = document.getElementById("myPieChart");

data = {
	    datasets: [{
	        data: [<c:forEach items="${listposters}" var="m">"${m.cnt}",</c:forEach>],
	        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	    }],

	    // These labels appear in the legend and in the tooltips when hovering different arcs
	    labels: [
	    	<c:forEach items="${listposters}" var="m">"${m.mname}",</c:forEach>
	    ]
	};
options = {
		  maintainAspectRatio : false
		};	
var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options:options

});


//Pie Chart Example
var ctx = document.getElementById("myPieChart2");

data = {
	    datasets: [{
	        data: [<c:forEach items="${topcommenters}" var="m">"${m.cnt}",</c:forEach>],
	        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	    }],

	    // These labels appear in the legend and in the tooltips when hovering different arcs
	    labels: [
	    	<c:forEach items="${topcommenters}" var="m">"${m.mname}",</c:forEach>
	    ]
	};
var myPieChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options:options

});






</script>
      
        
<%@include file="footer.jsp" %>