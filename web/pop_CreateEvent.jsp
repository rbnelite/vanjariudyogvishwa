<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="JavaScript/JScript.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
     <script language="javaScript" type="text/javascript" src="JavaScript/calendar1.js"></script>
     <link href="CSS/calendar1.css" rel="stylesheet" type="text/css"></link>     
    <title>Create event</title>
    <script>
         function EnrollNowClick()
        {
            window.parent.modalWin.CallCallingWindowFunction(0, 'Information Saved Scucessfully');
        }
    </script>
    <style>
        body
        {
            font-family: Verdana;
            font-size: 12px;
        }
    </style>
</head>
<body>
     <%
            String user_mail=(String)session.getAttribute("User_Name");
     %>
    <form action="ActionController" method="post" onsubmit="EnrollNowClick()" value="Enroll Now" style="height: 30px;">
    <table cellpadding="2" cellspacing="10">
        <tr><td>Name :</td> <td> <input type="text" name="event_name" maxlength="30" style="width: 300px"></td></tr>
        <tr><td>Details:</td><td> <textarea rows="1" cols="35" name="event_details" maxlength="80"></textarea></td> </tr>
        <tr> <td>Location:</td><td><input type="text" name="event_location" maxlength="30" style="width: 300px"></td> </tr>
        <tr><td>Date & Time:</td>
        <td><input type="text" name="event_date" style="width: 150px"><a href="#" onClick="setYears(1947, 2008); showCalender(this, 'event_date');">
                    <img src="images/calender.png"/></a></td>
        </tr>
        <tr><td><a href="pop_inviteFriends.jsp" style="text-decoration: none;">Invite People</a></td>
            <td align="center">
                <input type="submit"  name="create_event" value="Create Event" style="height: 30px;width: 100px;">
               
            </td>
   
           
        </tr>
    </table>
    <!-- Calender Script  --> 
    <table id="calenderTable" style="position: absolute">
        <tbody id="calenderTableHead">
          <tr>
            <td colspan="4" align="center">
	          <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,
	           this.selectedIndex, false));" id="selectMonth">
	              <option value="0">Jan</option>
	              <option value="1">Feb</option>
	              <option value="2">Mar</option>
	              <option value="3">Apr</option>
	              <option value="4">May</option>
	              <option value="5">Jun</option>
	              <option value="6">Jul</option>
	              <option value="7">Aug</option>
	              <option value="8">Sep</option>
	              <option value="9">Oct</option>
	              <option value="10">Nov</option>
	              <option value="11">Dec</option>
	          </select>
            </td>
            <td colspan="2" align="center">
			    <select onChange="showCalenderBody(createCalender(this.value, 
				document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
				</select>
			</td>
            <td align="center">
			    <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
			</td>
		  </tr>
       </tbody>
       <tbody id="calenderTableDays">
         <tr style="">
           <td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td>
         </tr>
       </tbody>
       <tbody id="calender"></tbody>
    </table>

<!-- End Calender Script  --> 
    </form>
  </body>
    
</html>
