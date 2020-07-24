package poly.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dao.DepartDAO;
import poly.dao.StaffDAO;
import poly.entity.Staff;

@Controller
@RequestMapping("/admin/staff/")
public class StaffController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	StaffDAO staffDAO;
	
	@Autowired
	DepartDAO departDAO;
	
	@RequestMapping("show-staff")
	public String showStaff(ModelMap modelMap) {
		modelMap.addAttribute("listStaff", staffDAO.getListStaff());
		return "staff/show-staff";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertForm(ModelMap modelMap) {
		modelMap.addAttribute("listDepart", departDAO.getListDepart());
		return "staff/insert";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap modelMap, Staff staff,
			@RequestParam("file") MultipartFile file) {
		
		if(!file.isEmpty()) {
			staff.setPhoto(file.getOriginalFilename());
			String path = context.getRealPath("/resource/avatar/"+file.getOriginalFilename());
			try {
				file.transferTo(new File(path));
			} catch (IOException|IllegalStateException e) {
				e.printStackTrace();
			}
		}
		staffDAO.insertStaff(staff);
		return "redirect: show-staff.htm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(ModelMap modelMap,
			@RequestParam("id") String id) {
		modelMap.addAttribute("listDepart", departDAO.getListDepart());
		modelMap.addAttribute("staff", staffDAO.getInfoStaff(id));
		return "staff/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap modelMap, Staff staff,
			@RequestParam("file") MultipartFile file) {
		
		if(!file.isEmpty()) {
			staff.setPhoto(file.getOriginalFilename());
			String path = context.getRealPath("/resource/avatar/"+file.getOriginalFilename());
			try {
				file.transferTo(new File(path));
			} catch (IOException|IllegalStateException e) {
				e.printStackTrace();
			}
		}
		staffDAO.updateStaff(staff);
		return "redirect: show-staff.htm";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap modelMap,
			@RequestParam("id") String id) {
		staffDAO.deleteStaff(id);
		return "redirect: show-staff.htm";
	}
}
