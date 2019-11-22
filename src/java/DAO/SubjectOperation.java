/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Bean.Subject;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ramzan khan
 */
public class SubjectOperation implements SubjectDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public SubjectOperation() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public long insertSubject(Subject sub) {
       tr = ss.beginTransaction();
       // System.err.println("" + sub.getSub_name() + sub.getSub_total_questions());
        int l = (Integer) ss.save(sub);
        tr.commit();
        if (l > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public long update(int id, Subject sub) {
         sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        sub.setSub_id(id);
        try {
            ss.update(sub);
            tr.commit();
            return id;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(int id) {
        tr = ss.beginTransaction();
        Subject sub = new Subject();
        sub.setSub_id(id);
        try {
            ss.delete(sub);
            tr.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Subject selectSubject(int id) {
        tr = ss.beginTransaction();
        Subject sub = (Subject) ss.get(Subject.class, id);
        if (sub != null) {
            return sub;
        }
        return null;
    }

    @Override
    public List selectAllSubjects() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Subject";
        Query query = ss.createQuery(hql);
        List<Subject> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = ss.createCriteria(Subject.class);
        criteria.add(Restrictions.like("sub_name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        } 
          return null;
    }

    @Override
    public List searchByID(int id) {
     
        return null;
    }

}
