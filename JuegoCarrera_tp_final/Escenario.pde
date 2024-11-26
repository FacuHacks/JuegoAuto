class Escenario extends GameObject implements IVisualizable {
    private PImage ruta;

    public Escenario(PVector posicion) {
        super(posicion);
        this.ruta = loadImage("pista4.jpg");
    }

    public void display() {
        float x = (width - ruta.width) / 2.0;
        image(ruta, x, this.posicion.y);
        image(ruta, x, this.posicion.y - ruta.height);

        this.posicion.y += 150 * Time.getDeltaTime(frameRate);
        if (this.posicion.y > ruta.height) {
            this.posicion.y = 0;
        }
    }
}
