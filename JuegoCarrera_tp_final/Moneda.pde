class Moneda extends GameObject implements IVisualizable {
    private PImage imagen;
    private PVector velocidad;

    public Moneda(PVector posicion, PVector velocidad) {
        super(posicion);
        this.imagen = loadImage("moneda.png");
        this.velocidad = velocidad;
    }

    public void display() {
        image(imagen, this.posicion.x, this.posicion.y, 80, 40); // Ajusta el tamaño según sea necesario
    }

    public void mover() {
        this.posicion.y += velocidad.y * Time.getDeltaTime(frameRate);
        if (this.posicion.y > height) {
            this.posicion.y = -40; // Reinicia la moneda desde arriba
        }
    }

    public PVector getPosicion() {
        return this.posicion;
    }
}
