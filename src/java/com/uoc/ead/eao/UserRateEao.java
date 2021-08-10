
package com.uoc.ead.eao;

import com.uoc.ead.entity.UserRate;
import java.util.List;

/**
 *
 * @author PASINDU-PC
 */
public interface UserRateEao {
    
    
    boolean addReview(UserRate userRate, int movieId, String userName);
    boolean isPurchUser(int movieId, String userName);
    List<UserRate> getUserRates(int purId);
}
