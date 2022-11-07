//Mouseclick to progress animations
//Change necessary inputs throughout code indicated by '@'

int size;
int frame;
PImage[] images; 
PGraphics canvas;

void setup() {
  size(1080, 1080);
  frame = 0;
  canvas = createGraphics(1080, 1080);

  File folder = new File("/Users/@USER-NAME/@TARGET-FOLDER-PATH/@TARGET-FOLDER-NAME"); //create 'folder' from target folder's file path
  File[] listOfFiles = folder.listFiles(); //create array from items in 'folder'
  java.util.Arrays.sort(listOfFiles);  //sort 'folder' items by name
  
  size = new File("/Users/@USER-NAME/@TARGET-FOLDER-PATH/@TARGET-FOLDER-NAME").list().length; //counts how many images are in original folder
  images = new PImage [size]; //creates array to store images
  
  int i = 0;
  for (File file : listOfFiles) { //loads files in array
    images[i] = loadImage(file.getName());
    i++;
  }
  println("File size: " + size); //verify file size matches array saize
  println("Array size: " + images.length);
}


void draw() {
image(images[0],0,0);
    canvas.beginDraw();

    /*
Insert code here that manipulates the canvas.
    */
    
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
