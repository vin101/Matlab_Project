 businessCard   = imread('book2.jpg');
 grayImage = rgb2gray(businessCard);
 
 %grayImage = rgb2gray(colorImage);
mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions

 
     ocrResults     = ocr(mserRegionsPixels)
     recognizedText = ocrResults.Text;
     figure;
     imshow(mserRegionsPixels);
     text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);