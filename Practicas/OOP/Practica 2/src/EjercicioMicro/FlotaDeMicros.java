package EjercicioMicro;

public class FlotaDeMicros {
    private final int MAX = 15;
    private Micro[] micros = new Micro[MAX];
    private int microsEnFlota;

    public FlotaDeMicros(){
        microsEnFlota = 0;
    }

    public void toStringMicros(){
        for(int i = 0; i < microsEnFlota; i++){
            System.out.println(micros[i].toString());
        }
    }

    public int getMicrosEnFlota() {
        return microsEnFlota;
    }

    /*________________general methods_________________*/
    public boolean estaCompleta(){
        return microsEnFlota == MAX;
    }

    // se asume que hay lugar para agregar
    private boolean agregar(Micro micro){
        micros[microsEnFlota++] = micro;
        return true;
    }

    // retorna true si se pudo agregar
    public boolean agregarAFlota(Micro micro){
        return microsEnFlota < MAX ? agregar(micro) : false;
    }

    // retorna el indice de un micro con patente en parametros o -1 si no existe
    public int buscarPosMicro(String patente){
        int i = 0;
        while(i < microsEnFlota && !micros[i].getPatente().equals(patente)){
            i++;
        }
        return i >= microsEnFlota ? -1 : i;
    }

    // retorna un micro buscado (segun patente) o null en caso de no existir
    public Micro buscarPatente(String patente){
        int i = 0;
        while(i < microsEnFlota && !(micros[i].getPatente().equals(patente))){
            i++;
        }
        return i >= microsEnFlota ? null : micros[i];
    }

    // retorna un micro buscado (segun destino) o null en caso de no existir
    public Micro buscarDestino(String destino){
        int i = 0;
        while(i < microsEnFlota && !(micros[i].getDestino().equalsIgnoreCase(destino))){
            i++;
        }
        return i >= microsEnFlota ? null : micros[i];
    }

    // buscar y elimina un micro si existe
    public boolean eliminarDeFlota(String patente){
        int pos = buscarPosMicro(patente);
        if(pos != -1){
            microsEnFlota--;
            for(int i = pos; i < microsEnFlota; i++){
                micros[i] = micros[i + 1];
            }
            return true;
        } return false;
    }
}
