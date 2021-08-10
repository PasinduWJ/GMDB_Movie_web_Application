
package com.uoc.ead.eao;

import com.uoc.ead.entity.Purchas;
import com.uoc.ead.entity.UserRate;
import java.util.List;

/**
 *
 * @author PASINDU-PC
 */
public interface PurchasEao {
    
    boolean purch(String userName, int movieId);
    List<Purchas> getPurchMovie(int movieId); 
    List<Purchas> getPurchUser(String userName); 
    List<Purchas> getUserInMovie(String movieId);
    void deletePurchByUserName(String userName);
    
}
