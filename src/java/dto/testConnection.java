/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.SQLException;
import dao.AccountDAO;
import dto.Account;

/**
 *
 * @author dkmti
 */
public class testConnection {

    public static void main(String[] args) throws SQLException, ClassNotFoundException, Exception {
        Account acc = AccountDAO.getAccount("admin@gmail.com", "1234");
        if (acc != null) {
            if (acc.getRole() == 1) {
                System.out.println("im admin");
            } else {
                System.out.println("im user");
            }
        } else {
            System.out.println("fail");
        }
    }
}