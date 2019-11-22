/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import javax.persistence.*;

/**
 *
 * @author ramzan khan
 */
@Entity
public class Answer {

    @Id
    @GeneratedValue
    private long id;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Subject subjectid;
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Student student;
    @OneToOne
    private Questions questions;
    private String WrongOrRight, answer_date;
    private String answerText;

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }

    public Answer(Subject subjectid, Student student, Questions questions, String answer_date, String answerText, String WrongOrRight) {
        this.subjectid = subjectid;
        this.student = student;
        this.questions = questions;
        this.answer_date = answer_date;
        this.answerText = answerText;
        this.WrongOrRight = WrongOrRight;
    }

    public Answer() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Subject getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(Subject subjectid) {
        this.subjectid = subjectid;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Questions getQuestions() {
        return questions;
    }

    public void setQuestions(Questions questions) {
        this.questions = questions;
    }

    public String getWrongOrRight() {
        return WrongOrRight;
    }

    public void setWrongOrRight(String WrongOrRight) {
        this.WrongOrRight = WrongOrRight;
    }

    public String getAnswer_date() {
        return answer_date;
    }

    public void setAnswer_date(String answer_date) {
        this.answer_date = answer_date;
    }

}
