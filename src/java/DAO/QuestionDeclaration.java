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

/**
 *
 * @author ramzan khan
 */
public interface QuestionDeclaration {
    public int insert(Questions questions);

    public int update(int id, Questions questions);

    public boolean delete(int id);

    public Questions selectQuestion(int id);
    
  

    public List selectAllQuestions();

    public List selectBySubject(Subject sub); 
    public List selectNotIn(Subject sub,Student st);
    public double SumOfMarks(Subject sub);
    
}
