package poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dao.RecordDAO;
import poly.dao.StaffDAO;
import poly.entity.Record;

@Controller
@RequestMapping("/admin/record/")
public class RecordController {
	
	@Autowired
	RecordDAO recordDAO;
	
	@Autowired
	StaffDAO staffDAO;
	
	@RequestMapping("show-record")
	public String showRecord(ModelMap modelMap) {
		modelMap.addAttribute("listRecord", recordDAO.getListRecord());
		return "record/show-record";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertForm(ModelMap modelMap) {
		modelMap.addAttribute("listStaff", staffDAO.getListStaff());
		return "record/insert";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap modelMap, Record record) {
		recordDAO.insertRecord(record);
		return "redirect: show-record.htm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(ModelMap modelMap,
			@RequestParam("id") int id) {
		modelMap.addAttribute("record", recordDAO.getInfoRecord(id));
		return "record/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap modelMap, Record record) {
		recordDAO.updateRecord(record);
		return "redirect: show-record.htm";
	}
	
	@RequestMapping("delete")
	public String delete(ModelMap modelMap,
			@RequestParam("id") int id) {
		recordDAO.deleteRecord(id);
		return "redirect: show-record.htm";
	}
}
