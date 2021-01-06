package com.b_project.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	
	private Map<String, Action> actionMap = new HashMap<String, Action>();
	
	@Override
	public void init() throws ServletException {
		
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		
		try(FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		
		Iterator keyIter = prop.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String action = (String) keyIter.next();
			String actionClassName = prop.getProperty(action);
			try {
				Class<?> actionClass = Class.forName(actionClassName);
				Action actionInstance = (Action) actionClass.getDeclaredConstructor().newInstance();
				actionMap.put(action, actionInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}		
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}

	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String action = requestURI.substring(contextPath.length());
		Action actionInstance = actionMap.get(action);
		ActionForward forward = null;
		
		try {
			forward = actionInstance.execute(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}		
	}	
}
