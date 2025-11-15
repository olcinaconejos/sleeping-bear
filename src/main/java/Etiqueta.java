import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Etiqueta")
public class Etiqueta implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_etiqueta", nullable = false)
	private long idEtiqueta;

	@Column(name = "nombre", nullable = false)
	private String nombre;

	private static long serialUID = 1L; 

	Etiqueta() {
		// noop
	}	
}

