/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Student;
import java.util.List;
//import javax.persistence.Query;

import org.hibernate.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ramzan khan
 */
public class StudentOperation implements StudentDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public StudentOperation() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public long insertStudent(Student st) {
        tr = ss.beginTransaction();
        System.err.println("" + st.getEmail() + st.getPassword());
        long l = (Long) ss.save(st);
        tr.commit();
        if (l > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    
    @Override
    public long upDate(long id, Student st) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
       // tr = ss.beginTransaction();
        st.setS_id(id);
        try {
            ss.update(st);
            tr.commit();
            return id;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    @Override
    public boolean delete(long id) {
        tr = ss.beginTransaction();
        Student st = new Student();
        st.setS_id(id);
        try {
            ss.delete(st);
            tr.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;

    }

    @Override
    public Student selectStudent(long id) {
     
        Student st = (Student) ss.get(Student.class, id);
        if (st != null) {
            return st;
        }
        return null;
    }

    @Override
    public List selectAllStudents() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Student";
        Query query = ss.createQuery(hql);
        List<Student> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = ss.createCriteria(Student.class);
        criteria.add(Restrictions.like("name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;

    }

   @Override
   public Student signIn(Student st)
   {
       try
       {
         Criteria criteria = ss.createCriteria(Student.class);
         criteria.add(Restrictions.eq("usermail", st.getEmail()));
         Student st2 =(Student) criteria.uniqueResult();
         if(st.getPassword().equals(st2.getPassword()))
         {
             return st2;
         }
         
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return null;
   }

}
