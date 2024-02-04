package com.bhanu.bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.bhanu.bean.patientuser;



public class patientuserdao {
	
		public static Connection getConnection() {
			Connection con=null;
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
				System.out.println("Connection created");
			}
			catch(Exception e) {
				System.out.println(e);
				System.out.println("Connection not created");
			}
			return con;
		}
		public static int save(patientuser u) {
			int status=0;
			try {
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("insert into patient(patient,gender,mobileno,email,address,problem,patientname) values(?,?,?,?,?,?,?)");
				ps.setInt(1,u.getPatient());
			
				ps.setString(2,u.getGender());
				ps.setString(3,u.getMobileno());
			    ps.setString(4,u.getEmail());
			    ps.setString(5,u.getAddress());
			    ps.setString(6,u.getProblem());
			    ps.setString(7,u.getPatientname());
				status =ps.executeUpdate();
				con.close();
			}
			catch(Exception e){
				System.out.println(e);
			}
			return status;	
		}
		public static List<patientuser> getAllRecords(){  
		    List<patientuser> list=new ArrayList<patientuser>();  
		      
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("select * from patient");  
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            patientuser u=new patientuser();  
		             
		            u.setPatient(rs.getInt("Patient"));  
		              
		            u.setGender(rs.getString("Gender")); 
		            u.setMobileno(rs.getString("Mobileno"));
		            u.setEmail(rs.getString("Email"));  
		            u.setAddress(rs.getString("Address"));  
		            u.setProblem(rs.getString("Problem")); 
		            u.setPatientname(rs.getString("Patientname"));
					        
		            list.add(u);  
		        }  
		    }catch(Exception e){System.out.println(e);}  
		    return list;  
		} 
		public static patientuser getRecordById(int id){  
		    patientuser u=null;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("select * from patient where patient=?");  
		        ps.setInt(1,id);  
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            u=new patientuser();  
		            u.setPatient(rs.getInt("Patient"));  
		              
		            u.setGender(rs.getString("Gender"));  
		            u.setMobileno(rs.getString("Mobileno"));
		            u.setEmail(rs.getString("Email"));  
		            u.setAddress(rs.getString("Address"));  
		            u.setProblem(rs.getString("Problem"));
		            u.setPatientname(rs.getString("Patientname"));
					}  
		    }catch(Exception e){System.out.println(e);}  
		    return u;  
		}  
		public static int update(patientuser u){  
		    int status=0;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement(  
		"update patient set gender=?,mobileno=?,email=?,address=?,problem=?,patientname=? where patient=?");  
		       
				ps.setString(1,u.getGender());
				ps.setString(2,u.getMobileno());
			    ps.setString(3,u.getEmail());
			    ps.setString(4,u.getAddress());
			    ps.setString(5,u.getProblem());
			    ps.setInt(7,u.getPatient());
			    ps.setString(6,u.getPatientname());
			   /* ps.setInt(6,u.getPatientid());*/
				 status=ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		    return status;  
		}  
		public static int delete(patientuser u){  
		    int status=0;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("delete from patient where patient=?");  
		        ps.setInt(1,u.getPatient());  
		        
		        status=ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}  
		public static List<patientuser> getRecordById(String pid){  
		    List<patientuser> list=new ArrayList<patientuser>();  
		    patientuser u=null; 
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("select * from patient where patient=?");
		        ps.setString(1,pid);
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            u=new patientuser();  
		            u.setPatient(rs.getInt("Patient"));  
		           /* u.setPatientname(rs.getString("patientname"));  */
		            u.setGender(rs.getString("Gender"));  
		            u.setMobileno(rs.getString("Mobileno"));
		            u.setEmail(rs.getString("Email"));  
		            u.setAddress(rs.getString("Address"));  
		            u.setProblem(rs.getString("Problem")); 
		            u.setPatientname(rs.getString("Patientname"));
		        }  
		    }catch(Exception e){System.out.println(e);}  
		    return list;  
		} 
}
	
   

