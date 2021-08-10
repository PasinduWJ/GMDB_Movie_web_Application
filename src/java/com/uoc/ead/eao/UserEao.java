
package com.uoc.ead.eao;

import com.uoc.ead.entity.UserDetails;
import java.util.ArrayList;
import java.util.List;

public interface UserEao {
    
    public boolean insertUser(UserDetails user);
    public int upDate(long id, UserDetails user);
    public boolean delete(String userName);
    public UserDetails selectUser(long id);
    public List<UserDetails> getAllUser();
    public boolean searchbyName(String userName);
    public boolean logIn(String userName, String password);
    
}
