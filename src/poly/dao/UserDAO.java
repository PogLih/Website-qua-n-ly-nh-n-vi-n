package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.entity.User;

@Repository
@Transactional
public class UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllUser(String username) {

		Session session = sessionFactory.getCurrentSession();
		List<User> list = null;
		try {
			Criteria criteria = session.createCriteria(User.class);
			if (!username.equals("")) {
				criteria.add(Restrictions.like("username", username + "%"));
			}
			list = criteria.list();
			return list;
		} catch (HibernateException e) {
			System.out.println("Get All User: " + e.toString());
			return null;
		}
	}

	public User getInfoByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		User user = null;
		try {
			user = (User) session.get(User.class, username);
		} catch (HibernateException e) {
			System.out.println("Get Info By Username: " + e.toString());
		}
		return user;
	}

	public boolean addUser(User user) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			System.out.println("Add User: " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public boolean updateUser(User user) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			System.out.println("Update User: " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public boolean deleteUser(String username) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.delete(getInfoByUsername(username));
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			System.out.println("Delete User: " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

}
