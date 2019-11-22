/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

/**
 *
 * @author ramzan khan
 */
@Entity
@Table(name = "Student")
public class Student implements Serializable {

    public Student() {

    }

    @Id
    @GeneratedValue
    private long s_id;

    private String name, address, contact, admission_date, course, password;

    private double fees;
    @Column(unique = false)
    @ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL,targetEntity = Subject.class)
    private Set<Subject> subjectlist = new HashSet<Subject>(10);

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    public Student(String name, String address, String email, String contact, double fees, String admission_date, String course, String password) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.contact = contact;
        this.fees = fees;
        this.admission_date = admission_date;
        this.course = course;
        this.password = password;

    }

    public long getS_id() {
        return s_id;
    }

    public void setS_id(long s_id) {
        this.s_id = s_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAdmission_date() {
        return admission_date;
    }

    public void setAdmission_date(String admission_date) {
        this.admission_date = admission_date;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getFees() {
        return fees;
    }

    public void setFees(double fees) {
        this.fees = fees;
    }

    public Set<Subject> getSubjectlist() {
        return subjectlist;
    }

    public void setSubjectlist(Set<Subject> subjectlist) {
        this.subjectlist = subjectlist;
    }

}
