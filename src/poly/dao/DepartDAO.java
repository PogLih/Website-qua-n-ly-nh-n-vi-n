package poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import poly.entity.Depart;

@Transactional
@Repository
public class DepartDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<Depart> getListDepart() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Depart.class);
		List<Depart> list = (List<Depart>) criteria.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Depart> getListDepart(String id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Depart.class);
		criteria.add(Restrictions.eq("id", id));
		List<Depart> list = (List<Depart>) criteria.list();
		return list;
	}

	public Depart getInfoById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Depart depart = (Depart) session.get(Depart.class, id);
		return depart;
	}

	public boolean insertDepart(Depart depart) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.save(depart);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Insert Depart Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean updateDepart(Depart depart) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.update(depart);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Update Depart Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean deleteDepart(Depart depart) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			
			session.delete(depart);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Delete Depart Exception: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}
}
