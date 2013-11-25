<%@page import="com.sun.faces.facelets.tag.jsf.core.ConvertDateTimeHandler"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileImage"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="com.rbnelite.udyogvishwa.model.RegistrationDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.StatusUpdateDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.FrndRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.type.AdaptedImmutableType"%>
<%@page import="com.rbnelite.udyogvishwa.model.PhotoUploadDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.Friendship"%>
<%@page import="com.rbnelite.udyogvishwa.model.OtherDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.HobbiesDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.LifestyleDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.ReligionDao"%>
<%@page import="com.rbnelite.udyogvishwa.model.Family"%>
<%@page import="com.rbnelite.udyogvishwa.model.Astro"%>
<%@page import="com.rbnelite.udyogvishwa.model.Contact"%>
<%@page import="com.rbnelite.udyogvishwa.model.Education"%>
<%@page import="com.rbnelite.udyogvishwa.service.GroupSer"%>
<%@page import="com.rbnelite.udyogvishwa.model.ProductDao"%>
<%@page import="java.security.acl.Group"%>
<%@page import="com.rbnelite.udyogvishwa.model.ProfileImageDao"%>
<%@page import="com.rbnelite.udyogvishwa.service.ProfileSer"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.IADD"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="CSS/style.css" type="text/css">
<script src="JavaScript/JScript.js" type="text/javascript"></script>
<script type="text/javascript" src="JavaScript/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/highslide.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="JavaScript/ModalPopupWindow.js" type="text/javascript"></script>
        <title>Profile</title>
        <script type="text/javascript">

            hs.graphicsDir = 'graphics/';
            hs.outlineType = 'rounded-white';
            hs.wrapperClassName = 'draggable-header';

            function validate()
            {
                var post=document.forms["ProfileForm"]["status_post"].value;
                if(post==null || post=="")
                {
                    alert("please Write Something !!!");
                    return false;
                }
    
    
            }
            
           function EnrollNow(msg){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

function EnrollLater(){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

        </script> 

    </head>
    <body>
        <%
            String user_mail = (String) session.getAttribute("User_Name");
        %>
        <div id="main">
            <div id="Cover">
                <div class="myinfo">
                    <%
                        String names[] = new String[3];
                        int n;
                        ProfileSer profile = new ProfileSer();
                        List l3 = profile.getMemberName(user_mail);
                        Iterator it3 = l3.iterator();
                        while (it3.hasNext()) {
                            for (n = 0; n < names.length; n++) {
                                names[n] = it3.next().toString();
                            }
                        }

                    %>
                    <font size="5" style="font-family: ariel" color="white"><%=names[0]%>&nbsp;<%=names[1]%>&nbsp;<%=names[2]%></font><br>
                    <font size="3" style="font-family: ariel" color="white"> Works At : RBNelite Software's</font><br>
                    <font size="3" style="font-family: ariel" color="white">As A : Software Developer</font>
                </div>
            </div>
            <%
                ProfileImage primg = new ProfileImage();
                String result = primg.getProfileImage(user_mail);
                session.setAttribute("result", result);
            %>
            <div id="profileImage"><img src="<%=result%>" style="border-radius: 5px;" height="170" width="150"></div>
            <div id="leftSide">
                <div id="profile_header">
                    <table align="center" width="100%">
                        <tr>
                            <td><a href="Home.jsp" style="text-decoration: none"><font color="white" size="3"><b>Home</b> </font></a></td>
                            <td><a href="Profile.jsp?iPagNo=1" style="text-decoration: none"><font color="white" size="3"><b>Profile</b></font></a> </td>
                            <td><a href="Products.jsp" style="text-decoration: none"><font color="white" size="3"><b>Products</b></font></a> </td>
                            <td><a href="#" style="text-decoration:none" onclick="ShowINeedPage();"><font color="white" size="3"><b>I Need</b></font></a></td>
                            <td><a href="Message.jsp" style="text-decoration: none"><font color="white" size="3"><b>Messages</b></font></a></td>
                            <td><a href="Events.jsp" style="text-decoration: none"><font color="white" size="3"><b>Events</b></font></a> </td>
                            <td>
                                <%

                                    int cnttt = 0;
                                    int act;
                                    SessionFactory sf16 = new Configuration().configure().buildSessionFactory();
                                    Session s16 = sf16.openSession();
                                    s16.beginTransaction();
                                    List allUsers16;
                                    Query queryResult16 = s16.createQuery("from Frnd_requestDao where req_to='" + user_mail + "' and req_status='N'");
                                    allUsers16 = queryResult16.list();

                                    for (int i = 0; i < allUsers16.size(); i++) {
                                        FrndRequest fnt = (FrndRequest) allUsers16.get(i);
                                        act = fnt.getFrnd_req_id();
                                        cnttt = cnttt + 1;
                                    }

                                %>
                                <a href="Friend_request.jsp" style="text-decoration: none" onclick="return hs.htmlExpand(this, { objectType: 'ajax'} )"><font color="white" size="3"><b> Request</b></font><font color="red" size="4"><%=cnttt%></font></a>
                                <%

                                    s16.getTransaction().commit();
                                    s16.close();
                                    sf16.close();
                                %>          
                            </td>
                            <td><a href="index.jsp" style="text-decoration: none"><font color="white" size="3"><b>Logout</b></font></a> </td>
                            </tr>
                            </table>
                </div>
                           
                <div id="GroupDetails">
                    
                    <div class="showGroups">
                        <table align="center" width="250">
                            <th colspan="2">Interest Areas </th>

                            <%
                                String gp[] = new String[1];
                                int s;
                                GroupSer group = new GroupSer();
                                String pageNumber = request.getParameter("iPagNo");
                                int pageNo = Integer.parseInt(pageNumber);
                                if (pageNumber.equals("") || pageNumber.equals(null)) {
                                    pageNumber = "1";
                                }
                                List l = group.getResult(user_mail, pageNumber);
                                Iterator it = l.iterator();
                                while (it.hasNext()) {
                                    for (s = 0; s < gp.length; s++) {
                                        gp[s] = it.next().toString();
                                    }
                               String imgpath= group.GroupImages(gp[0]);  
                                   
                            %>
                            <tr>
                                <td><a href="#"><img src="<%=imgpath%>" height="50" width="50" border="1"></a></td>
                                <td width="100%"><h4><a href="#" style="text-decoration: none"><%=gp[0]%> </a></h4></td>
                           
                            <%
                                }
                            %>
                            <td>
                                    <a href="Profile.jsp?iPagNo=<%=pageNo + 1%>" onclick="<%%>">More</a>
                                </td></tr>
                        </table>
                    </div>
                   
                </div>
                <div id="ProductDetails">
                <div class="showGroups">
                        <table width="250" align="center">
                            <%
                                String prod[] = new String[2];
                                int q;
                                List l11 = profile.getProductDetails(user_mail);
                                Iterator it11 = l11.iterator();
                                while (it11.hasNext()) 
                                {
                                    for (q = 0; q < prod.length; q++) {
                                        prod[q] = it11.next().toString();
                                    }
                            %>

                            <tr>
                                <td><a href="#"><img src="#" height="50" width="50" border="1"></a></td>
                                <td width="100%"><h4><a href="#" style="text-decoration: none"><%=prod[0]%></a></h4></td>
                            </tr>
                            <%

                                }
                            %>

                        </table>
                    </div>

                </div>
                <div id="profileInfo">
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png); width: 51px;height: 20px;" onclick="ShowNewPage();" /></div>


                    <script>
                        var modalWin = new CreateModalPopUpObject();
                        modalWin.SetLoadingImagePath("images/loading.gif");
                        modalWin.SetCloseButtonImagePath("images/remove.gif");
                        //Uncomment below line to make look buttons as link
                        //modalWin.SetButtonStyle("background:none;border:none;textDecoration:underline;cursor:pointer");

                        function ShowNewPage(){
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_education.jsp',400,500,'Edit Education Details',null,callbackFunctionArray);
                        }
                        function EditContactPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_contact.jsp',340,470,'Edit Contact Details',null,callbackFunctionArray); 
                        }
 
                        function EditFamilyPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_family.jsp',280,550,'Edit Family Details',null,callbackFunctionArray);
                        }
                        function EditReligionPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_religion.jsp',370,470,'Edit Religion & Ethnicity Details',null,callbackFunctionArray);
                        }
 
                        function EditLifestylePage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_lifestyle.jsp',450,500,'Edit Lifestyle & Attribute Details',null,callbackFunctionArray);
                        }
                        function EditAstroPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('Pop_astro.jsp',450,300,'Edit Astro Details',null,callbackFunctionArray);
                        }
                        function EditAstroPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('Pop_astro.jsp',450,500,'Edit Astro Details',null,callbackFunctionArray);
                        }
                        function EditHobbiesPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('Pop_Hobies.jsp',550,600,'Edit Hobbies Details',null,callbackFunctionArray);
                        }
 
                        function EditOtherPage()
                        {
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('Pop_other.jsp',400,500,'Edit Other Details',null,callbackFunctionArray);
                        }
                        function  ShowMessage(){
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            modalWin.ShowURL('pop_i_need.jsp',270,530,'Enter your need',null,callbackFunctionArray);
                        }
 
                        function ShowINeedPage(){
                            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
                            //var callbackFunctionArray = new Array(null, null);
                            modalWin.ShowURL('pop_i_need.jsp',270,530,'Enter your need',null,callbackFunctionArray);
                        }
                    </script>

                    <%
                        String ad[] = new String[7];
                        int pr;
                        List l1 = profile.getEducationDetails(user_mail);
                        Iterator it1 = l1.iterator();
                        while (it1.hasNext()) {
                            for (pr = 0; pr < ad.length; pr++) {
                                ad[pr] = it1.next().toString();
                            }
                        }
                    %>
                    <table align="center">
                        <tr>
                            <td><img src="icons/EDUCATION.png" width="50" height="50"> </td><td><font style="font-family: Verdana"><b>Education</b></font></td>

                        </tr>
                    </table>
                    
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Higher Degree</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=ad[1]%>  (<%=ad[5]%>)</td> </tr>
                        <tr><td>Completed From</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td> <%=ad[0]%></td></tr>
                        <tr><td>Graduation Degree</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=ad[3]%> (<%=ad[6]%>)</td></tr>
                        <tr><td>Completed From</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=ad[2]%></td></tr>
                        <tr><td>School</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=ad[4]%></td></tr>

                        </tr>
                    </table>
                </div>

                <div id="profileInfo" >
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditContactPage()()" /></div>
                        <%
                            int z;
                            String contact[] = new String[4];
                            List l2 = profile.getContactDetails(user_mail);
                            Iterator it2 = l2.iterator();
                            while (it2.hasNext()) {
                                for (z = 0; z < contact.length; z++) {
                                    contact[z] = it2.next().toString();
                            }
                            }

                        %>
                    <table align="center"><tr><td><img src="icons/contact_details.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Contact Details</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr>
                            <td>Email Id</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=user_mail%></td></tr>

                        <tr><td>Official Address</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=contact[1]%></td> </tr>

                       <tr><td>Home Address</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=contact[0]%></td></tr>
                                      
                        <tr><td>Mobile</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=contact[3]%></td></tr>

                    </table>
                </div>
                    <div id="profileInfo" >
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditFamilyPage()" /></div>
                        <%
                            int f;
                            String famly[] = new String[4];
                            List l5 = profile.getFamilyDetails(user_mail);
                            Iterator i5 = l5.iterator();
                            while (i5.hasNext()) {
                                for (f = 0; f < famly.length; f++) {
                                    famly[f] = i5.next().toString();
                                }
                            }


                        %>
                    <table align="center"><tr><td><img src="icons/FAMILY_DETAILS.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Family Details</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Family Members</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=famly[0]%></td></tr>

                        <tr> <td>Family Status</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=famly[1]%></td> </tr>

                        <tr><td>Family Type</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=famly[2]%></td></tr>

                        <tr> <td>Family Income</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=famly[3]%></td></tr>

                    </table>

                </div>
                        <div id="profileInfo">
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditHobbiesPage()"/></div>
                        <%
                            int h;
                            String hobb[] = new String[10];
                            List l8 = profile.getHobbiedDetails(user_mail);
                            Iterator i8 = l8.iterator();
                            while (i8.hasNext()) {
                                for (h = 0; h < hobb.length; h++) {
                                    hobb[h] = i8.next().toString();
                                }
                            }
                        %>

                    <table align="center"><tr><td><img src="icons/hobbies.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Hobbies</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Hobbies </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[0]%></td>  </tr> 
                        <tr> <td>Music u listen</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[1]%></td>  </tr> 
                        <tr><td>Books u read? </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[2]%></td>  </tr> 
                        <tr><td>Dress Style </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[3]%></td>  </tr> 
                        <tr> <td> TV Shows</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[4]%></td>  </tr> 
                        <tr> <td>Preffered Movies</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[5]%></td>  </tr> 
                        <tr> <td>Favourite Moviues </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[6]%></td>  </tr> 
                        <tr>  <td> Sports </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[7]%></td> </tr> 
                        
                        <tr>  <td> Food </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[8]%></td> </tr> 
                        <tr>  <td>Favourite Vacation Place</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=hobb[9]%></td> </tr> 
                    </table>

                </div>
                        
                        <div id="profileInfo" >
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditAstroPage()" /></div>
                        <%
                            int y;
                            String astr[] = new String[3];
                            List l4 = profile.getAstroDetails(user_mail);
                            Iterator it4 = l4.iterator();
                            while (it4.hasNext()) {
                                for (y = 0; y < astr.length; y++) {
                                    astr[y] = it4.next().toString();
                                }
                            }
                        %>
            <table align="center"><tr><td><img src="icons/ASTRO_DETAILS.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Astro Details</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr>
                            <td>Country</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=astr[0]%></td></tr>

                        <tr><td>City</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=astr[1]%></td> </tr>

                        <tr><td>Zodiac</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=astr[2]%></td>

                    </table>
                </div>
            

                <div id="profileInfo">
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditReligionPage()" /></div>
                        <%
                            int r;
                            String relg[] = new String[4];
                            List l6 = profile.getReligionDetails(user_mail);
                            Iterator i6 = l6.iterator();
                            while (i6.hasNext()) {
                                for (r = 0; r < relg.length; r++) {
                                    relg[r] = i6.next().toString();
                                }
                            }
                        %>
                    <table align="center"><tr><td><img src="icons/SPIRTUALITY1.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Religion & Ethnicity</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Religion</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=relg[0]%></td> </tr>
                        <tr><td>Cast</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=relg[1]%></td> </tr>
                        <tr><td>Mother Tongue</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=relg[2]%></td> </tr>
                        <tr> <td>Native Place</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=relg[3]%></td> </tr>
                    </table>

                </div>

                <div id="profileInfo">
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditLifestylePage()"/></div>
                        <%
                            int li;
                            String lif[] = new String[7];
                            List l7 = profile.getLifeStyleDetails(user_mail);
                            Iterator i7 = l7.iterator();
                            while (i7.hasNext()) {
                                for (li = 0; li < lif.length; li++) {
                                    lif[li] = i7.next().toString();
                                }
                            }

                        %>
                    <table align="center" ><tr><td><img src="icons/Lifestyle_Icon.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Lifestyle and Attributes</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Diet </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[0]%></td></tr> 
                        <tr><td>Smoke </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[1]%></td></tr> 
                        <tr><td>Drink </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[2]%></td></tr> 
                        <tr><td>Complexion </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[3]%></td></tr> 
                        <tr><td> Body Type</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[4]%></td></tr> 
                        <tr><td> Blood Group</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[5]%></td></tr> 
                        <tr><td>Weight </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=lif[6]%></td></tr> 
                         
                    </table>

                </div>

                
                <div id="profileInfo">
                    <div class="button"><input type="button" style="background-image: url(images/edit1.png);width: 50px" onclick="EditOtherPage()" /></div>
                        <%
                            int o;
                            String otd[] = new String[6];
                            List l9 = profile.getOtgerDetails(user_mail);
                            Iterator i9 = l9.iterator();
                            while (i9.hasNext()) {
                                for (o = 0; o < otd.length; o++) {
                                    otd[o] = i9.next().toString();
                                }
                            }
                        %>
                    <table align="center"><tr><td><img src="icons/OTHER.png" width="50" height="50"> </td><td><font style="font-family: cursive"><b>Other Details</b></font></td></tr></table>
                    <table style="margin-left: 150px; font-size: 14px">
                        <tr><td>Social Status </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[0]%></td>  </tr> 
                        <tr> <td>Political Status</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[1]%></td>  </tr> 
                        <tr><td>Social Activities </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[2]%></td>  </tr> 
                        <tr><td>Political Activities </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[3]%></td>  </tr> 
                        <tr> <td>Cultural Activities</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[4]%></td>  </tr> 
                        <tr> <td>Favourite Games</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=otd[5]%></td>  </tr> 
                    </table>

                </div>


            </div>



        </div>
        <%

            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        %>
        <div id="rightSide">

            <div id="share" style="border-radius: 5px;">
                <form action="ActionController" method="post" name="ProfileForm" id="ProfileForm" onsubmit="return validate();"> 

                    <input type="hidden"name="date" value="<%=date%>">
                    <table width="100%">
                        <tr>
                            <td colspan="5"><textarea cols="46" rows="1" name="status_post" id="status_post" value="share whats new" style="color: #a0a0a0" class="txtfield" onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}" onFocus="javascript:if(this.value==this.defaultValue){this.value='';}"></textarea>
                        </tr>
                        <tr>
                            <td align="center"><img src="images/bg-comment.gif">  </td> 
                            <td align="center"><img src="images/bg-comment.gif" > </td> 
                            <td align="center"><img src="images/bg-comment.gif"> </td> 
                            <td align="center"><img src="images/bg-comment.gif" > </td> 
                            <td rowspan="2"> <input type="submit" name="Status_update_profile" value="POST" style="background-color: #fab039; width:50px; height:30px; float: right"></td>
                        </tr>
                        <tr>

                            <td align="center">Text</td> 
                            <td align="center">Photo</td> 
                            <td align="center">Link</td> 
                            <td align="center"> Video </td> 
                        </tr>
                    </table>
                </form> 
            </div>

            <div id="friends">
                <table><tr><td><img src="icons/friends.png" width="50" height="50"> </td><td><font style="font-family: cursive">Friends</font></td></tr></table>     
                <table align="center">

                    <tr>
                        <%

                            int count1 = 0;
                            String photo1 = "";
                            String frnd = "";
                            String p1 = "";
                            String a11 = "/";
                            String ab1 = "";
                            String result11 = "";
                            SessionFactory sf13 = new Configuration().configure().buildSessionFactory();
                            Session s13 = sf13.openSession();
                            s13.beginTransaction();

                            Query queryResult13 = s13.createQuery("from FriendshipDao where whom_frd='" + user_mail + "'");
                            List allUsers = queryResult13.list();

                            for (int i = 0; i < allUsers.size(); i++) {
                                Friendship frnd_pht = (Friendship) allUsers.get(i);
                                frnd = frnd_pht.getWho_frd();

                                Query queryResult131 = s13.createQuery("from ProfileImageDao where user_mail='" + frnd + "'");
                                List allUsers1 = queryResult131.list();
                                for (int i1 = 0; i1 < allUsers1.size(); i1++) {
                                    ProfileImageDao prf_mmg1 = (ProfileImageDao) allUsers1.get(i1);
                                    photo1 = prf_mmg1.getPath();
                                    p1 = photo1.substring(73);
                                    result11 = p1.replace("\\", a11);

                                }

                                if (photo1.equals("") || photo1 == null) {
                                    result11 = "C:/Users/RBNelite/Documents/NetBeansProjects/NewBusinessPortal/build/web/images/BG 1.png";
                                    p1 = result11.substring(73);
                                    result11 = p1.replace("\\", a11);
                                }
                                session.setAttribute("result", result11);
                        %>
                        <td><table border="0"><tr><td><img src="<%=result11%>" height="60" width="60"></td></tr></table> </td>
                        <%

                            count1 = count1 + 1;
                            if (count1 == 5) {
                        %>
                        <td>
                            <br>
                        </td>
                        </tr> 

                    <%
                                count1 = 0;
                            }

                        }
                        s13.getTransaction().commit();
                        s13.close();
                        sf13.close();
                    %>



                    
                </table> 
            </div>

            <div id="friends">
                <table><tr><td><img src="icons/photo.png" width="50" height="50"> </td><td><font style="font-family: cursive">Photos</font></td></tr></table>     
                <table align="center">

                    <tr>
                        <%

                            int count = 0;
                            String path = "";
                            String a1 = "/";
                            SessionFactory sf12 = new Configuration().configure().buildSessionFactory();
                            Session s12 = sf12.openSession();
                            s12.beginTransaction();

                            Query queryResult12 = s12.createQuery("from PhotoUploadDao where user_mail='" + user_mail + "'");
                            allUsers = queryResult12.list();

                            for (int i = 0; i < allUsers.size(); i++) {
                                PhotoUploadDao pht = (PhotoUploadDao) allUsers.get(i);
                                path = pht.getPath();
                                String path1 = path.substring(73);

                                String result1 = path1.replace("\\", a1);
                        %>
                        <td>  <table border="0"><tr><td><img src="<%=result1%>" height="60" width="60"></td></tr></table>    </td>
                    <%

                        count = count + 1;
                        if (count == 5) {
                    %>
                        <td>
                            <br>
                        </td>
                    </tr> 

                    <%
                                count = 0;
                            }
                        }
                        s12.getTransaction().commit();
                        s12.close();
                        sf12.close();
                    %>



                   
                </table> 

            </div>

            <div id="friends2">
                <%
                    //String userName=(String)session.getAttribute("User_Name");
                    //String profile_img=(String)session.getAttribute("result");        
                    int i = 0;
                    int m = 0;
                    String ffname = "";
                    String flname = "";
                    String c_name = "";
                    String details = "";
                    String comment_whom = "";
                    String comment = "";
                    Long id;
                    SessionFactory sf21 = new Configuration().configure().buildSessionFactory();
                    Session s21 = sf21.openSession();
                    s21.beginTransaction();
                    Query queryResult21 = s21.createQuery("from StatusUpdateDao where user_email='" + user_mail + "' order by status_date desc");
                    allUsers = queryResult21.list();

                    for (i = 0; i < allUsers.size(); i++) {
                        StatusUpdateDao status = (StatusUpdateDao) allUsers.get(i);
                        id = status.getId();
                        details = status.getStatus_details();
                        c_name = status.getUser_email();
                        Long status_id = status.getId();

                        Query q2 = s21.createQuery("from RegistrationDao where emailId='" + c_name + "'");
                        List allUsers11 = q2.list();
                        for (int a12 = 0; a12 < allUsers11.size(); a12++) {
                            RegistrationDao rd = (RegistrationDao) allUsers11.get(a12);
                            ffname = rd.getfName();
                            flname = rd.getlName();
                %>
                <div id="state_div" class="state_img">

                    <img src="<%=result%>" height="50" width="50">
                    <div id="prf_state">
                        <b><%=ffname%>&nbsp;<%=flname%></b>

                    </div> 

                    <div id="prf_details">
                        <%=details%>
                    </div> 


                </div>

                <%
                        }
                    }
                    s21.getTransaction().commit();
                    s21.close();
                    sf21.close();
                %>




            </div>
        </div>
    </body>
</html>