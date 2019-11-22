/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.StudentExamInfo;
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
public class StudentExameInfoImpl implements StudentExamInfoDeclaration {

    SessionFactory sf;
    Session ss;
    Transaction tr;

    public StudentExameInfoImpl() {
        sf = HelpingClass.Sessionfact.getSessionfact();
        ss = sf.openSession();
    }

    @Override
    public long insert(StudentExamInfo examInfo) {

         tr = ss.beginTransaction();
        long l = (Long) ss.save(examInfo);
        tr.commit();
        if (l > 0) {
            return 1;
        } else {
            return 0;
        }

    }

    @Override
    public int upDate(int id, StudentExamInfo exmainfo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List searchBySubject(String subjectname) {
        Criteria criteria = ss.createCriteria(StudentExamInfo.class);
        criteria.add(Restrictions.like( "sub_name" , "%" + subjectname +"%"));
        List li = criteria.list();
        if(li.size()>0){
            return li;
        }
        return null;
    }

    @Override
    public List selectAllStudentExamInformation() {
        String hql="from Bean.StudentExamInfo";
        Query query = ss.createQuery(hql);
        List<StudentExamInfo> li = query.list();
        if(li.size() > 0){
            return li;
        }
        return null;
    }

}
