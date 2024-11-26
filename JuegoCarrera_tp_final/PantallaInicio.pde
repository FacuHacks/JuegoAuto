public class PantallaInicio extends GameObject implements IVisualizable {
    private PFont tipografia;
    private PImage imagen, auto, auto2, imagen1, imagenVictoria, imagenDerrota;

    public PantallaInicio(PVector posicion) {
        super(posicion);
        this.tipografia = createFont("Crang.ttf", 95);
        this.imagen = loadImage("fondo.jpg");
        this.auto = loadImage("AutoNaranja.png");
        this.auto2 = loadImage("AutoAzul.png");
        this.imagen1 = loadImage("victoria.jpg");
        this.imagenVictoria = loadImage("victoria.jpg"); // Nueva imagen de victoria
        this.imagenDerrota = loadImage("derrota.jpg");   // Nueva imagen de derrota
    }

    public void display() {
        // Pantalla de inicio
        image(imagen, 0, -150, 905, 1500);
        fill(#FFF303);
        textFont(tipografia);
        textAlign(CENTER);
        textSize(95);
        text("ROAD FIGHTER", width / 2, height / 2 - 200);
        textSize(20);
        text("PRESIONE ENTER PARA COMENZAR", width / 2, height / 2 + 300);
    }

    public void displayGameOver() {
        // Detener otros audios y reproducir "perdiste"
        if (inicio.isPlaying()) inicio.pause();
        if (player.isPlaying()) player.pause();
        if (!perdiste.isPlaying()) {
            perdiste.rewind();
            perdiste.play();
        }

        // Mostrar pantalla de Game Over con nueva imagen
        image(imagenDerrota, 0, -150, 905, 1500); // Usar imagen de derrota
        fill(#FA0808);
        textFont(tipografia);
        textSize(30);
        textAlign(CENTER);
        text("GAME OVER", width / 2, height / 2 - 200);
    }

    public void displayVictory() {
        // Detener otros audios y reproducir "ganaste"
        if (inicio.isPlaying()) inicio.pause();
        if (player.isPlaying()) player.pause();
        if (!ganaste.isPlaying()) {
            ganaste.rewind();
            ganaste.play();
        }

        // Mostrar pantalla de victoria con nueva imagen
        image(imagenVictoria, 0, -150, 905, 1800); // Usar imagen de victoria
        fill(#0BFA00);
        textFont(tipografia);
        textSize(50);
        textAlign(CENTER);
        text("¡FELICITACIONES, GANASTE!", width / 2, height / 2 - 200);
    }
}
