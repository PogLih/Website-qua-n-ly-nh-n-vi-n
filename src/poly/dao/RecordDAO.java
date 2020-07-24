package poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import poly.entity.Record;

@Transactional
@Repository
public class RecordDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<Record> getListRecord() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Record.class);
		criteria.addOrder((Order.desc("date")));
		List<Record> list = criteria.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Record> getListRecord(boolean type) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Record.class);
		criteria.add(Restrictions.eq("type", type));
		criteria.addOrder((Order.desc("date")));
		List<Record> list = criteria.list();
		return list;
	}

	public Record getInfoRecord(int recordId) {
		Session session = sessionFactory.getCurrentSession();
		Record record = (Record) session.get(Record.class, recordId);
		return record;
	}

	public boolean insertRecord(Record record) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(record);
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

	public boolean updateRecord(Record record) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(record);
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
	
	public boolean deleteRecord(int recordId) {
		Record record = getInfoRecord(recordId);
		if (record == null) {
			return false;
		}
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(record);
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
