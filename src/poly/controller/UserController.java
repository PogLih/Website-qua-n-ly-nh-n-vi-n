package poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dao.UserDAO;
import poly.entity.User;

@Controller
@RequestMapping("/admin/user/")
public class UserController {

	@Autowired
	UserDAO userDAO;

	@RequestMapping("show-user")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listUser", userDAO.getAllUser(""));
		return "user/show-user";
	}

	@RequestMapping(value = "find", method = RequestMethod.GET)
	public String find(ModelMap modelMap, @RequestParam("search") String username) {
		if (username.length() == 0) {
			return "redirect: show-user.htm";
		} else {
			modelMap.addAttribute("listUser", userDAO.getAllUser(username));
			return "user/show-user";
		}
	}

	@RequestMapping("delete/{username}")
	public String index(ModelMap modelMap, @PathVariable("username") String username) {
		userDAO.deleteUser(username);
		return "redirect: ../show-user.htm";
	}

	@RequestMapping(value = "update-user", method = RequestMethod.GET)
	public String updateForm(ModelMap modelMap, @RequestParam("username") String username) {
		modelMap.addAttribute("user", userDAO.getInfoByUsername(username));
		return "user/update-user";
	}

	@RequestMapping(value = "update-user", method = RequestMethod.POST)
	public String updateUser(ModelMap modelMap, User user) {
		if (!userDAO.updateUser(user)) {
			modelMap.addAttribute("message", "Update Kh�ng Th�nh C�ng");
			return "user/update-user";
		} else {
			return "redirect: show-user.htm";
		}
	}

	@RequestMapping(value = "add-user", method = RequestMethod.GET)
	public String addUserForm() {
		return "user/add-user";
	}

	@RequestMapping(value = "add-user", method = RequestMethod.POST)
	public String addUser(ModelMap modelMap, User user) {
		userDAO.addUser(user);
		return "redirect: show-user.htm";
	}

}
