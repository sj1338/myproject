package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginService;
import auth.service.User;
import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {
	private static final String FORM_VIEW = "joinForm";
	private JoinService joinService = new JoinService();
	private LoginService loginService = new LoginService();

	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		JoinRequest joinReq = new JoinRequest();
		joinReq.setId(req.getParameter("id"));
		joinReq.setName(req.getParameter("name"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setConfirmPassword(req.getParameter("confirmPassword"));
		
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		
		if (id == null || id.isEmpty()) {
			errors.put("id", true);
		}
		
		if (name == null || name.isEmpty()) {
			errors.put("name", true);
		}
		
		if (password == null || password.isEmpty()) {
			errors.put("password", true);
		}
		
		if (confirmPassword == null || confirmPassword.isEmpty()) {
			errors.put("confirmPassword", true);
		}
		
		/*
		 * if (!password.equals(ConfirmPassword)) { errors.put("notMatch", true); }
		 */
		
		if (!password.equals(confirmPassword)) {
			errors.put("notMatch", true);
		}
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			
			/* 로그인 */
			User user = loginService.login(joinReq.getId(), joinReq.getPassword());
			req.getSession().setAttribute("authUser", user);
			req.setAttribute("success", true);
			return FORM_VIEW;
//			return "joinSuccess";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", true);
			return FORM_VIEW;
		}

	}

	
	
}
