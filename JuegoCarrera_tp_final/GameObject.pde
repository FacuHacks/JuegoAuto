abstract class GameObject {
  protected PVector posicion;
  
  public GameObject(PVector posicion) {
    this.posicion=posicion;
  }
  public PVector getPosicion() {
    return this.posicion;
  }
}
