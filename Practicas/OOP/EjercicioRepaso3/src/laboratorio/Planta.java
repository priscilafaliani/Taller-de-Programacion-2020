package laboratorio;

public class Planta {
    private final int ID;
    private final String name;
    private double dosis;
    private double alcaloides;

    public Planta(String name, int ID) {
        this.ID = ID;
        this.name = name;
        this.alcaloides = 0;
        setDosis(0);
    }

    public int getID() {
        return ID;
    }

    public double getAlcaloides() {
        return alcaloides;
    }

    public void aplicarDosis(double dosis) {
        setDosis(dosis);
        actualizarAlcaloides();
    }

    private void setDosis(double dosis) {
        this.dosis = dosis;
    }

    private void actualizarAlcaloides() {
        this.alcaloides = Math.random();
    }

    @Override
    public String toString() {
        return "ID: " + ID + ".\nEspecie: " + name + ".\nUltima dosis: " + dosis + "\nUltimo nivel de alcaloides: " + alcaloides + ".\n";
    }
}
