import java.io.Serializable;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Data
@Entity
public class PublicacionEtiqueta implements Serializable {
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(
		name = "id_publicacion",
		referencedColumnName = "id_publicacion",
		unique = true
	)
	private Publicacion publicacion;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(
		name = "id_etiqueta",
		referencedColumnName = "id_etiqueta",
		unique = true
	)
	private Etiqueta etiqueta;

	private static long serialUID = 1L; 

	PublicacionEtiqueta() {
		// noop
	}	
}

