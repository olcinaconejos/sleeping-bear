import java.util.List;

public class Utils {
	public static <T> void mostrar(T x, boolean recursive) {
		if (x.getClass() == Publicacion.class) {
			Publicacion pub = (Publicacion) x;
			System.out.println(pub);

			System.out.println("Referenciado por: ");
			if (recursive) {
				Publicacion.crud.getAll().stream()
					.filter(p -> p.getIdPublicacion())
					.forEach(System.out::println);

			}
		} else if (x.getClass() == Usuario.class) {
			Usuario usr = (Usuario) x;
			System.out.println(usr);

		}

	}
}
