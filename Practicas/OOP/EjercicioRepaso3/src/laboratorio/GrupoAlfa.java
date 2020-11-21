package laboratorio;

public class GrupoAlfa extends Grupo{

    public GrupoAlfa() {
        super();
    }

    @Override
    public void aplicarDosis(double dosis) {
        Planta[] plantas = getPlantas();
        for (int i = 0; i < getPlantasActuales(); i++) {
            plantas[i].aplicarDosis(dosis);
        }
    }
}
