package poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import poly.entity.Staff;

@Transactional
@Controller
public class StaffDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<Staff> getListStaff() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Staff.class);
		List<Staff> list = (List<Staff>) criteria.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Staff> getListStaff(String id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Staff.class);
		criteria.add(Restrictions.like("id", id));
		List<Staff> list = (List<Staff>) criteria.list();
		return list;
	}

	public Staff getInfoStaff(String staffId) {
		Session session = sessionFactory.openSession();
		Staff staff = (Staff) session.get(Staff.class, staffId);
		session.close();
		return staff;
	}

	public boolean insertStaff(Staff staff) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(staff);
			session.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	public boolean updateStaff(Staff staff) {
		if (getInfoStaff(staff.getId()) == null) {
			return false;
		}
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(staff);
			session.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	public boolean deleteStaff(String staffId) {
		Staff staff = getInfoStaff(staffId);
		if (staff == null) {
			return false;
		}
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(staff);
			session.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
}
