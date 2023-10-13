import processing.video.*;
import java.nio.file.*;

int size;
int frame;
PImage[] images;
PGraphics canvas;

void setup() {
  size(640, 480);
  frame = 0;
  canvas = createGraphics(1080, 1080);
  
  File folder = new File("/Users/jinggreen/Desktop/sorted");
  File[] listOfFiles = folder.listFiles();
  java.util.Arrays.sort(listOfFiles);
  
  size = 0;
  for (File file : listOfFiles) {
    String fileName = file.getName().toLowerCase();
    if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png") || fileName.endsWith(".gif") || fileName.endsWith(".bmp")) {
      size++;
    }
  }
  
  images = new PImage[size];
  int i = 0;
  for (File file : listOfFiles) {
    String fileName = file.getName().toLowerCase();
    if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png") || fileName.endsWith(".gif") || fileName.endsWith(".bmp")) {
      images[i] = loadImage(file.getAbsolutePath());
      i++;
    }
  }
  
  println("File size: " + size);
  println("Array size: " + images.length);
}

void draw() {
  image(images[0], 0, 0);
  canvas.beginDraw();
  if (mousePressed) {
    if (frame < size) {
      canvas.image(images[frame], 0, 0);
      frame++;
    }
  }
  
  canvas.endDraw();
  
  image(canvas, 0, 0);

}
