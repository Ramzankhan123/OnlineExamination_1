/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Questions;
import Bean.Student;
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
public class QuestionOperation implements QuestionDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public QuestionOperation() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public int insert(Questions questions) {
       tr = ss.beginTransaction();
        // System.err.println("" + st.getEmail() + st.getPassword());
        int n = (Integer) ss.save(questions);
        tr.commit();          //error
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }

    @Override
    public int update(int id, Questions questions) {
      tr = ss.beginTransaction();
        questions.setQuestion_id(id);
        try {
            ss.update(questions);
            tr.commit();
            return id;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(int id) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        Questions q = new Questions();
        q.setQuestion_id(id);
        try {
            ss.delete(q);
            tr.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Questions selectQuestion(int id) {
        Questions q = (Questions) ss.get(Questions.class, id);
        if (q != null) {
            return q;
        }
        return null;
    }

    @Override
    public List selectAllQuestions() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Questions";
        Query query = ss.createQuery(hql);
        List<Questions> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List selectBySubject(Subject sub) {
        Criteria criteria = ss.createCriteria(Questions.class);
        criteria.add(Restrictions.eq("subject", sub));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return null;
    }

    @Override
    public List selectNotIn(Subject sub, Student st) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Questions where question_id not in (select questions from Answer where student=" + st.getS_id() +" and subjectid= "+sub.getSub_id()+" ) and subject="+sub.getSub_id()+""; 
        Query query = ss.createQuery(hql);
        List<Questions> li = query.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public double SumOfMarks(Subject sub) {
         sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
       String hql = "select sum(marks) from Questions where subject=" +sub.getSub_id();
       Query query = ss.createQuery(hql);
       long total_marks = (Long)query.uniqueResult();
       System.err.println("---------------------------"+total_marks+"------------------------------"+sub.getSub_id());
       if(total_marks > 0){
           return total_marks;
       }
       return 0.0;
    }

}
