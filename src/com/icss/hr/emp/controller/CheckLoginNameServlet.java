package com.icss.hr.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.hr.emp.service.EmpService;

/**
 * �ж��û����Ƿ���ڿ�����
 */
@WebServlet("/CheckLoginNameServlet")
public class CheckLoginNameServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		// ��õ�¼����
		String empLoginName = request.getParameter("empLoginName");

		// ����ҵ�����
		EmpService service = new EmpService();

		try {
			// �жϷ��ؼ����
			boolean result = service.checkLoginName(empLoginName);
			out.write(String.valueOf(result));
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}