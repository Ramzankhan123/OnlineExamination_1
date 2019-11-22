/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Questions_option;
import Bean.Questions;
import java.util.List;

/**
 *
 * @author ramzan khan
 */
public interface OptionDeclaration {

    public long insert(Questions_option questions_option);

    public long upDate(long id, Questions_option questions_option);

    public boolean delete(long id);
    
    public Questions_option selectOption(int id);
    
    public List selectAllOptions();
    
    public List searchByName(String name);
    
    public Questions_option searchById(long id);
    
    public List searchByQuestions(Questions qo);
   
  

}
