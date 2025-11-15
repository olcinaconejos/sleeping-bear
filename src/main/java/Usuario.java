import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Usuario")
public class Usuario implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_usuario")
	private long idUsuario;

	@Column(name = "nombre", nullable = false)
	private String nombre;
	
	@Column(name = "email", nullable = false)
	private String email;
	
	@Column(name = "fecha_registro", nullable = false)
	private Date fechaRegistro;	

	private static long serialUID = 1L; 

	Usuario() {
		// noop
	}

	Usuario(String nombre, String email, Date fechaRegistro) {
		this.nombre = nombre;
		this.email = email;
		this.fechaRegistro = fechaRegistro;
	}

    public static class crud {
        public static void create(Usuario u) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                em.persist(u);
                tx.commit();
            }
        }

        public static Usuario get(long id) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Usuario u = em.find(Usuario.class, id);

                tx.commit();
                return u;
            }
        }

        public static List<Usuario> getAll() {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Query q = em.createQuery("select u from Usuario u", Usuario.class);
                List<Usuario> list = (List<Usuario>) q.getResultList();

                tx.commit();
                return list;
            }
        }

        public void delete(long id) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Usuario u = em.find(Usuario.class, id);

                em.remove(u);
                tx.commit();
            }
        }

        public void update(Usuario u) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                em.merge(u);

                em.remove(u);
                tx.commit();
            }
        }
    }

}

