/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.StudentExamInfo;
import java.util.List;

/**
 *
 * @author ramzan khan
 */
public interface StudentExamInfoDeclaration {
     public long insert(StudentExamInfo examInfo);
     public int upDate(int id,StudentExamInfo exmainfo);
     public boolean delete(long id);
     public List searchBySubject(String subjectname);
     public List selectAllStudentExamInformation();
     
    
}
