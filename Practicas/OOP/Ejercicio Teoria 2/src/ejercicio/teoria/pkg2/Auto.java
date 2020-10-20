package ejercicio.teoria.pkg2;

public class Auto {
    private int patente;
    private String dueño;

    public Auto() {
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

    @Override
    public String toString() {
        return "Patente: "+ patente + " Dueño: " + dueño + ". "; //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}