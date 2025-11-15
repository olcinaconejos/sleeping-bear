import java.sql.Date;
import java.time.Instant;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.hibernate.Session;

public class Main {
	public static void main(String[] args) {

        try (EntityManager em = JpaUtil.getEntityManager()) {

            Date d = new Date(Instant.now().toEpochMilli());
            EntityTransaction tx = em.getTransaction();
            tx.begin();

            Usuario u = em.find(Usuario.class, 1L);
            Util

            tx.commit();
        }
	}
}

