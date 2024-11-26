class AutoEnemigo extends GameObject implements IVisualizable {
    private PImage imagen;
    private PVector velocidad;

    public AutoEnemigo(PVector posicion, PVector velocidad) {
        super(posicion);
        this.velocidad = velocidad;
        this.imagen = loadImage("AutoAzul.png");
    }

    public void display() {
        image(imagen, this.posicion.x, this.posicion.y, 50, 80);
    }

    public void mover() {
        this.posicion.y += velocidad.y * Time.getDeltaTime(frameRate);
        if (this.posicion.y > height) {
            this.posicion.y = -80; // Reinicia en la parte superior
        }
    }

    public PVector getPosicion() {
        return this.posicion;
    }
}
