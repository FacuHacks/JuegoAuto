class Auto extends GameObject implements IVisualizable {
    private PVector velocidad;
    private PImage imagen;
    private int tamanio;
    private int score;
    private PVector direccion;

    public Auto(PVector posicion, PVector velocidad, int tamanio) {
        super(posicion);
        this.velocidad = velocidad.mult(0.3);
        this.tamanio = max(tamanio, 40);
        this.imagen = loadImage("AutoNaranja.png");
        this.score = 0;
        this.direccion = new PVector(0, 0);
    }

    public void display() {
        image(imagen, this.posicion.x, this.posicion.y, 50, 80);
    }

    public void mover(int direccion) {
        if (direccion == 0) this.direccion.set(-1, 0);
        else if (direccion == 1) this.direccion.set(1, 0);
        else if (direccion == 2) this.direccion.set(0, -2);
        else if (direccion == 3) this.direccion.set(0, 1);
    }

    public void actualizar() {
        this.posicion.x += this.direccion.x * this.velocidad.x * Time.getDeltaTime(frameRate);
        this.posicion.y += this.direccion.y * this.velocidad.y * Time.getDeltaTime(frameRate);
        this.posicion.x = constrain(this.posicion.x, 0, width - tamanio);
        this.posicion.y = constrain(this.posicion.y, 0, height - tamanio);
    }

    public int getScore() {
        return this.score;
    }

    public void incrementarScore() {
        this.score++;
    }
public boolean obtenerMoneda(Moneda moneda) {
    float autoX = this.posicion.x;
    float autoY = this.posicion.y;
    float autoWidth = 50; // Ancho del auto
    float autoHeight = 80; // Altura del auto

    float monedaX = moneda.getPosicion().x;
    float monedaY = moneda.getPosicion().y;
    float monedaWidth = 80; // Ancho de la moneda
    float monedaHeight = 40; // Altura de la moneda

    // Detecta colisión entre los bordes del auto y de la moneda
    return autoX < monedaX + monedaWidth && autoX + autoWidth > monedaX &&
           autoY < monedaY + monedaHeight && autoY + autoHeight > monedaY;
}

public boolean colisionaCon(AutoEnemigo enemigo) {
    float autoX = this.posicion.x;
    float autoY = this.posicion.y;
    float autoWidth = 50;  // Ancho del auto rojo
    float autoHeight = 80; // Altura del auto rojo

    float enemigoX = enemigo.getPosicion().x;
    float enemigoY = enemigo.getPosicion().y;
    float enemigoWidth = 50;  // Ancho del auto enemigo
    float enemigoHeight = 80; // Altura del auto enemigo

    // Detectar colisión entre los bordes del auto rojo y el enemigo
    return autoX < enemigoX + enemigoWidth && autoX + autoWidth > enemigoX &&
           autoY < enemigoY + enemigoHeight && autoY + autoHeight > enemigoY;
}
}
