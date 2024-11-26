private static final int LIMITE_MONEDAS = 1;

import ddf.minim.*;
import processing.sound.*;
private AudioPlayer perdiste;
private AudioPlayer ganaste;
private Minim minim;
private AudioPlayer player;
private AudioPlayer coin;
private AudioPlayer inicio;
private PantallaInicio pi;
private Escenario e;
private Moneda m;
private Auto a;
private SpawnerAutos sp;
private int estado;

void setup() {
    size(900, 900);
  
    pi = new PantallaInicio(new PVector(0, 0));
    a = new Auto(new PVector(400, 740), new PVector(450, 450), 75);
    m = new Moneda(new PVector(random(200, 500), 0), new PVector(0, 200));
    estado = MaquinaEstados.INICIO;
    minim = new Minim(this);
    sp = new SpawnerAutos();
    player = minim.loadFile("tema.mp3");
    coin = minim.loadFile("coin.mp3");
    inicio = minim.loadFile("inicio.mp3");
     perdiste = minim.loadFile("perdiste.mp3");
    ganaste = minim.loadFile("ganaste.mp3");
    frameRate(90);
    inicio.play();
    inicio.loop();
}

void draw() {
        switch (estado) {
        case MaquinaEstados.INICIO:
            background(200);
            if (!inicio.isPlaying()) {
                inicio.rewind();
                inicio.play();
            }
            pi.display();
            break;
            case MaquinaEstados.PERDIENDO:
    pi.displayGameOver(); // Llama a la pantalla de Game Over
    break;

case MaquinaEstados.GANANDO:
    pi.displayVictory(); // Llama a la pantalla de victoria
    break;

       case MaquinaEstados.JUGANDO:
    background(200);
    e.display();
    sp.generarAutos();
    m.display();
    m.mover();
    a.actualizar();
    a.display();

    for (AutoEnemigo enemigo : sp.getAutos()) {
        if (a.colisionaCon(enemigo)) {
            estado = MaquinaEstados.PERDIENDO;
        }
    }

    if (a.obtenerMoneda(m)) {
        a.incrementarScore();
        coin.rewind();
        coin.play();
        m = new Moneda(new PVector(random(200, 500), 0), new PVector(0, 200));
    }

    // Verificar condición de victoria
    if (a.getScore() >= LIMITE_MONEDAS) {
        estado = MaquinaEstados.GANANDO;
    }

    fill(0);
    textSize(30);
    text("SCORE: " + a.getScore(), 750, 50);
    break;
        }
}


void keyPressed() {
    if (keyCode == ENTER && (estado == MaquinaEstados.INICIO || estado == MaquinaEstados.PERDIENDO)) {
        estado = MaquinaEstados.JUGANDO;
        inicio.pause();
        e = new Escenario(new PVector(-126, 5));
        player.play();
    }

    if (key == 'a' || keyCode == LEFT) {
        a.mover(0);
    }
    if (key == 'd' || keyCode == RIGHT) {
        a.mover(1);
    }
    if (key == 'w' || keyCode == UP) {
        a.mover(2);
    }
    if (key == 's' || keyCode == DOWN) {
        a.mover(3);
    }
}
