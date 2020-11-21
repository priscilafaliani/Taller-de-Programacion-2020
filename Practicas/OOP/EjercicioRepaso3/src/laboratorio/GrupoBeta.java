package laboratorio;

public class GrupoBeta extends Grupo {

    public GrupoBeta() {
        super();
    }

    @Override
    public void aplicarDosis(double dosis) {
        Planta[] plantas = getPlantas();
        for (int i = 0; i < getPlantasActuales(); i++) {
            if (plantas[i].getAlcaloides() < 0.3) {
                plantas[i].aplicarDosis(dosis);
            }
        }
    }
}
