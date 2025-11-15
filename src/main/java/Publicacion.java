import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Entity
@Table(name = "Publicacion")
@Getter
@Setter
@NoArgsConstructor
public class Publicacion implements Serializable {
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_publicacion")
	private long idPublicacion;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(
		name = "id_usuario",
		unique = true
	)
	private Usuario user;

	@Column(name = "titulo", nullable = false)
	private String titulo;

	@Column(name = "contenido", nullable = false)
	private String contenido;

	@Column(name = "fecha_creacion", nullable = false)
	private Date fechaCreacion;	

	private static long serialUID = 1L; 

    public Publicacion(Usuario user, String titulo, String contenido,
                       Date fechaCreacion)
    {
        this.user = user;
        this.titulo = titulo;
        this.contenido = contenido;
        this.fechaCreacion = fechaCreacion;
    }

    public static class crud {
        public static void create(Publicacion u) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                em.persist(u);
                tx.commit();
            }
        }

        public static Publicacion get(long id) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Publicacion u = em.find(Publicacion.class, id);

                tx.commit();
                return u;
            }
        }

        public static List<Publicacion> getAll() {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Query q = em.createQuery("select u from Publicacion u", Publicacion.class);
                List<Publicacion> list = (List<Publicacion>) q.getResultList();

                tx.commit();
                return list;
            }
        }

        public void delete(long id) {
            try (EntityManager em = JpaUtil.getEntityManager()) {
                EntityTransaction tx = em.getTransaction();
                tx.begin();

                Publicacion u = em.find(Publicacion.class, id);

                em.remove(u);
                tx.commit();
            }
        }

        public void update(Publicacion u) {
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

