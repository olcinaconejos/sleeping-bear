import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Perfil")
public class Perfil implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_perfil")
	private long idPerfil;

	@OneToOne(mappedBy = "Perfil")
	@JoinColumn(
		name = "id_usuario",
		referencedColumnName = "id_usuario",
		unique = true
	)
	private Usuario user;

	@Column(name = "foto_url", nullable = false)
	private String fotoUrl;

	@Column(name = "biografia", nullable = false)
	private String biografia;

	@Column(name = "fecha_registro", nullable = false)
	private Date fechaRegistro;	

	private static long serialUID = 1L; 

	Perfil() {
		// noop
	}	
}

