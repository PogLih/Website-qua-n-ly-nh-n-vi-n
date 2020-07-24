package poly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dao.UserDAO;
import poly.entity.User;

@Controller
@RequestMapping("/login/")
public class LoginController {

	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = "submit", method = RequestMethod.GET)
	public String showForm() {
		return "login/index";
	}

	@RequestMapping(value = "submit", method = RequestMethod.POST)
	public String login(ModelMap modelMap, HttpSession session, @RequestParam("username") String username,
			@RequestParam("pass") String pass) {

		User user = null;
		user = userDAO.getInfoByUsername(username);
		if (user == null) {
			modelMap.addAttribute("message", "Không tìm thấy username");
			return "home/index";
		}
		if (!user.getPassword().equalsIgnoreCase(pass)) {
			modelMap.addAttribute("message", "Sai mật khẩu");
			return "home/index";
		}
		session.setAttribute("login", user);
		modelMap.addAttribute("user", user);
		return "redirect: ../admin/user/show-user.htm";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "home/index";
	}
}
