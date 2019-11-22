/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author ramzan khan
 */
@Entity
public class StudentExamInfo {
    @Id
    @GeneratedValue
    private long id;
    @GeneratedValue
    private int attempt;
    @OneToOne
    private Student st;
    @OneToOne
    private Subject sub;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getAttempt() {
        return attempt;
    }

    public void setAttempt(int attempt) {
        this.attempt = attempt;
    }

    public Student getSt() {
        return st;
    }

    public void setSt(Student st) {
        this.st = st;
    }

    public Subject getSub() {
        return sub;
    }

    public void setSub(Subject sub) {
        this.sub = sub;
    }

    public String getExamstatus() {
        return examstatus;
    }

    public void setExamstatus(String examstatus) {
        this.examstatus = examstatus;
    }

    public int getExamfees() {
        return examfees;
    }

    public void setExamfees(int examfees) {
        this.examfees = examfees;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    private String examstatus;

    public StudentExamInfo(Student st, Subject sub, int examfees, Date date) {
        this.st = st;
        this.sub = sub;
        this.examfees = examfees;
        this.date = date;
    }
    private int examfees;
    private Date date;

    public StudentExamInfo() {
    }
    
}
