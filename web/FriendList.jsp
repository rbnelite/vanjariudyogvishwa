<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

 <% 
               int v=0;
               String lcnt="";
               SessionFactory sf17 =  new Configuration().configure().buildSessionFactory(); 
               Session s17=sf17.openSession();
               s17.beginTransaction();  
               List allUsers17;
               ArrayList list=new ArrayList();
               SQLQuery queryResult17 = s17.createSQLQuery("SELECT concat(fname,' ',lname) from registration");  
               queryResult17.getNamedParameters();
               allUsers17 = queryResult17.list();
               for ( v = 0; v < allUsers17.size(); v++)
               {  
                list.add(allUsers17.get(v).toString());
               }
               String[] str = new String[list.size()];	
               Iterator it = list.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
                        
                        //jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end
               
                s17.getTransaction().commit();
                s17.close();
                sf17.close();
%>