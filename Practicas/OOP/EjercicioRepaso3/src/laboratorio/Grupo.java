package laboratorio;

import java.util.Arrays;

public abstract class Grupo {
    private final int maxPlantas = 10;
    private final Planta[] plantas = new Planta[maxPlantas];
    private int plantasActuales = 0;

    public void agregarPlanta(Planta p) {
        if (!estaLleno()) {
            plantas[plantasActuales++] = p;
        }
    }

    public Planta obtenerPorID(int ID) {
        for (int i = 0; i < plantasActuales; i++) {
            if (plantas[i].getID() == ID) {
                return plantas[i];
            }
        }

        return null;
    }

    public int getPlantasActuales() {
        return plantasActuales;
    }

    public Planta[] getPlantas() {
        return plantas;
    }

    public boolean estaLleno() {
        return plantasActuales == maxPlantas;
    }

    public abstract void aplicarDosis(double dosis);

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder(plantasActuales);
        for (int i = 0; i < plantasActuales; i++) {
            str.append(plantas[i]).append("\n");
        }
        return str.toString();
    }
}
