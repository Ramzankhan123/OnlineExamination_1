/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Student;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ramzan khan
 */
public interface StudentDeclaration {
    public long insertStudent(Student st);
    public long upDate(long id,Student st);
    public boolean delete(long id);
    public Student selectStudent(long id);
    public Student signIn(Student st);
    public List selectAllStudents();
    public List searchByName(String name);
    
}
