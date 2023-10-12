import processing.video.*;
import com.hamoid.VideoExport;


int size;
int frame;
PImage[] images;
PGraphics canvas;
boolean recording = false;
VideoExport videoExport;

void setup() {
  size(640, 480);
  frame = 0;
  canvas = createGraphics(1080, 1080);
  
  File folder = new File("/Users/jinggreen/Desktop/imgSeq");
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
  
  // Initialize VideoExport with the desired settings
  videoExport = new VideoExport(this);
  videoExport.setMovieFileName("output.mp4");
  videoExport.setFrameRate(30); // Adjust the frame rate as needed
  videoExport.setQuality(80,100); // Adjust the quality as needed
  videoExport.startMovie();
}

void draw() {
  image(images[0], 0, 0);
  canvas.beginDraw();
  
  // Insert code here that manipulates the canvas.
  
  if (mousePressed) {
    if (frame < size) {
      canvas.image(images[frame], 0, 0);
      frame++;
    }
    if (frame >= size) {
      frame = 0;
      recording = true;
    }
  }
  
  canvas.endDraw();
  
  image(canvas, 0, 0);
  
  // Check if we are recording and save the current frame
  if (recording) {
    videoExport.saveFrame();
  }
  
  // Stop recording when the frame count matches the image count
  if (frame >= size) {
    recording = false;
    videoExport.endMovie();
    exit(); // Close the sketch
  }
}
