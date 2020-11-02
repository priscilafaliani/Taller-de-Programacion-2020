package ejercicio.teoria.pkg2;

public class Estacionamiento {
    String nombre;
    String direccion;
    String apertura;
    String cierre;
    Auto[][] estacionamiento;

    public Estacionamiento(String nombre, String direccion){
        this.nombre = nombre;
        this.direccion = direccion;
        apertura = "8:00";
        cierre = "21:00";
        estacionamiento = new Auto[5][10];
    }

    public Estacionamiento(String nombre, String direccion, String apertura, String cierre, int pisos, int plazas){
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = apertura;
        this.cierre = cierre;
        estacionamiento = new Auto[pisos][plazas];
    }

    public void registrarAuto(Auto auto, int piso, int plaza){
        estacionamiento[piso][plaza] = auto;
    }

    public String buscarAuto(int patente){
        int i = 0, j = 0;
        while((i < estacionamiento.length) && (estacionamiento[i][j] != null) && (estacionamiento[i][j].getPatente() != patente)){
            j++;
            if(j >= estacionamiento[i].length){
                j = 0;
                i++;
            }
        }
        if(i >= estacionamiento.length) {
            return "Auto inexistente";
        } else {
            return "El auto se encuentra en piso " + i + " en la plaza " + j; 
        }
    }

    public String toString(){
        String representacion = "";
        for(int i = 0; i < estacionamiento.length; i++){
            for(int j = 0; j < estacionamiento[i].length; j++){
                if(estacionamiento[i][j] == null){
                    representacion += "Piso " + i + " Plaza " + j + ": Plaza libre. ";
                } else {
                    representacion += "Piso " + i + " Plaza " + j + ": " + estacionamiento[i][j].toString();
                }
            }
        }
        return representacion;
    }
}
