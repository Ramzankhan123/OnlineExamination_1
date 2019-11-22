/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Questions;
import Bean.Questions_option;
import Bean.Subject;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ramzan khan
 */
public class OptionOperation implements OptionDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public OptionOperation() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public long insert(Questions_option questions_option) {
        tr = ss.beginTransaction();
        long l = (Long) ss.save(questions_option);
        tr.commit();
        if (l > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public long upDate(long id, Questions_option questions_option) {
        tr = ss.beginTransaction();
        questions_option.setOption_id(id);
        try {
            ss.update(questions_option);
            tr.commit();
            return id;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(long id) {
        tr = ss.beginTransaction();
        Questions_option qo = new Questions_option();
        qo.setOption_id(id);
        try {
            ss.delete(qo);
            tr.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Questions_option selectOption(int id) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Questions_option where id=" + id;
        Query query = ss.createQuery(hql);
        Questions_option qo = (Questions_option) query.uniqueResult();
        if (qo != null) {
            return qo;
        }
        return null;
    }

    @Override
    public List selectAllOptions() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Questions_option";
        Query query = ss.createQuery(hql);
        List< Questions_option> li = query.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List searchByName(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Questions_option searchById(long id) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Questions_option where id=" + id;
        Query query = ss.createQuery(hql);
        Questions_option qo = (Questions_option) query.uniqueResult();
        if (qo != null) {
            return qo;
        }
        return null;
    }

    @Override
    public List searchByQuestions(Questions qo) {
        Criteria criteria = ss.createCriteria(Questions_option.class);
        criteria.add(Restrictions.eq("questions_no", qo));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

}
