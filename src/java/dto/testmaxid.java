/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.PlantDAO;
import java.sql.SQLException;

/**
 *
 * @author Legion
 */
public class testmaxid {
    public static void main(String[] args) throws SQLException, ClassNotFoundException, Exception {
    int maxid= PlantDAO.getImgMaxID();
System.out.println("maxid=" + maxid);
   
       
    }
    

}
