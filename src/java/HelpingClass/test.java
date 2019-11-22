/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HelpingClass;

/**
 *
 * @author ramzan khan
 */
public class test {
    public static void main(String[] args) {
        String pass = "ramzan123";
        String hashpass = BCrypt.hashpw(pass,BCrypt.gensalt(12));
         System.err.println(hashpass.length() + "  ----" +hashpass);
         System.err.println(BCrypt.checkpw(pass, hashpass));
        
    }
    
}
