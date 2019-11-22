/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.*;
import Bean.Subject;

/**
 *
 * @author ramzan khan
 */

@Entity
public class Questions {
    @Id
    @GeneratedValue
    private int question_id;
    
   
    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL,targetEntity = Subject.class )
    //@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private Subject subject ; 

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    private byte marks;

    public Questions(byte marks, String question_type, String question_text, String answer_text) {
        this.marks = marks;
        this.question_type = question_type;
        this.question_text = question_text;
        this.answer_text = answer_text;
    }
    private String question_type,question_text,answer_text;

    public Questions() {
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

 

    public byte getMarks() {
        return marks;
    }

    public void setMarks(byte marks) {
        this.marks = marks;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    public String getAnswer_text() {
        return answer_text;
    }

    public void setAnswer_text(String answer_text) {
        this.answer_text = answer_text;
    }

   

   
    
    
}
