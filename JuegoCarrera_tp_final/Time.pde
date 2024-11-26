static class Time{
  
  static float getDeltaTime(float frames){
    int framesPorSegundo = round(frames);
    float deltaTime = 1.0/framesPorSegundo;
    return deltaTime;
  }
}
