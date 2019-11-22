/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Answer;
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
public class AnswerOperation implements AnswerDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public AnswerOperation() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public long insert(Answer answer) {
        tr = ss.beginTransaction();
        //System.err.println("" + st.getEmail() + st.getPassword());
        long l = (Long) ss.save(answer);
        tr.commit();
        if (l > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public long upDate(long id, Answer answer) {
        tr = ss.beginTransaction();
        answer.setId(id);
        try {
            ss.update(answer);
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
        Answer answer = new Answer();
        answer.setId(id);
        try {
            ss.delete(answer);
            tr.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Answer selectAnswer(long id) {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Questions_option where id=" + id;
        Query query = ss.createQuery(hql);
        Answer answer = (Answer) query.uniqueResult();
        if (answer != null) {
            return answer;
        }
        return null;
    }

    @Override
    public List selectAllAnswer() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
        String hql = "from Bean.Answer";
        Query query = ss.createQuery(hql);
        List<Answer> li = query.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public Answer searchbyQuestion(Questions questions) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("questions", questions));
        Answer a = (Answer) criteria.uniqueResult();
        if (a != null) {
            return a;
        }
        return null;
    }

    @Override
    public List searchByStudent(Student student) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("student", student));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return li;
    }

    @Override
    public List WrongOrRight(String WrongOrRight) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongOrRight", WrongOrRight));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return li;
    }

    @Override
    public List WrongOrRight(String WrongOrRight, Student student) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongOrRight", WrongOrRight));
        criteria.add(Restrictions.and(Restrictions.eq("student", student)));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return null;
    }

    @Override
    public List searchByStudent$language(Student student, Subject sub) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("student", student));
        criteria.add(Restrictions.and(Restrictions.eq("subjectid", sub)));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return null;
    }

    @Override
    public List WrongOrRight(String WrongOrRight, Student student, Subject sub) {
        Criteria criteria = ss.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongOrRight", WrongOrRight));
        criteria.add(Restrictions.and(Restrictions.eq("student", student)));
        criteria.add(Restrictions.and(Restrictions.eq("subjectid", sub)));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return null;
    }
    
     
     
    @Deprecated
    @Override
    public double sumOfRightAnswer(Student st, Subject sub) {
       String hql = "select sum(mark) from Answer where subject=" +sub;
       Query query = ss.createQuery(hql);
       double d = (Double) query.uniqueResult();
       if(d>0){
           return d;
       }
       return 0.0;
    }

}
