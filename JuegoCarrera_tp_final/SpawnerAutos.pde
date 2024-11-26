class SpawnerAutos {
    private AutoEnemigo[] autos;

    public SpawnerAutos() {
        autos = new AutoEnemigo[5];
        for (int i = 0; i < autos.length; i++) {
            PVector nuevaPosicion = new PVector(random(220, 520), random(i * height / autos.length, (i + 0) * height / autos.length));
            autos[i] = new AutoEnemigo(nuevaPosicion, new PVector(0, 150));
        }
    }

    public void generarAutos() {
        for (AutoEnemigo auto : autos) {
            auto.display();
            auto.mover();
        }
    }

    public AutoEnemigo[] getAutos() {
        return autos;
    }
}
