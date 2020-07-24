package poly.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dao.DepartDAO;
import poly.dao.StaffDAO;
import poly.entity.Staff;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {

	@Autowired
	StaffDAO staffDAO;
	
	@Autowired
	DepartDAO departDAO;
	
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("index")
	public String index(ModelMap modelMap) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT r.staff.id, SUM(case when r.type=1 then 1 else 0 end)-SUM(case when r.type=0 then 1 else 0 end) as m FROM Record r where r.type = 1 GROUP BY r.staff.id order by m desc";
		Query query = session.createQuery(hql);
		List<Staff> listStaff = new ArrayList<Staff>();
		try {
			@SuppressWarnings("unchecked")
			List<Object[]> list = query.list();
			for (Object[] object : list) {
				Staff staff = staffDAO.getInfoStaff(object[0].toString());
				staff.setDepart(departDAO.getInfoById(staff.getDepart().getId()));
				listStaff.add(staff);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		modelMap.addAttribute("topStaff",listStaff);
		
		return "home/index";
	}

}
