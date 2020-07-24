package poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dao.DepartDAO;
import poly.entity.Depart;

@Controller
@RequestMapping("/admin/depart/")
public class DepartController {

	@Autowired
	DepartDAO departDAO;
	
	@RequestMapping("show-depart")
	public String showDepart(ModelMap modelMap) {
		
		List<Depart> listDeparts = departDAO.getListDepart();
		modelMap.addAttribute("listDepart",listDeparts);
		
		return "depart/show-depart";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertForm() {
		return "depart/insert";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap modelMap, Depart depart) {
		
		if(departDAO.getInfoById(depart.getId()) != null) {
			modelMap.addAttribute("message", "VALID DEPART ID");
			return "depart/insert";
		} else {
			departDAO.insertDepart(depart);
			return "redirect: show-depart.htm";
		}
	}
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(ModelMap modelMap,
			@RequestParam("id") String id) {
		modelMap.addAttribute("depart", departDAO.getInfoById(id));
		return "depart/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap modelMap, Depart depart) {
		departDAO.updateDepart(depart);
		return "redirect: show-depart.htm";
	}
	
	@RequestMapping("delete/{id}")
	public String delete (ModelMap modelMap,
			@PathVariable("id") String id) {
		departDAO.deleteDepart(departDAO.getInfoById(id));
		return "redirect: ../show-depart.htm";
	}
}
