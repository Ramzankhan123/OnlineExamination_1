/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.*;
import Bean.Questions;
import java.util.List;

/**
 *
 * @author ramzan khan
 */
public interface AnswerDeclaration {

    public long insert(Answer answer);

    public long upDate(long id, Answer answer);

    public boolean delete(long id);

    public Answer selectAnswer(long id);

    public List selectAllAnswer();

    public Answer searchbyQuestion(Questions questions);

    public List searchByStudent(Student student);

    public List WrongOrRight(String WrongOrRight);

    public List WrongOrRight(String WrongOrRight, Student student);

    public List WrongOrRight(String WrongOrRight, Student student, Subject sub);

    public List searchByStudent$language(Student student, Subject sub);
    
    public double sumOfRightAnswer(Student st,Subject sub);

}
