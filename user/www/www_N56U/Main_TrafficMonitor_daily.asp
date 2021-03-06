<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">

<title>ASUS Wireless Router <#Web_Title#> - <#menu5_8_3#></title>
<link rel="stylesheet" type="text/css" href="index_style.css"> 
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="tmmenu.css">

<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/tmmenu.js"></script>
<script language="JavaScript" type="text/javascript" src="/tmhist.js"></script>

<script type='text/javascript'>

wan_route_x = '<% nvram_get_x("IPConnection", "wan_route_x"); %>';
wan_nat_x = '<% nvram_get_x("IPConnection", "wan_nat_x"); %>';
wan_proto = '<% nvram_get_x("Layer3Forwarding",  "wan_proto"); %>';

//	<% nvram("wan_ifname,lan_ifname,rstats_enable"); %>
try {
//	<% bandwidth("daily"); %>
}
catch (ex) {
	daily_history = [];
}
rstats_busy = 0;
if (typeof(daily_history) == 'undefined') {
	daily_history = [];
	rstats_busy = 1;
}

function save()
{
	cookie.set('daily', scale, 31);
}

function genData()
{
	var w, i, h, t;

	w = window.open('', 'tomato_data_d');
	w.document.writeln('<pre>');
	for (i = 0; i < daily_history.length-1; ++i) {
		h = daily_history[i];
		t = getYMD(h[0]);
		w.document.writeln([t[0], t[1] + 1, t[2], h[1], h[2]].join(','));
	}
	w.document.writeln('</pre>');
	w.document.close();
}

function getYMD(n)
{
	// [y,m,d]
	return [(((n >> 16) & 0xFF) + 1900), ((n >>> 8) & 0xFF), (n & 0xFF)];
}

function redraw()
{
	var h;
	var grid;
	var rows;
	var ymd;
	var d;
	var lastt;
	var lastu, lastd;

	if (daily_history.length-1 > 0) {
		ymd = getYMD(daily_history[0][0]);
		d = new Date((new Date(ymd[0], ymd[1], ymd[2], 12, 0, 0, 0)).getTime() - ((30 - 1) * 86400000));
		E('last-dates').innerHTML = '(' + ymdText(ymd[0], ymd[1], ymd[2]) + ' ~ ' + ymdText(d.getFullYear(), d.getMonth(), d.getDate()) + ')';

		lastt = ((d.getFullYear() - 1900) << 16) | (d.getMonth() << 8) | d.getDate();
	}

	lastd = 0;
	lastu = 0;
	rows = 0;
	block = '';
	gn = 0;

	grid = '<table class="bwmg" cellspacing="1">';
	/*grid += makeRow('header', 'Date', '<#Downlink#>', '<#Uplink#>', '<#Total#>');*/

	grid += "<tr><th width='8%' align='center' valign='top' style='text-align:left'><#Date#></th>";
	grid += "<th width='8%' align='center' valign='top'><#Downlink#></th>";
	grid += "<th width='8%' align='center' valign='top'><#Uplink#></th>";
	grid += "<th width='8%' align='center' valign='top'><#Total#></th></tr>";
	
	for (i = 0; i < daily_history.length-1; ++i) {
		h = daily_history[i];
		ymd = getYMD(h[0]);
		grid += makeRow(((rows & 1) ? 'odd' : 'even'), ymdText(ymd[0], ymd[1], ymd[2]), rescale(h[1]), rescale(h[2]), rescale(h[1] + h[2]));
		++rows;

		if (h[0] >= lastt) {
			lastd += h[1];
			lastu += h[2];
		}
	}

/*	grid += '<td style="line-height:30px">Last 30 Days<span id="last-dates"></span></td>';
	grid += '<td style="text-align:right" id="last-dn">-</td><td style="text-align:right" id="last-up">-</td><td style="text-align:right" id="last-total">-</td>';
*/	
	E('bwm-daily-grid').innerHTML = grid + '</table>';
	
	E('last-dn').innerHTML = rescale(lastd);
	E('last-up').innerHTML = rescale(lastu);
	E('last-total').innerHTML = rescale(lastu + lastd);
}

