package com.serlvet;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.mysql.DBcon;
//import com.bean.mysql.Ticket;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/servlet/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String bno  = null;
		if(userName!=null && userName.length()>0
		&& password!=null && password.length()>0){
		userName=new String(userName.getBytes("ISO8859-1"));
			if(DBcon.queryUser(userName,password)){
				HttpSession session=request.getSession();
				session.setAttribute("username",userName);
				bno = DBcon.getBno(userName, password);
				session.setAttribute("bno",bno);
				response.sendRedirect(request.getContextPath()+"/frame.jsp");
			}else{
				response.sendRedirect(request.getContextPath()+"/logout2.jsp");
			}
		}else{
			response.sendRedirect(request.getContextPath()+"/logout2.jsp");
		}

		
//		if("admin".equals(username) && "q280654054".equals(password)){
//			//校验成功
//			HttpSession session = request.getSession();
//			session.setAttribute("username", username);
//			response.sendRedirect(request.getContextPath()+"/frame.jsp");
//
//		}else {
//			//校验失败
//			response.sendRedirect(request.getContextPath()+"/logout2.jsp");
//		}
	}

}
