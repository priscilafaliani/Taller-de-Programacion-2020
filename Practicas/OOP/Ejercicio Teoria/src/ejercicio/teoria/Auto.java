package ejercicio.teoria;

public class Auto {
    private int patente;
    private String dueño;

    public Auto(int patente, String dueño) {
        this.patente = patente;
        this.dueño = dueño;
    }

    public int getPatente() {
        return patente;
    }

    public String getDueño() {
        return dueño;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String toString() {
        return "Patente: "+patente+ " Dueño: "+dueño; 
    }



}
