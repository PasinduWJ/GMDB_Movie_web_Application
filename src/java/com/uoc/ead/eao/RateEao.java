
package com.uoc.ead.eao;

import com.uoc.ead.entity.Movie;

/**
 *
 * @author PASINDU-PC
 */
public interface RateEao {
    
    void update(Movie movie, int newRate);
}
