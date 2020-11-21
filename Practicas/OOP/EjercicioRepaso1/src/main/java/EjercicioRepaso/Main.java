package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Main {
    
    public static void main(String[] args) {
        Proyecto miProyecto = new Proyecto("Proyecto Java" , 222);
    
        Director miDirector = new Director("Pedro", "Hacker");

        miProyecto.setDirector(miDirector);    
    
        Investigador investigador1 = new Investigador("Maria", "Java", 3, "Developer");
        Investigador investigador2 = new Investigador("Laura", "Beans", 2, "Manager");    
        
        Subsidio subsidio1 = new Subsidio(5000, "Trabajo muy duro");
        Subsidio subsidio2 = new Subsidio(5320, "Como un esclavo");
        
        investigador1.agregarSubsidio(subsidio1);
        investigador2.agregarSubsidio(subsidio2);
        
        miProyecto.agregarInvestigador(investigador1);
        miProyecto.agregarInvestigador(investigador2);
        
        miProyecto.otorgarTodos("Maria Java");
        
        System.out.println(miProyecto);

    }
    
}
