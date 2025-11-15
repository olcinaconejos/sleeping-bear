import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Amistad")
public class Amistad implements Serializable {
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(
		name = "id_usuario1",
		referencedColumnName = "id_usuario",
		unique = true
	)
	private Usuario usuario1;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(
		name = "id_usuario2",
		referencedColumnName = "id_usuario",
		unique = true
	)
	private Usuario usuario2;

	@Column(name = "fecha_amistad", nullable = false)
	private Date fechaAmistad;	

	private static long serialUID = 1L; 

	Amistad() {
		// noop
	}	
}

