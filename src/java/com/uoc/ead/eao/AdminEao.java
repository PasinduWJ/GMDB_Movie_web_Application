
package com.uoc.ead.eao;

import com.uoc.ead.entity.Admin;

public interface AdminEao {
    void create(Admin admin);
    boolean logAdmin(String userName, String password);
}
