class Animation {
  PImage[] images;
  int imageCount;
  float frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 1) + ".png";
      images[i] = loadImage(filename);
      images[i].resize(100,150);
    }
  }

  void display(float xpos, float ypos, float rate) {
    frame = (frame+rate)%imageCount;
    image(images[floor(frame)], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
