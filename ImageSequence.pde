//Mouseclick to progress animationss

int size;
int frame;
PImage[] images; 
PGraphics canvas;

void setup() {
  size(1080, 1080);
  frame = 0;
  canvas = createGraphics(1080, 1080);

  File folder = new File("/Users/jinggreen/Desktop/Snake_Loop"); //create 'folder' from target folder's file path
  File[] listOfFiles = folder.listFiles(); //create array from items in 'folder'
  java.util.Arrays.sort(listOfFiles);  //sort 'folder' items by name
  
  size = new File("/Users/jinggreen/Desktop/Snake_Loop").list().length;
  images = new PImage [size]; 
  
  int i = 0;
  for (File file : listOfFiles) {
    images[i] = loadImage(file.getName());
    i++;
  }
  println("File size: " + size);
  println("Array size: " + images.length);
}


void draw() {
image(images[0],0,0);
    canvas.beginDraw();
    
if(mousePressed) {  //progress animation on mousePressed
  if (frame<size) {
    canvas.image(images[frame],0,0);
    //canvas.save(frame+".png"); //uncomment to save files
    frame++;
  }
}
   
    canvas.endDraw();
    
   image(canvas,0,0);
   
}
