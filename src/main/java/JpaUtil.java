import jakarta.persistence.Persistence;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityManager;

public class JpaUtil {
	private static final EntityManagerFactory emf = 
		Persistence.createEntityManagerFactory("persistenceUnit");

	public static EntityManager getEntityManager() {
		return emf.createEntityManager();
	}

	public static void close() {
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
	}
}