function init()
{
	var s;

	if (nvram.rstats_enable != '1') return;

	if ((s = cookie.get('daily')) != null) {
		if (s.match(/^([0-2])$/)) {
			E('scale').value = scale = RegExp.$1 * 1;
		}
	}

	initDate('ymd');
	daily_history.sort(cmpHist);
	redraw();
}

function switchPage(page){
	if(page == "1")
		location.href = "/Main_TrafficMonitor_realtime.asp";
	else if(page == "2")
		location.href = "/Main_TrafficMonitor_last24.asp";
	else
		return false;
}
</script>
</head>

<body onload="show_banner(1); show_menu(4, -2, 2); show_footer(); init();" >

<div id="TopBanner"></div>

<div id="Loading" class="popup_bg"></div>

<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" action="../apply.cgi" >
<input type="hidden" name="current_page" value="Main_TrafficMonitor_daily.asp">
<input type="hidden" name="next_page" value="Main_TrafficMonitor_daily.asp">
<input type="hidden" name="next_host" value="">
<input type="hidden" name="sid_list" value="WLANConfig11b;">
<input type="hidden" name="group_id" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="first_time" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("LANGUAGE", "preferred_lang"); %>">
<input type="hidden" name="wl_ssid2" value="<% nvram_get_x("WLANConfig11b",  "wl_ssid2"); %>">
<input type="hidden" name="firmver" value="<% nvram_get_x("",  "firmver"); %>">

<table class="content" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td width="23">&nbsp;</td>

<!--=====Beginning of Main Menu=====-->
	<td valign="top" width="202">
	  <div id="mainMenu"></div>
	  <div id="subMenu"></div>
	</td>
		
    <td valign="top">
	<div id="tabMenu" class="submenuBlock"></div>
	<br>
<!--===================================Beginning of Main Content===========================================-->
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
         <td valign="top" >           
		<table width="500" border="0" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle">
<!--===================================Beginning of QoS Content===========================================-->
	      <tr>
	      	<td bgcolor="#FFFFFF">
	      		<table width="100%"  border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
			<tr>
			<td>			  
				<div align="right">
			    <select class="top-input" style="width:100px" onchange='changeDate(this, "ymd")' id='dafm'>
			    	<option value=0><#Date#>:</option>
			    	<option value=0>yyyy-mm-dd</option>
			    	<option value=1>mm-dd-yyyy</option>
			    	<option value=2>mmm dd, yyyy</option>
			    	<option value=3>dd.mm.yyyy</option>
			    </select>	
			    <select style="width:80px" class="top-input" onchange='changeScale(this)' id='scale'>
			    	<option value=0><#Scale#>:</option>
			    	<option value=0>KB</option>
			    	<option value=1>MB</option>
			    	<option value=2 selected>GB</option>
			    </select>
			    <select class="top-input" style="width:120px" onchange="switchPage(this.options[this.selectedIndex].value)">
						<option><#switchpage#></option>
						<option value="1"><#menu4_2_1#></option>
						<option value="2"><#menu4_2_2#></option>
						<option value="3" selected><#menu4_2_3#></option>
					</select>	
				</div><br>
				<div id='bwm-daily-grid' style='float:left'></div>
			</td>
			</tr>
			</table>
		</td>
	      </tr>

	     <tr>
	      <td bgcolor="#FFFFFF">
	      	<table width="100%"  border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
	      		<thead>
	      			<tr>
	      				<td colspan="5" id="TriggerList"><#Last30days#><div id='last-dates'></div></td>
	      			</tr>
	      		</thead>
	      		<tr class='even'><th width="40%"><#Downlink#></th><td id='last-dn'>-</td></tr>
	      		<tr class='odd'><th width="40%"><#Uplink#></th><td id='last-up'>-</td></tr>
	      		<tr class='footer'><th width="40%"><#Total#></th><td id='last-total'>-</td></tr>
	      	</table>
	      </td>
	     </tr>

					</td>
				</tr>
			</table>
		</td>

				</tr>
			</table>				
		</td>
		
    <td width="10" align="center" valign="top">&nbsp;</td>
	</tr>
</table>
<div id="footer"></div>
</body>
</html>


