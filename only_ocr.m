 image   = imread('test2.jpg');
 grayImage = rgb2gray(image);
 
     ocrResults  = ocr(grayImage)
     recognizedText = ocrResults.Text;
     figure;
     imshow(grayImage);
     text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);